//
//  OrderViewModel.swift
//  Cuppfee
//
//  Created by The Seven Stallions on 30/06/22.
//

import Foundation
import SwiftUI

class MyOrderViewModel:ObservableObject{
    
    @Published var order:CartItem
    @Published var numberObjects:Int = 1
    
    init(order:CartItem){
        self.order = order
    }
    
}

