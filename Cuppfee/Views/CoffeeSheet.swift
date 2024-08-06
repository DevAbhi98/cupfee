//
//  CoffeeSheet.swift
//  Cuppfee
//
//  Created by The Seven Stallions on 28/06/22.
//

import SwiftUI
import AlertToast

struct CoffeeSheet: View {
    
    @State var heart:Bool = false
    @ObservedObject var number: numberOfOrders = numberOfOrders()
    @ObservedObject var mainModel:MainViewModel
    @State var buttonClicked:Bool = false
    @State var cappuccinoSmall = 0
    @State var cappuccinoLarge = 0
    @State var cappuccinoMedium = 0
    @State var expressoSmall = 0
    @State var expressoMedium = 0
    @State var expressoLarge = 0
    @State var regularSmall = 0
    @State var regularMedium = 0
    @State var regularLarge = 0
    @State var currentItem = "Small"
    @State var showToast:Bool = false
    @State var toast:String = "Added to Favourites"
    
    
    func getStatus() -> Bool{
        if(mainModel.favouriteCoffe.contains(mainModel.currentCoffeeName)){
            return true
        }else{
            return false
        }
    }
    
    var body: some View {
        
        VStack(spacing: 0){
            
            
            Image(mainModel.currentImage)
                .resizable()
                .scaledToFill()
                .frame(width: 415)

            HStack(alignment:.center) {
                
                Text(mainModel.currentCoffeeName)
                    .font(.system(size: 30, design: .rounded))
                    .fontWeight(.semibold)
                    .padding(.top)
                    .padding(.leading, 25)
                            
                Spacer()
        
            }
            
            
            
            Divider()
                .padding()
                .padding(.leading, 20)
                .padding(.trailing, 20)
            
            HStack {
                Text("About")
                    .font(.system(size: 25, design: .rounded))
                    .fontWeight(.semibold)
                    .padding(.leading, 25)
                    .padding(.top, 5)
                
                Spacer()
            }
            
            Text("A light, foamy cappuccino is a favorite drink for many coffee lovers. Once you acquire two basic barista skills (pulling shots and foaming milk), you can learn how to make a cappuccino yourself.")
                .font(.system(size: 18, design: .rounded))
                .padding(.leading, 25)
                .padding(.trailing)
                .padding(.top, 10)
                .multilineTextAlignment(.leading)
            Spacer()
            
            
            HStack {
                Text("Size")
                    .font(.system(size: 25, design: .rounded))
                    .fontWeight(.semibold)
                    .padding(.leading, 25)
                    .padding(.top, 5)
                Spacer()
            }
            
            Picker("", selection: self.$currentItem){
                Text("Small").tag("Small")
                Text("Medium").tag("Medium")
                Text("Large").tag("Large")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Button(action: {
                
                buttonClicked.toggle()	          
                mainModel.addToCart(name: mainModel.currentCoffeeName, currentItem: mainModel.currentSize)
                mainModel.cartSize = mainModel.cartOrders.count
                mainModel.showDot = true
                mainModel.scalingFactor = 1.5
                mainModel.redDotChanged = true
                mainModel.saveSettingsData()
                
                
            }, label: {
                ZStack{
                    Rectangle()
                        .fill(Color("ColorTheme"))
                        .cornerRadius(10)
                        .frame(height: 50)
                        .padding()

                    Text("Add to cart")
                        .font(.system(size: 20, design: .rounded))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                }
            })
            
        }//:MAIN VSTACK
        .overlay(alignment: .topLeading){
            Image(getStatus() ? "heart-filled": heart ? "heart-filled": "heart")
                .resizable()
                .scaledToFill()
                .frame(width: 30, height: 30)
                .onTapGesture {
                    heart.toggle()
                    if(!mainModel.favouriteCoffe.contains(mainModel.currentCoffeeName)){
                        mainModel.favouriteCoffe.append(mainModel.currentCoffeeName)
                        toast = "Added to Favourites ❤️"
                        mainModel.saveSettingsData()
                        showToast.toggle()
                    }else{
                        if mainModel.favouriteCoffe.contains(mainModel.currentCoffeeName) {
                           let index = mainModel.favouriteCoffe.firstIndex(of:mainModel.currentCoffeeName)
                            mainModel.favouriteCoffe.remove(at: index!)
                           print(mainModel.favouriteCoffe)
                            toast = "Removed from Favourites ❤️"
                            mainModel.saveSettingsData()
                            showToast.toggle()
                        }
                    }
                }
                .padding(8)
                .background(
                    Circle()
                        .fill(Color.white)
                        .opacity(0.5)
                )
                .padding()
        }
        .toast(isPresenting: $showToast){

                    // `.alert` is the default displayMode

                    AlertToast(type: .regular, title: toast)

                    //Choose .hud to toast alert from the top of the screen
                    //AlertToast(displayMode: .hud, type: .regular, title: "Message Sent!")
                    
                    //Choose .banner to slide/pop alert from the bottom of the screen
                    //AlertToast(displayMode: .banner(.slide), type: .regular, title: "Message Sent!")
                }

    }
}

struct CoffeeSheet_Previews: PreviewProvider {
    
    @State static var array:[CartItem] = []
    
    static var model:MainViewModel = MainViewModel()
    
    static var previews: some View {
        
        CoffeeSheet(mainModel: model)
            .previewDevice("iPad")
    }
}
