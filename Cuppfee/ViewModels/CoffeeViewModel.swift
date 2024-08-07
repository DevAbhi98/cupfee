//
//  CoffeeViewModel.swift
//  Coffee App
//
//  Created by The Seven Stallions on 21/06/22.
//

import Foundation

class CoffeeListViewModel{
    var coffeeList:[CoffeeViewModel] = [CoffeeViewModel]()
}

struct CoffeeViewModel {
    
    var coffee: Coffee
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    
    var name: String {
        return self.coffee.name!
    }
    
    var imageURL: String {
        return self.coffee.imageURL!
    }
    
    var price: Double {
        return self.coffee.price!
    }
    
    
}
