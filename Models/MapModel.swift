//
//  MapModel.swift
//  Cuppfee
//
//  Created by The Seven Stallions on 02/07/22.
//

import Foundation
import MapKit

struct Address:Codable{
    let data:[Datum]
}

struct Datum:Codable{
    let latitude, longitude:Double
    let name:String?
    let region:String?
    let country:String?
}

struct  Location:Identifiable{
    let id = UUID()
    let name:String?
    let coordinate:CLLocationCoordinate2D?
    let region:String?
    let country:String?
}

class MapAPI:ObservableObject{
    private let BASE_URL = "http://api.positionstack.com/v1/forward"
    private let API_KEY = "8c0c1ad22139dc5613866e8b872a0bec"
    
    @Published var region:MKCoordinateRegion
    @Published var coordinates = []
    @Published var locations:[Location] = []
    @Published var scalingFactor:CGFloat = 1
    
    
    init(){
        self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.50, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5))
        self.locations.insert(Location(name: "Pin", coordinate: CLLocationCoordinate2D(latitude: 51.0, longitude: -0.1275), region: "paris", country: "France"), at: 0)
    }
    
    func getLocation(address:String, delta:Double, mainModel:MainViewModel, completion: @escaping (Location?) -> ()){
        let pAddress = address.replacingOccurrences(of: " ", with: "%20")
        let url_string = "\(BASE_URL)?access_key=\(API_KEY)&query=\(pAddress)"
        
        guard let url = URL(string: url_string)else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url){(data, response, error) in
            
            guard let data = data else{
                print(error!.localizedDescription)
                return
            }
            
            guard let newCoordinates = try? JSONDecoder().decode(Address .self, from: data) else { return }
            
            if newCoordinates.data.isEmpty{
                print("Could not find the address")
                return
            }
            
            DispatchQueue.main.async {
                let details = newCoordinates.data[0]
                let lattitude = details.latitude
                let longitude = details.longitude
                let name = details.name
                let region = details.region
                let country = details.country
                
                self.coordinates = [lattitude, longitude]
                self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lattitude, longitude: longitude), span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta))
                let new_location = Location(name: name ?? "Pin", coordinate: CLLocationCoordinate2D(latitude: lattitude, longitude: longitude), region: region ?? "", country: country ?? "")
                self.locations.removeAll()
                self.locations.insert(new_location, at: 0)
                print("Successfully loaded the location!")
                completion(new_location)
            }
        }.resume()
        
    }
    
}
