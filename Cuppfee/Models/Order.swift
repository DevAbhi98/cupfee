//
//  Order.swift
//  Cuppfee
//
//  Created by The Seven Stallions on 28/06/22.
//

import Foundation

struct Order:Codable{	
    let name:String?
    let coffeeName:String?
    let total:Double?
    let size:String?
    let imageURL:String?
}
