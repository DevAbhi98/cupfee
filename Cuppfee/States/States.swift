//
//  States.swift
//  Cuppfee
//
//  Created by The Seven Stallions on 29/06/22.
//

import Foundation
import Combine

class numberOfOrders: ObservableObject {

    @Published var smallCappuccino:[Order] {
        didSet{
            UserDefaults.standard.set(smallCappuccino, forKey: "smallCappuccino")
        }
    }
    
    @Published var mediumCappuccino:[Order] {
        didSet{
            UserDefaults.standard.set(mediumCappuccino, forKey: "mediumCappuccino")
        }
    }
    
    @Published var largeCappuccino:[Order] {
        didSet{
            UserDefaults.standard.set(largeCappuccino, forKey: "largeCappuccino")
        }
    }
    
    @Published var smallExpresso:[Order] {
        didSet{
            UserDefaults.standard.set(smallExpresso, forKey: "smallExpresso")
        }
    }

    @Published var mediumExpresso:[Order] {
        didSet{
            UserDefaults.standard.set(mediumExpresso, forKey: "mediumExpresso")
        }
    }

    @Published var largeExpresso:[Order] {
        didSet{
            UserDefaults.standard.set(largeExpresso, forKey: "largeExpresso")
        }
    }

    @Published var smallRegular:[Order] {
        didSet{
            UserDefaults.standard.set(smallRegular, forKey: "smallRegular")
        }
    }

    @Published var mediumRegular:[Order] {
        didSet{
            UserDefaults.standard.set(mediumRegular, forKey: "mediumRegular")
        }
    }

    @Published var largeRegular:[Order] {
        didSet{
            UserDefaults.standard.set(largeRegular, forKey: "largeRegular")
        }
    }
    
//    @Published var largeCappuccin:[Order]? {
//        if let userData = UserDefaults.standard.value(forKey: "userObject") as? Data, let user = try? PropertyListDecoder().decode([Order].self, from: userData) {
//            return user
//        }
//        return nil
//    }

    @Published var largeCappuccin:[Order] = []
    
    func save() {
        if let encoded = try? JSONEncoder().encode(largeCappuccin) {
            UserDefaults.standard.set(encoded, forKey: "SavedData")
        }
    }
    
    init(){

        self.smallCappuccino = UserDefaults.standard.object(forKey: "smallCappuccino") as? Array ?? []
        self.mediumCappuccino = UserDefaults.standard.object(forKey: "mediumCappuccino") as? Array ?? []
        self.largeCappuccino = UserDefaults.standard.object(forKey: "largeCappuccino") as? Array ?? []
        self.smallExpresso = UserDefaults.standard.object(forKey: "smallExpresso") as? Array ?? []
        self.mediumExpresso = UserDefaults.standard.object(forKey: "mediumExpresso") as? Array ?? []
        self.largeExpresso = UserDefaults.standard.object(forKey: "largeExpresso") as? Array ?? []
        self.smallRegular = UserDefaults.standard.object(forKey: "smallRegular") as? Array ?? []
        self.mediumRegular = UserDefaults.standard.object(forKey: "mediumRegular") as? Array ?? []
        self.largeRegular = UserDefaults.standard.object(forKey: "largeRegular") as? Array ?? []
        
        if let data = UserDefaults.standard.data(forKey: "SavedData") {
                if let decoded = try? JSONDecoder().decode([Order].self, from: data) {
                    largeCappuccin = decoded
                    return
                }
        }
        
    }
    
}
