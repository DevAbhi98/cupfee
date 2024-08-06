//
//  MapView.swift
//  Cuppfee
//
//  Created by The Seven Stallions on 02/07/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @StateObject private var mapAPI = MapAPI()
    @State private var text = ""
    @ObservedObject var mainModel:MainViewModel
    @State var currentCity = ""
    @State var currentState = ""
    @State var currentCountry = ""
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            VStack{
                TextField("Enter an address", text: $text)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                    .padding(.top)
                    .padding(.bottom, 10)
                
                Button(action: {
                    mapAPI.getLocation(address: text, delta: 0.5, mainModel:mainModel, completion: { location in
                        currentCity = location?.name ?? ""
                        currentState = location?.region ?? ""
                        currentCountry = location?.country ?? ""
                    })
                }, label: { 
                    Text("Find Address")
                        .foregroundColor(Color("ColorTheme"))
                })
                .padding(.bottom)
                
                Map(coordinateRegion: $mapAPI.region, annotationItems: mapAPI.locations){ location in
                    MapMarker(coordinate: location.coordinate!, tint: .blue)
                }
                
            }//: MAIN VSTACK
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                        HStack {
                            Button(action: {
                                mainModel.currentCity = currentCity
                                mainModel.currentRegion = currentState
                                mainModel.currentCountry = currentCountry
                                mainModel.saveSettingsData()
                                presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Text("Save")
                                    .foregroundColor(Color("ColorTheme"))
                            })
                        }
                }
            })
            .navigationBarTitle("Select your location", displayMode: .inline)
            .ignoresSafeArea(.all, edges: .bottom)
        }
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(mainModel: MainViewModel())
    }
}
