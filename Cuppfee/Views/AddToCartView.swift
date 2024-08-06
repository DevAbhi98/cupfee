//
//  AddToCartView.swift
//  Cuppfee
//
//  Created by The Seven Stallions on 02/07/22.
//

import SwiftUI

struct AddToCartView: View {
    
    @Binding var currentItem:String
    var image:String
    var name:String
    var mainModel:MainViewModel
    @Binding var showDialog:Bool
    @State var currentSize:String = "Small"
    
    
    func calculatePrice() -> Double {
        if(currentSize.lowercased() == "small"){
            return 5.00
        }else if(currentSize.lowercased() == "medium"){
            return 7.00
        }else{
            return 10.00
        }
    }
    
    var body: some View {
        VStack{
            HStack{
                Text("Add to cart")
                    .font(.system(size: 25, design: .rounded))
                    .fontWeight(.bold)
                    .padding(.leading)
                    .padding(.top)
                Spacer()
            }
            
            HStack{
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .cornerRadius(50)
                VStack(alignment: .leading){
                
                    Text(name)
                        .font(.system(size: 20, design: .rounded))
                        .fontWeight(.semibold)
                    Spacer()
                    
                    Picker("", selection: $currentSize){
                        Text("Small").tag("Small")
                        Text("Medium").tag("Medium")
                        Text("Large").tag("Large")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                }
                .padding()
                Spacer()
            }
            .padding()
            
            Button(action: {
                
                mainModel.currentImage = image
                mainModel.currentCoffeeImage = image
                mainModel.currentCoffeeName = name
                mainModel.currentPrice = calculatePrice()
                mainModel.currentSize = currentSize
                mainModel.addToCart(name: mainModel.currentCoffeeName, currentItem: mainModel.currentSize)
                mainModel.cartSize = mainModel.cartOrders.count
                mainModel.scalingFactor = 1.5
                mainModel.showDot = true
                mainModel.redDotChanged = true
                mainModel.saveSettingsData()
                
                showDialog.toggle()
            }, label: {
                ZStack{
                    Rectangle()
                        .fill(Color("ColorTheme"))
                        .cornerRadius(10)
                        .frame(height: 50)
                        .padding(.leading)
                        .padding(.trailing)

                    
                    Text("Add to cart ($\(calculatePrice(), specifier: "%.2f"))")
                        .font(.system(size: 20, design: .rounded))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
            })
            
        }
        .padding(.bottom)
        .background(Color.white)
        .cornerRadius(20)
        .frame(width: 350, height: 120)
    }
}

struct AddToCartView_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartView(currentItem: .constant("Small") ,image: "regular-coffee", name: "Regular", mainModel: MainViewModel(), showDialog: .constant(true))
            .background(Color.black)
    }
}
