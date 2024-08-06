//
//  MainViewModel.swift
//  Cuppfee
//
//  Created by The Seven Stallions on 30/06/22.
//

import Foundation
import SwiftUI


struct Settings:Codable{
    let currentImage:String
    let currentName:String
    let currentCart:[CartItem]
    let currentProfile:String
    let currentCountry:String
    let currentRegion:String
    let currentCity:String
    let phoneNumber:String
    let smallCappucino:Int
    let mediumCappucino:Int
    let largeCappucino:Int
    let smallExpresso:Int
    let mediumExpresso:Int
    let largeExpresso:Int
    let smallLatte:Int
    let mediumLatte:Int
    let largeLatte:Int
    let smallRegular:Int
    let mediumRegular:Int
    let largeRegular:Int
    let smallIcedC:Int
    let mediumIcedC:Int
    let largeIcedC:Int
    let smallIcedV:Int
    let mediumIcedV:Int
    let largeIcedV:Int
    let smallIcedY:Int
    let mediumIcedY:Int
    let largeIcedY:Int
    var favouriteCoffe:[String]
}


class MainViewModel:ObservableObject{
    
    private var webService:WebService
    @Published var cartOrders:[CartItem] = []
    @Published var typesOfCoffee:[String] = ["Cappuccino", "Expresso", "Regular"]
    @Published var currentImage:String = "avatar-1"
    @Published var currentCoffeeName:String = ""
    @Published var currentCoffeeImage:String = ""
    @Published var currentSize:String = ""
    @Published var currentPrice:Double = 0
    @Published var currentAvatar:String = ""
    @Published var yourName:String = ""
    @Published var avatarChanged:Bool = false
    @Published var nameChanged:Bool = false
    @Published var currentCountry = ""
    @Published var currentRegion = ""
    @Published var currentCity = ""
    @Published var favouriteCoffe:[String] = []
    @Published var currentSizee:String = "Small"
    @Published var cartSize:Int = 0
    @Published var showDot:Bool = false
    @Published var scalingFactor:CGFloat = 1
    @Published var redDotChanged:Bool = false
    @AppStorage("Settings") var settingsData:Data = Data()
    @Published var phoneNumber = ""
    @Published var phoneChanged:Bool = false
    @Published var editModeOn:Bool = false
    @Published var screenDontFitInDevice: Bool = UIScreen.main.bounds.size.height < 700 ? true : false
    
    @Published var tempName:String = ""
    @Published var tempPhone:String = ""
    @Published var tempAvatar:String = ""
    
    
    @Published var smallCappucino:Int = 0
    @Published var mediumCappucino:Int = 0
    @Published var largeCappucino:Int = 0
    @Published var smallExpresso:Int = 0
    @Published var mediumExpresso:Int = 0
    @Published var largeExpresso:Int = 0
    @Published var smallLatte:Int = 0
    @Published var mediumLatte:Int = 0
    @Published var largeLatte:Int = 0
    @Published var smallRegular:Int = 0
    @Published var mediumRegular:Int = 0
    @Published var largeRegular:Int = 0
    @Published var smallIcedC:Int = 0
    @Published var mediumIcedC:Int = 0
    @Published var largeIcedC:Int = 0
    @Published var smallIcedV:Int = 0
    @Published var mediumIcedV:Int = 0
    @Published var largeIcedV:Int = 0
    @Published var smallIcedY:Int = 0
    @Published var mediumIcedY:Int = 0
    @Published var largeIcedY:Int = 0
    
    
    @Published var smallCappucinoAdded:Bool = false
    @Published var mediumCappucinoAdded:Bool = false
    @Published var largeCappucinoAdded:Bool = false
    @Published var smallExpressoAdded:Bool = false
    @Published var mediumExpressoAdded:Bool = false
    @Published var largeExpressoAdded:Bool = false
    @Published var smallLatteAdded:Bool = false
    @Published var mediumLatteAdded:Bool = false
    @Published var largeLatteAdded:Bool = false
    @Published var smallRegularAdded:Bool = false
    @Published var mediumRegularAdded:Bool = false
    @Published var largeRegularAdded:Bool = false
    @Published var smallIcedCAdded:Bool = false
    @Published var mediumIcedCAdded:Bool = false
    @Published var largeIcedCAdded:Bool = false
    @Published var smallIcedVAdded:Bool = false
    @Published var mediumIcedVAdded:Bool = false
    @Published var largeIcedVAdded:Bool = false
    @Published var smallIcedYAdded:Bool = false
    @Published var mediumIcedYAdded:Bool = false
    @Published var largeIcedYAdded:Bool = false
    
    func addCartItem(cartItem:CartItem){
        cartOrders.append(cartItem)
    }
    
    init(){
        webService = WebService()
    }
    
    func addToCart(name:String, currentItem:String){
        
        if(name.lowercased() == "cappuccino" && currentItem.lowercased() == "small"){
            if(!smallCappucinoAdded){
                smallCappucinoAdded = true
                smallCappucino += 1
                cartOrders.append(CartItem(name: currentImage, coffeeName: currentCoffeeName, total: currentPrice, size: currentSize, imageURL: currentCoffeeImage))
            }else{
                smallCappucino += 1
            }
        }else if(name.lowercased() == "cappuccino" && currentItem.lowercased() == "medium"){
            if(!mediumCappucinoAdded){
                mediumCappucinoAdded = true
                mediumCappucino += 1
                cartOrders.append(CartItem(name: currentImage, coffeeName: currentCoffeeName, total: currentPrice, size: currentSize, imageURL: currentCoffeeImage))
            }else{
                mediumCappucino += 1
            }
        }else if(name.lowercased() == "cappuccino" && currentItem.lowercased() == "large"){
            if(!largeCappucinoAdded){
                largeCappucinoAdded = true
                largeCappucino += 1
                cartOrders.append(CartItem(name: currentImage, coffeeName: currentCoffeeName, total: currentPrice, size: currentSize, imageURL: currentCoffeeImage))
            }else{
                largeCappucino += 1
            }
        }else if(name.lowercased() == "expresso" && currentItem.lowercased() == "small"){
            if(!smallExpressoAdded){
                smallExpressoAdded = true
                smallExpresso += 1
                cartOrders.append(CartItem(name: currentImage, coffeeName: currentCoffeeName, total: currentPrice, size: currentSize, imageURL: currentCoffeeImage))
            }else{
                smallExpresso += 1
            }
        }else if(name.lowercased() == "expresso" && currentItem.lowercased() == "medium"){
            if(!mediumExpressoAdded){
                mediumExpressoAdded = true
                mediumExpresso += 1
                cartOrders.append(CartItem(name: currentImage, coffeeName: currentCoffeeName, total: currentPrice, size: currentSize, imageURL: currentCoffeeImage))
            }else{
                mediumExpresso += 1
            }
        }else if(name.lowercased() == "expresso" && currentItem.lowercased() == "large"){
            if(!largeExpressoAdded){
                largeExpressoAdded = true
                largeExpresso += 1
                cartOrders.append(CartItem(name: currentImage, coffeeName: currentCoffeeName, total: currentPrice, size: currentSize, imageURL: currentCoffeeImage))
            }else{
                largeExpresso += 1
            }
        }else if(name.lowercased() == "regular" && currentItem.lowercased() == "small"){
            if(!smallRegularAdded){
                smallRegularAdded = true
                smallRegular += 1
                cartOrders.append(CartItem(name: currentImage, coffeeName: currentCoffeeName, total: currentPrice, size: currentSize, imageURL: currentCoffeeImage))
            }else{
                smallRegular += 1
            }
        }else if(name.lowercased() == "regular" && currentItem.lowercased() == "medium"){
            if(!mediumRegularAdded){
                mediumRegularAdded = true
                mediumRegular += 1
                cartOrders.append(CartItem(name: currentImage, coffeeName: currentCoffeeName, total: currentPrice, size: currentSize, imageURL: currentCoffeeImage))
            }else{
                mediumRegular += 1
            }
        }else if(name.lowercased() == "regular" && currentItem.lowercased() == "large"){
            if(!largeRegularAdded){
                largeRegularAdded = true
                largeRegular += 1
                cartOrders.append(CartItem(name: currentImage, coffeeName: currentCoffeeName, total: currentPrice, size: currentSize, imageURL: currentCoffeeImage))
            }else{
                largeRegular += 1
            }
        }else if(name.lowercased() == "latte" && currentItem.lowercased() == "small"){
            if(!smallLatteAdded){
                smallLatteAdded = true
                smallLatte += 1
                cartOrders.append(CartItem(name: currentImage, coffeeName: currentCoffeeName, total: currentPrice, size: currentSize, imageURL: currentCoffeeImage))
            }else{
                smallLatte += 1
            }
        }else if(name.lowercased() == "latte" && currentItem.lowercased() == "medium"){
            if(!mediumLatteAdded){
                mediumLatteAdded = true
                mediumLatte += 1
                cartOrders.append(CartItem(name: currentImage, coffeeName: currentCoffeeName, total: currentPrice, size: currentSize, imageURL: currentCoffeeImage))
            }else{
                mediumLatte += 1
            }
        }else if(name.lowercased() == "latte" && currentItem.lowercased() == "large"){
            if(!largeLatteAdded){
                largeLatteAdded = true
                largeLatte += 1
                cartOrders.append(CartItem(name: currentImage, coffeeName: currentCoffeeName, total: currentPrice, size: currentSize, imageURL: currentCoffeeImage))
            }else{
                largeLatte += 1
            }
        }else if(name.lowercased() == "iced caramel macchiato" && currentItem.lowercased() == "small"){
            if(!smallIcedCAdded){
                smallIcedCAdded = true
                smallIcedC += 1
                cartOrders.append(CartItem(name: currentImage, coffeeName: currentCoffeeName, total: currentPrice, size: currentSize, imageURL: currentCoffeeImage))
            }else{
                smallIcedC += 1
            }
        }else if(name.lowercased() == "iced caramel macchiato" && currentItem.lowercased() == "medium"){
            if(!mediumIcedCAdded){
                mediumIcedCAdded = true
                mediumIcedC += 1
                cartOrders.append(CartItem(name: currentImage, coffeeName: currentCoffeeName, total: currentPrice, size: currentSize, imageURL: currentCoffeeImage))
            }else{
                mediumIcedC += 1
            }
        }else if(name.lowercased() == "iced caramel macchiato" && currentItem.lowercased() == "large"){
            if(!largeIcedCAdded){
                largeIcedCAdded = true
                largeIcedC += 1
                cartOrders.append(CartItem(name: currentImage, coffeeName: currentCoffeeName, total: currentPrice, size: currentSize, imageURL: currentCoffeeImage))
            }else{
                largeIcedC += 1
            }
        }else if(name.lowercased() == "vietnamese iced coffee" && currentItem.lowercased() == "small"){
            if(!smallIcedVAdded){
                smallIcedVAdded = true
                smallIcedV += 1
                cartOrders.append(CartItem(name: currentImage, coffeeName: currentCoffeeName, total: currentPrice, size: currentSize, imageURL: currentCoffeeImage))
            }else{
                smallIcedV += 1
            }
        }else if(name.lowercased() == "vietnamese iced coffee" && currentItem.lowercased() == "medium"){
            if(!mediumIcedVAdded){
                mediumIcedVAdded = true
                mediumIcedV += 1
                cartOrders.append(CartItem(name: currentImage, coffeeName: currentCoffeeName, total: currentPrice, size: currentSize, imageURL: currentCoffeeImage))
            }else{
                mediumIcedV += 1
            }
        }else if(name.lowercased() == "vietnamese iced coffee" && currentItem.lowercased() == "large"){
            if(!largeIcedVAdded){
                largeIcedVAdded = true
                largeIcedV += 1
                cartOrders.append(CartItem(name: currentImage, coffeeName: currentCoffeeName, total: currentPrice, size: currentSize, imageURL: currentCoffeeImage))
            }else{
                largeIcedV += 1
            }
        }else if(name.lowercased() == "chocolate-y iced mocha" && currentItem.lowercased() == "small"){
            if(!smallIcedYAdded){
                smallIcedYAdded = true
                smallIcedY += 1
                cartOrders.append(CartItem(name: currentImage, coffeeName: currentCoffeeName, total: currentPrice, size: currentSize, imageURL: currentCoffeeImage))
            }else{
                smallIcedY += 1
            }
        }else if(name.lowercased() == "chocolate-y iced mocha" && currentItem.lowercased() == "medium"){
            if(!mediumIcedYAdded){
                mediumIcedYAdded = true
                mediumIcedY += 1
                cartOrders.append(CartItem(name: currentImage, coffeeName: currentCoffeeName, total: currentPrice, size: currentSize, imageURL: currentCoffeeImage))
            }else{
                mediumIcedY += 1
            }
        }else if(name.lowercased() == "chocolate-y iced mocha" && currentItem.lowercased() == "large"){
            if(!largeIcedYAdded){
                largeIcedYAdded = true
                largeIcedY += 1
                cartOrders.append(CartItem(name: currentImage, coffeeName: currentCoffeeName, total: currentPrice, size: currentSize, imageURL: currentCoffeeImage))
            }else{
                largeIcedY += 1
            }
        }
    }
    
    func increaseNumbers(currentCoffeeName:String, currentSize:String){
        if(currentCoffeeName.lowercased() == "cappuccino" && currentSize.lowercased() == "small"){
            smallCappucino += 1
        }else if(currentCoffeeName.lowercased() == "cappuccino" && currentSize.lowercased() == "medium"){
            mediumCappucino += 1
        }else if(currentCoffeeName.lowercased() == "cappuccino" && currentSize.lowercased() == "large"){
            largeCappucino += 1
        }else if(currentCoffeeName.lowercased() == "expresso" && currentSize.lowercased() == "small"){
            smallExpresso += 1
        }else if(currentCoffeeName.lowercased() == "expresso" && currentSize.lowercased() == "medium"){
            mediumExpresso += 1
        }else if(currentCoffeeName.lowercased() == "expresso" && currentSize.lowercased() == "large"){
            largeExpresso += 1
        }else if(currentCoffeeName.lowercased() == "regular" && currentSize.lowercased() == "small"){
            smallRegular += 1
        }else if(currentCoffeeName.lowercased() == "regular" && currentSize.lowercased() == "medium"){
            mediumRegular += 1
        }else if(currentCoffeeName.lowercased() == "regular" && currentSize.lowercased() == "large"){
            largeRegular += 1
        }else if(currentCoffeeName.lowercased() == "latte" && currentSize.lowercased() == "small"){
            smallLatte += 1
        }else if(currentCoffeeName.lowercased() == "latte" && currentSize.lowercased() == "medium"){
            mediumLatte += 1
        }else if(currentCoffeeName.lowercased() == "latte" && currentSize.lowercased() == "large"){
            largeLatte += 1
        }else if(currentCoffeeName.lowercased() == "iced caramel macchiato" && currentSize.lowercased() == "small"){
            smallIcedC += 1
        }else if(currentCoffeeName.lowercased() == "iced caramel macchiato" && currentSize.lowercased() == "medium"){
            mediumIcedC += 1
        }else if(currentCoffeeName.lowercased() == "iced caramel macchiato" && currentSize.lowercased() == "large"){
            largeIcedC += 1
        }else if(currentCoffeeName.lowercased() == "vietnamese iced coffee" && currentSize.lowercased() == "small"){
            smallIcedV += 1
        }else if(currentCoffeeName.lowercased() == "vietnamese iced coffee" && currentSize.lowercased() == "medium"){
            mediumIcedV += 1
        }else if(currentCoffeeName.lowercased() == "vietnamese iced coffee" && currentSize.lowercased() == "large"){
            largeIcedV += 1
        }else if(currentCoffeeName.lowercased() == "chocolate-y iced mocha" && currentSize.lowercased() == "small"){
            smallIcedY += 1
        }else if(currentCoffeeName.lowercased() == "chocolate-y iced mocha" && currentSize.lowercased() == "medium"){
           mediumIcedY += 1
        }else if(currentCoffeeName.lowercased() == "chocolate-y iced mocha" && currentSize.lowercased() == "large"){
            largeIcedY += 1
        }
    }
    
    func currentNumberOfOrders(currentCoffeeName:String,  currentSize:String) -> Int{
        if(currentCoffeeName.lowercased() == "cappuccino" && currentSize.lowercased() == "small"){
            return smallCappucino
        }else if(currentCoffeeName.lowercased() == "cappuccino" && currentSize.lowercased() == "medium"){
            return mediumCappucino
        }else if(currentCoffeeName.lowercased() == "cappuccino" && currentSize.lowercased() == "large"){
            return largeCappucino
        }else if(currentCoffeeName.lowercased() == "expresso" && currentSize.lowercased() == "small"){
            return smallExpresso
        }else if(currentCoffeeName.lowercased() == "expresso" && currentSize.lowercased() == "medium"){
            return mediumExpresso
        }else if(currentCoffeeName.lowercased() == "expresso" && currentSize.lowercased() == "large"){
            return largeExpresso
        }else if(currentCoffeeName.lowercased() == "regular" && currentSize.lowercased() == "small"){
            return smallRegular
        }else if(currentCoffeeName.lowercased() == "regular" && currentSize.lowercased() == "medium"){
            return mediumRegular
        }else if(currentCoffeeName.lowercased() == "regular" && currentSize.lowercased() == "large"){
            return largeRegular
        }else if(currentCoffeeName.lowercased() == "latte" && currentSize.lowercased() == "small"){
            return smallLatte
        }else if(currentCoffeeName.lowercased() == "latte" && currentSize.lowercased() == "medium"){
            return mediumLatte
        }else if(currentCoffeeName.lowercased() == "latte" && currentSize.lowercased() == "large"){
            return largeLatte
        }else if(currentCoffeeName.lowercased() == "iced caramel macchiato" && currentSize.lowercased() == "small"){
            return smallIcedC
        }else if(currentCoffeeName.lowercased() == "iced caramel macchiato" && currentSize.lowercased() == "medium"){
            return mediumIcedC
        }else if(currentCoffeeName.lowercased() == "iced caramel macchiato" && currentSize.lowercased() == "large"){
            return largeIcedC
        }else if(currentCoffeeName.lowercased() == "vietnamese iced coffee" && currentSize.lowercased() == "small"){
            return smallIcedV
        }else if(currentCoffeeName.lowercased() == "vietnamese iced coffee" && currentSize.lowercased() == "medium"){
            return mediumIcedV
        }else if(currentCoffeeName.lowercased() == "vietnamese iced coffee" && currentSize.lowercased() == "large"){
            return largeIcedV
        }else if(currentCoffeeName.lowercased() == "chocolate-y iced mocha" && currentSize.lowercased() == "small"){
            return smallIcedY
        }else if(currentCoffeeName.lowercased() == "chocolate-y iced mocha" && currentSize.lowercased() == "medium"){
            return mediumIcedY
        }else if(currentCoffeeName.lowercased() == "chocolate-y iced mocha" && currentSize.lowercased() == "large"){
            return largeIcedY
        }else{
            return 0
        }
    }
    
    func decreaseNumbers(currentCoffeeName:String, currentSize:String){
        if(currentCoffeeName.lowercased() == "cappuccino" && currentSize.lowercased() == "small"){
            smallCappucino -= 1
        }else if(currentCoffeeName.lowercased() == "cappuccino" && currentSize.lowercased() == "medium"){
            mediumCappucino -= 1
        }else if(currentCoffeeName.lowercased() == "cappuccino" && currentSize.lowercased() == "large"){
            largeCappucino -= 1
        }else if(currentCoffeeName.lowercased() == "expresso" && currentSize.lowercased() == "small"){
            smallExpresso -= 1
        }else if(currentCoffeeName.lowercased() == "expresso" && currentSize.lowercased() == "medium"){
            mediumExpresso -= 1
        }else if(currentCoffeeName.lowercased() == "expresso" && currentSize.lowercased() == "large"){
            largeExpresso -= 1
        }else if(currentCoffeeName.lowercased() == "regular" && currentSize.lowercased() == "small"){
            smallRegular -= 1
        }else if(currentCoffeeName.lowercased() == "regular" && currentSize.lowercased() == "medium"){
            mediumRegular -= 1
        }else if(currentCoffeeName.lowercased() == "regular" && currentSize.lowercased() == "large"){
            largeRegular -= 1
        }else if(currentCoffeeName.lowercased() == "latte" && currentSize.lowercased() == "small"){
            smallLatte -= 1
        }else if(currentCoffeeName.lowercased() == "latte" && currentSize.lowercased() == "medium"){
            mediumLatte -= 1
        }else if(currentCoffeeName.lowercased() == "latte" && currentSize.lowercased() == "large"){
            largeLatte -= 1
        }else if(currentCoffeeName.lowercased() == "iced caramel macchiato" && currentSize.lowercased() == "small"){
            smallIcedC -= 1
        }else if(currentCoffeeName.lowercased() == "iced caramel macchiato" && currentSize.lowercased() == "medium"){
            mediumIcedC -= 1
        }else if(currentCoffeeName.lowercased() == "iced caramel macchiato" && currentSize.lowercased() == "large"){
            largeIcedC -= 1
        }else if(currentCoffeeName.lowercased() == "vietnamese iced coffee" && currentSize.lowercased() == "small"){
            smallIcedV -= 1
        }else if(currentCoffeeName.lowercased() == "vietnamese iced coffee" && currentSize.lowercased() == "medium"){
            mediumIcedV -= 1
        }else if(currentCoffeeName.lowercased() == "vietnamese iced coffee" && currentSize.lowercased() == "large"){
            largeIcedV -= 1
        }else if(currentCoffeeName.lowercased() == "chocolate-y iced mocha" && currentSize.lowercased() == "small"){
            smallIcedY -= 1
        }else if(currentCoffeeName.lowercased() == "chocolate-y iced mocha" && currentSize.lowercased() == "medium"){
           mediumIcedY -= 1
        }else if(currentCoffeeName.lowercased() == "chocolate-y iced mocha" && currentSize.lowercased() == "large"){
            largeIcedY -= 1
        }
    }
    
    func saveSettingsData(){
        let settings = Settings(
            currentImage: currentImage,
            currentName: yourName,
            currentCart: cartOrders,
            currentProfile: currentAvatar,
            currentCountry: currentCountry,
            currentRegion: currentRegion,
            currentCity: currentCity,
            phoneNumber: phoneNumber,
            smallCappucino: smallCappucino,
            mediumCappucino: mediumCappucino,
            largeCappucino: largeCappucino,
            smallExpresso: smallExpresso,
            mediumExpresso: mediumExpresso,
            largeExpresso: largeExpresso,
            smallLatte: smallLatte,
            mediumLatte: mediumLatte,
            largeLatte: largeLatte,
            smallRegular: smallRegular,
            mediumRegular: mediumRegular,
            largeRegular: largeRegular,
            smallIcedC: smallIcedC,
            mediumIcedC: mediumIcedC,
            largeIcedC: largeIcedC,
            smallIcedV: smallIcedV,
            mediumIcedV: mediumIcedV,
            largeIcedV: largeIcedV,
            smallIcedY: smallIcedY,
            mediumIcedY: mediumIcedY,
            largeIcedY: largeIcedY,
            favouriteCoffe: favouriteCoffe
            
        )
        
        guard let settingsData = try? JSONEncoder().encode(settings) else{
            return
        }
        self.settingsData = settingsData
        
    }
    
    func getSettingsData(){
        guard let settings = try? JSONDecoder().decode(Settings.self, from: settingsData) else{
            return
        }
        currentImage = settings.currentImage
        currentAvatar = settings.currentProfile
        yourName = settings.currentName
        cartOrders = settings.currentCart
        currentCountry = settings.currentCountry
        currentRegion = settings.currentRegion
        currentCity = settings.currentCity
        phoneNumber = settings.phoneNumber
        smallCappucino = settings.smallCappucino
        mediumCappucino = settings.mediumCappucino
        largeCappucino = settings.largeCappucino
        smallExpresso = settings.smallExpresso
        mediumExpresso = settings.mediumExpresso
        largeExpresso = settings.largeExpresso
        smallRegular = settings.smallRegular
        mediumRegular = settings.mediumRegular
        largeRegular = settings.largeRegular
        smallLatte = settings.smallLatte
        mediumLatte = settings.mediumLatte
        largeLatte = settings.largeLatte
        smallIcedC = settings.smallIcedC
        mediumIcedC = settings.mediumIcedC
        largeIcedC = settings.largeIcedC
        smallIcedV = settings.smallIcedV
        mediumIcedV = settings.mediumIcedV
        largeIcedV = settings.largeIcedV
        smallIcedY = settings.smallIcedY
        mediumIcedY = settings.mediumIcedY
        largeIcedY = settings.largeIcedY
        favouriteCoffe = settings.favouriteCoffe
    }
    	
    func removeCartItem(index:Int){
        cartOrders.remove(at: index)
    }
    
    func placeOrder(){
        
        let order = Order(name: yourName, coffeeName: currentCoffeeName, total: currentPrice, size: currentSize, imageURL: currentCoffeeImage)
        
        self.webService.createCoffeeOrder(order:order , completion: { _ in
            
        })
    }
    
}
