//
//  CartItemCard.swift
//  Cuppfee
//
//  Created by The Seven Stallions on 28/06/22.
//

import SwiftUI

struct CartItemCard: View {
    
//    @Binding var array:[CartItem]
//    @ObservedObject var newObject:MyOrderViewModel
    @ObservedObject var mainModel:MainViewModel

    var index:Int
//    var order:Order
    var cartItem:CartItem
    @State var currentNumberOfOrders:Int = 0
    @State var dataChanged:Bool = false
    @State var currenVariable:Int = 0
    
        
    init(cartItem:CartItem, mainViewModel:MainViewModel, index:Int, numberOfOrders:Int){
        self.cartItem = cartItem
        self.mainModel = mainViewModel
        self.index = index
        self.currentNumberOfOrders = numberOfOrders
//        currentNumberOfOrders = getCartNumber()
//        var item = getCartNumber()
    }
    
    func removeItems(){
        if(cartItem.coffeeName?.lowercased() == "cappuccino" && cartItem.size?.lowercased() == "small"){
            mainModel.smallCappucinoAdded = false
            mainModel.smallCappucino = 0
        }else if(cartItem.coffeeName?.lowercased() == "cappuccino" && cartItem.size?.lowercased() == "medium"){
            mainModel.mediumCappucinoAdded = false
            mainModel.mediumCappucino = 0
        }else if(cartItem.coffeeName?.lowercased() == "cappuccino" && cartItem.size?.lowercased() == "large"){
            mainModel.largeCappucinoAdded  = false
            mainModel.largeCappucino = 0
        }else if(cartItem.coffeeName?.lowercased() == "expresso" && cartItem.size?.lowercased() == "small"){
            mainModel.smallExpressoAdded = false
            mainModel.smallExpresso = 0
        }else if(cartItem.coffeeName?.lowercased() == "expresso" && cartItem.size?.lowercased() == "medium"){
            mainModel.mediumExpressoAdded = false
            mainModel.mediumExpresso = 0
        }else if(cartItem.coffeeName?.lowercased() == "expresso" && cartItem.size?.lowercased() == "large"){
            mainModel.largeExpressoAdded = false
            mainModel.largeExpresso = 0
        }else if(cartItem.coffeeName?.lowercased() == "regular" && cartItem.size?.lowercased() == "small"){
            mainModel.smallRegularAdded = false
            mainModel.smallRegular = 0
        }else if(cartItem.coffeeName?.lowercased() == "regular" && cartItem.size?.lowercased() == "medium"){
            mainModel.mediumRegularAdded = false
            mainModel.mediumRegular = 0
        }else if(cartItem.coffeeName?.lowercased() == "regular" && cartItem.size?.lowercased() == "large"){
            mainModel.largeRegularAdded = false
            mainModel.largeRegular = 0
        }else if(cartItem.coffeeName?.lowercased() == "latte" && cartItem.size?.lowercased() == "small"){
            mainModel.smallLatteAdded = false
            mainModel.smallLatte = 0
        }else if(cartItem.coffeeName?.lowercased() == "latte" && cartItem.size?.lowercased() == "medium"){
            mainModel.mediumLatteAdded = false
            mainModel.mediumLatte = 0
        }else if(cartItem.coffeeName?.lowercased() == "latte" && cartItem.size?.lowercased() == "large"){
            mainModel.largeLatteAdded = false
            mainModel.largeLatte = 0
        }else if(cartItem.coffeeName?.lowercased() == "iced caramel macchiato" && cartItem.size?.lowercased() == "small"){
            mainModel.smallIcedCAdded = false
            mainModel.smallIcedC = 0
        }else if(cartItem.coffeeName?.lowercased() == "iced caramel macchiato" && cartItem.size?.lowercased() == "medium"){
            mainModel.mediumIcedCAdded = false
            mainModel.mediumIcedC = 0
        }else if(cartItem.coffeeName?.lowercased() == "iced caramel macchiato" && cartItem.size?.lowercased() == "large"){
            mainModel.largeIcedCAdded = false
            mainModel.largeIcedC = 0
        }else if(cartItem.coffeeName?.lowercased() == "vietnamese iced coffee" && cartItem.size?.lowercased() == "small"){
            mainModel.smallIcedVAdded = false
            mainModel.smallIcedV = 0
        }else if(cartItem.coffeeName?.lowercased() == "vietnamese iced coffee" && cartItem.size?.lowercased() == "medium"){
            mainModel.mediumIcedVAdded = false
            mainModel.mediumIcedV = 0
        }else if(cartItem.coffeeName?.lowercased() == "vietnamese iced coffee" && cartItem.size?.lowercased() == "large"){
            mainModel.largeIcedVAdded = false
            mainModel.largeIcedV = 0
        }else if(cartItem.coffeeName?.lowercased() == "chocolate-y iced mocha" && cartItem.size?.lowercased() == "small"){
            mainModel.smallIcedYAdded = false
            mainModel.smallIcedY = 0
        }else if(cartItem.coffeeName?.lowercased() == "chocolate-y iced mocha" && cartItem.size?.lowercased() == "medium"){
            mainModel.mediumIcedYAdded = false
            mainModel.mediumIcedY = 0
        }else if(cartItem.coffeeName?.lowercased() == "chocolate-y iced mocha" && cartItem.size?.lowercased() == "large"){
            mainModel.largeIcedYAdded = false
            mainModel.largeIcedY = 0
        }
    }
    
    func getCartNumber() -> Int{
        if(cartItem.coffeeName?.lowercased() == "cappuccino" && cartItem.size?.lowercased() == "small"){
            currenVariable = 0
            return mainModel.smallCappucino
        }else if(cartItem.coffeeName?.lowercased() == "cappuccino" && cartItem.size?.lowercased() == "medium"){
            currenVariable = 1
            return mainModel.mediumCappucino
        }else if(cartItem.coffeeName?.lowercased() == "cappuccino" && cartItem.size?.lowercased() == "large"){
            currenVariable = 2
            return mainModel.largeCappucino
        }else if(cartItem.coffeeName?.lowercased() == "expresso" && cartItem.size?.lowercased() == "small"){
            currenVariable = 3
            return mainModel.smallExpresso
        }else if(cartItem.coffeeName?.lowercased() == "expresso" && cartItem.size?.lowercased() == "medium"){
            currenVariable = 4
            return mainModel.mediumExpresso
        }else if(cartItem.coffeeName?.lowercased() == "expresso" && cartItem.size?.lowercased() == "large"){
            currenVariable = 5
            return mainModel.largeExpresso
        }else if(cartItem.coffeeName?.lowercased() == "regular" && cartItem.size?.lowercased() == "small"){
            currenVariable = 6
            return mainModel.smallRegular
        }else if(cartItem.coffeeName?.lowercased() == "regular" && cartItem.size?.lowercased() == "medium"){
            currenVariable = 7
            return mainModel.mediumRegular
        }else if(cartItem.coffeeName?.lowercased() == "regular" && cartItem.size?.lowercased() == "large"){
            currenVariable = 8
            return mainModel.largeRegular
        }else if(cartItem.coffeeName?.lowercased() == "latte" && cartItem.size?.lowercased() == "small"){
            currenVariable = 9
            return mainModel.smallLatte
        }else if(cartItem.coffeeName?.lowercased() == "latte" && cartItem.size?.lowercased() == "medium"){
            currenVariable = 10
            return mainModel.mediumLatte
        }else if(cartItem.coffeeName?.lowercased() == "latte" && cartItem.size?.lowercased() == "large"){
            currenVariable = 11
            return mainModel.largeLatte
        }else if(cartItem.coffeeName?.lowercased() == "iced caramel macchiato" && cartItem.size?.lowercased() == "small"){
            currenVariable = 12
            return mainModel.smallIcedC
        }else if(cartItem.coffeeName?.lowercased() == "iced caramel macchiato" && cartItem.size?.lowercased() == "medium"){
            currenVariable = 13
            return mainModel.mediumIcedC
        }else if(cartItem.coffeeName?.lowercased() == "iced caramel macchiato" && cartItem.size?.lowercased() == "large"){
            currenVariable = 14
            return mainModel.largeIcedC
        }else if(cartItem.coffeeName?.lowercased() == "vietnamese iced coffee" && cartItem.size?.lowercased() == "small"){
            currenVariable = 15
            return mainModel.smallIcedV
        }else if(cartItem.coffeeName?.lowercased() == "vietnamese iced coffee" && cartItem.size?.lowercased() == "medium"){
            currenVariable = 16
            return mainModel.mediumIcedV
        }else if(cartItem.coffeeName?.lowercased() == "vietnamese iced coffee" && cartItem.size?.lowercased() == "large"){
            currenVariable = 17
            return mainModel.largeIcedV
        }else if(cartItem.coffeeName?.lowercased() == "chocolate-y iced mocha" && cartItem.size?.lowercased() == "small"){
            currenVariable = 18
            return mainModel.smallIcedY
        }else if(cartItem.coffeeName?.lowercased() == "chocolate-y iced mocha" && cartItem.size?.lowercased() == "medium"){
            currenVariable = 19
            return mainModel.mediumIcedY
        }else if(cartItem.coffeeName?.lowercased() == "chocolate-y iced mocha" && cartItem.size?.lowercased() == "large"){
            currenVariable = 20
            return mainModel.largeIcedY
        }else{
            return 4
        }
    }
    
    
    var body: some View {
        VStack{

            HStack {
                
                Image(cartItem.name!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 110, height: 110)
                    .cornerRadius(20)
                
                VStack(alignment: .leading , spacing:0) {
                    HStack {
                        
                        Text(cartItem.coffeeName!)
                            .font(.system(size: 20, design: .rounded))
                            .padding(.top, 10)
                        
                        Spacer()
                        
                    }
               
                    HStack(spacing:0) {

                        Text ("Size: ")
                            .font(.system(size: 13, design: .rounded))
                            .foregroundColor(Color.gray)
                        Text (cartItem.size!)
                            .font(.system(size: 13, design: .rounded))
                            .foregroundColor(Color.gray)
                        Spacer()
                    }
                    .padding(.top, 4)
                       
                    HStack{
                        
                        Text("$\(cartItem.total!, specifier: "%.2f")")
                            .font(.system(size: 20, design: .rounded))
                            .fontWeight(.semibold)
                            .padding(.top, 10)
                        
                        Spacer()
                        
                        HStack{
                            
                            Button(action: {
                                
                                dataChanged = true
                                
                                if(mainModel.currentNumberOfOrders(currentCoffeeName: cartItem.coffeeName!, currentSize: cartItem.size!) > 0){
                                    mainModel.decreaseNumbers(currentCoffeeName: cartItem.coffeeName!, currentSize: cartItem.size!)
                                    mainModel.saveSettingsData()
                                }
                                
                                if(mainModel.currentNumberOfOrders(currentCoffeeName: cartItem.coffeeName!, currentSize: cartItem.size!) == 0){
                                    removeItems()
                                    mainModel.cartOrders.remove(at: index)
                                    mainModel.showDot = false
                                    mainModel.saveSettingsData()
                                }
                                
                            }, label: {
                                Image(systemName: "minus")
                                    .font(.system(size: 13))
                                    .foregroundColor(Color("ColorTheme"))
                                    .padding(.trailing, 5)

                            })
                            .padding(.leading, 10)
                            .padding(.top, 5)
                            .padding(.bottom, 5)


                            Text("\(mainModel.currentNumberOfOrders(currentCoffeeName: cartItem.coffeeName!, currentSize: cartItem.size!))")
                                .font(.system(size: 13, design: .rounded))
                                .foregroundColor(Color.black)
   
//                            Text("\(mainModel.largeCappucino)")
//                                .font(.system(size: 13, design: .rounded))
//                                .foregroundColor(Color.black)
                            
                            Button(action: {
                                dataChanged = true
                                mainModel.showDot = true
                                mainModel.increaseNumbers(currentCoffeeName: cartItem.coffeeName!, currentSize: cartItem.size!)
                                mainModel.saveSettingsData()
            
                            }, label: {
                                Image(systemName: "plus")
                                    .font(.system(size: 13))
                                    .foregroundColor(Color("ColorTheme"))
                                    .padding(.leading, 5)
                            })
                            .padding(.top, 5)
                            .padding(.bottom, 5)
                            .padding(.trailing, 10)
                            
                        }
                        .padding(.top, 2)
                        .padding(.bottom, 2)
                        .background(Color("ColorBackground").opacity(0.6))
                        .cornerRadius(16)
                        
                    }
                   
                                        
                    Spacer()
                }
                .padding(.leading)
                Spacer()
            }

        }//:MAIN VSTACK
        .background(Color.white)
        .frame(height: 110)
        .cornerRadius(20)
        .padding(.leading)
        .padding(.trailing)
    }
}

struct CartItemCard_Previews: PreviewProvider {
    static var orders = CartItem(name: "Chandler Bing" , coffeeName: "Cappucino", total: 5.6, size: "Large", imageURL: "cappuccino")
    @State static var array:[CartItem] = []
    @State static var number:Int = 1
    static var mainViewModel:MainViewModel = MainViewModel()
    
    static var previews: some View {
        CartItemCard(cartItem: orders, mainViewModel: mainViewModel, index: 1, numberOfOrders: 4)
    }
}
