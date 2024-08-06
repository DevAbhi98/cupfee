//
//  CartItem.swift
//  Cuppfee
//
//  Created by The Seven Stallions on 29/06/22.
//

import Foundation
import SwiftUI  

struct CartItem: Identifiable, Codable{
    let id = UUID()
    let name:String?
    let coffeeName:String?
    let total:Double?
    let size:String?
    let imageURL:String?
//    @Binding var numberOfOrders:Int?
}
