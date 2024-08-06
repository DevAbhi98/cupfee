//
//  Coffee.swift
//  Cuppfee
//
//  Created by The Seven Stallions on 28/06/22.
//

import Foundation

struct Coffee:Identifiable{
    
    var id = UUID()
    var imageURL:String?
    var name:String?
    var price:Double?
    var size:String?
    
}

extension Coffee{
    static func all() -> [Coffee]{
        return [
            Coffee(imageURL: "Cappuccino", name: "Cappuccino", price: 2.5),
            Coffee(imageURL: "Expresso", name: "Expresso", price: 2.1),
            Coffee(imageURL: "Regular", name: "Regular", price: 1.0)
        ]
    }
}
