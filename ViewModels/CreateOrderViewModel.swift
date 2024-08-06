//
//  CreateOrderViewModel.swift
//  Coffee App
//
//  Created by The Seven Stallions on 21/06/22.
//

import Foundation


class AddCoffeeOrderViewModel:ObservableObject{
    
    @Published var name:String = ""
    @Published var size:String = "Medium"
    @Published var coffeeName:String = ""
    @Published var coffeeImage:String = ""
    
    var total:Double{
        return calculatePrice()
    }
    
    func placeOrder(){
        
        let order = Order(name: name, coffeeName: coffeeName, total: total, size: size, imageURL: coffeeImage)
        
        self.webService.createCoffeeOrder(order:order , completion: { _ in
            
        })
    }
    
    private var webService:WebService
    
    var coffeeList:[CoffeeViewModel]{
        return Coffee.all().map(CoffeeViewModel.init)
    }
    
    init(){
        webService = WebService()
    }
    
    private func priceForSize() -> Double {
        let prices = ["Small":2.0, "Medium":3.0, "Large":4.0]
        return prices[self.size]!
    }
    
    func calculatePrice() -> Double{

        let coffeeVM = coffeeList.first{
            $0.name == coffeeName
        }

        if let coffeeVM = coffeeVM {
            return coffeeVM.price * priceForSize()
        }else{
            return 0.0
        }

    }
    
}
