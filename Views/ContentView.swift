//
//  ContentView.swift
//  Cuppfee
//
//  Created by The Seven Stallions on 27/06/22.
//

import SwiftUI
import AlertToast

struct ContentView: View {
    
    // MARK: - PROPERTIES
    
    @State private var scale = 1.0
    @State private var number:Int = 0
    @State private var pulsateAnimation:Bool = false
    @State private var openCard:Bool = false
    @State var cardNumber:Int = 0
    @State var currentImage = ""
    @State var currentCoffee = ""
    @State var currentSize = ""
    @State var currentPosition:CGSize = .zero
    @State var new:Bool = false
    @State var openCart:Bool = false
    @State var openProfile:Bool = false
    @State var currentCoffeeSize:String = ""
    @State var currenCoffee:String = ""
    @State var currentTotal:String  = ""
    @State var currentPrice:Int = 0
    @State var cart:[CartItem] = []
    @ObservedObject var mainModel:MainViewModel = MainViewModel()
    @State var openMap:Bool = false
    @State var openFavourites:Bool = false
    @State var showAddCartItem:Bool = false
    @State var currentSizee:String = "Small"
    @State var currentItem = "Small"
    @State var arraySize:Int = 0
    @State var scalingFactor:CGFloat = 1
    @State var redDot:Bool = false
    
    var coffee:Coffee = Coffee(imageURL: "cappuccino" , name: "Cappuccino", price: 5, size: "Small")
    
    init(){
        mainModel.getSettingsData()
    }
    
    func showRedDot() -> Bool{
        if(mainModel.cartOrders.capacity == 0){
            return false
        }else {
            return true
        }
    }
    
    func setLocation() -> String{
        
        if(mainModel.currentRegion == ""){
            if(mainModel.currentCountry != "" || mainModel.currentCountry == "null"){
                return mainModel.currentCountry
            }else{
                return " Set a location"
            }
        }else{
            return " \(mainModel.currentCity), \(mainModel.currentRegion), \(mainModel.currentCountry)"
        }
    
}
    
    var body: some View {
        
        ZStack {

            VStack{
                
                HStack(spacing:0){
                    
                    Image(mainModel.currentAvatar=="" ? "avatar-1": mainModel.currentAvatar)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .cornerRadius(50)
                        .padding(.leading, 20)
                        .onTapGesture {
                            openProfile.toggle()
                        }
                        .sheet(isPresented: $openProfile, content: {
                            ProfileView(mainModel: mainModel)
                        })
                    Spacer()
                    
                    Image("pin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 12, height: 12)
                        .fixedSize()
                    
                    Text(setLocation())
    //                    .font(.custom("robaga-regular", size: 14))
                        .font(.system(size: 14, design: .rounded))
                        .foregroundColor(Color.gray)
                        .onTapGesture {
                            openMap.toggle()
                        }
                        .sheet(isPresented: $openMap, content: {
                            MapView(mainModel: mainModel)
                        })
                    
                    Spacer()
                    
                    
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .onTapGesture {
                            openFavourites.toggle()
                        }
                        .sheet(isPresented: $openFavourites, content: {
                            FavouritesView(mainModel: mainModel)
                        })
                    
                    Image("cart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 40)
                        .padding(.trailing, 20)
                        .padding(.leading, 20)
                        .onAppear{
//                            self.scalingFactor = 2
                        }
                        .onTapGesture {
                            openCart.toggle()
                        }
                        .sheet(isPresented: $openCart, content: {
                            CartSheet(mainModel: mainModel)
                        })
                        .overlay(
                            CartRedDotView(mainModel: mainModel)
                                .opacity(mainModel.cartOrders.count == 0 ? 0:1)
//                                .scaleEffect(mainModel.showDot ? 1 : 0)
//                                .animation(Animation.spring())
                                .padding(.bottom, 18)
                                .padding(.trailing, 14)
                            , alignment: .topTrailing)
                        .modifier(ReversingScale(to: mainModel.scalingFactor, onEnded: {
                            DispatchQueue.main.async {
                                mainModel.scalingFactor = 1
                            }
                        }))
                        .animation(.default)

                }//:HSTACK HEADER
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack{
                        HStack {
                            Text("Good Morning, \(mainModel.yourName == "" ? "User":mainModel.yourName)")
            //                    .font(Font.custom("robaga-regular", size: 18))
                                .font(.system(size: 18, design: .rounded))
                                .fontWeight(.semibold)
                                .padding(.leading ,20)
                                .padding(.top, 8)

                            Spacer()
                        }//: HSTACK TEXT GOOD MORNING
                        VStack(spacing:0){
                            HStack{
                                Text("Top Picks")
                                    .font(.system(size: 23, design: .rounded))
                                    .fontWeight(.bold)
                                    .padding(.top, 10)
                                    .gesture(DragGesture(minimumDistance: 0).onEnded({ (value) in
                                            new.toggle()
                                            print(value.location) // Location of the tap, as a CGPoint.
                                    }))

                                
                //                    .font(Font.custom("regular", size: 18))
                                Spacer()
                            }
                            .padding(.leading, 20)
                            
                            HStack{
                                
                                ScrollView(.horizontal, showsIndicators: false){
                                    HStack{
                                        CoffeeView(coffee: Coffee(imageURL: "cappuccino" , name: "Cappuccino", price: 5, size: "Hot Coffee"), openCartView: $showAddCartItem, mainModel: mainModel)
                                            .onTapGesture {
                                                mainModel.currentImage = "cappuccino"
                                                mainModel.currentCoffeeName = "Cappuccino"
                                                mainModel.currentCoffeeImage = "cappuccino"
                                                mainModel.currentPrice = 5
                                                mainModel.currentSize = "Medium"
                                                pulsateAnimation.toggle()
                                                openCard.toggle()
//                                                openCard.toggle()
                                            }
                                        
                                        CoffeeView(coffee: Coffee(imageURL: "expresso" , name: "Expresso", price: 5, size: "Hot Coffee"), openCartView: $showAddCartItem, mainModel: mainModel)
                                            .onTapGesture {
                                                mainModel.currentImage = "expresso"
                                                mainModel.currentCoffeeName = "Expresso"
                                                mainModel.currentCoffeeImage = "expresso"
                                                mainModel.currentPrice = 5
                                                mainModel.currentSize = "Medium"
                                                openCard.toggle()
                                            }
                                        
                                        CoffeeView(coffee: Coffee(imageURL: "regular-coffee" , name: "Regular", price: 5, size: "Hot Coffee"), openCartView: $showAddCartItem, mainModel: mainModel)
                                            .onTapGesture {
                                                mainModel.currentImage = "regular-coffee"
                                                mainModel.currentCoffeeName = "Regular"
                                                mainModel.currentCoffeeImage = "regular-coffee"
                                                mainModel.currentPrice = 5
                                                mainModel.currentSize = "Medium"
                                                openCard.toggle()
                                            }
                                    }
                                    .padding(.leading)
                                    .padding(.trailing)
                                    .padding(.top, 10)
                                }
                 
                            }
                            
                        }
                        VStack (spacing:0){
                            HStack{
                                Text("Popular")
                                    .font(.system(size: 23, design: .rounded))
                                    .fontWeight(.bold)
                                    .padding(.top, 25)
                //                    .font(Font.custom("regular", size: 18))
                                    .gesture(DragGesture(minimumDistance: 0).onEnded({ (value) in
                                            new.toggle()
                                            print(value.location) // Location of the tap, as a CGPoint.
                                    }))
                                Spacer()
                            }
                            .padding(.leading, 20)
                            
                            HStack{
                                
                                ScrollView(.horizontal, showsIndicators: false){
                                    HStack{
                                        
                                        CoffeeView(coffee: Coffee(imageURL: "latte" , name: "Latte", price: 7, size: "Hot Coffee"), openCartView: $showAddCartItem, mainModel: mainModel)
                                            .onTapGesture {
                                                mainModel.currentImage = "latte"
                                                mainModel.currentCoffeeName = "Latte"
                                                mainModel.currentCoffeeImage = "latte"
                                                mainModel.currentPrice = 7
                                                mainModel.currentSize = "Medium"
                                                openCard.toggle()
                                            }
                                        
                                        CoffeeView(coffee: Coffee(imageURL: "cappuccino" , name: "Cappuccino", price: 7, size: "Hot Coffee"), openCartView: $showAddCartItem, mainModel: mainModel)
                                            .onTapGesture {
                                                mainModel.currentImage = "cappuccino"
                                                mainModel.currentCoffeeName = "Cappuccino"
                                                mainModel.currentCoffeeImage = "cappuccino"
                                                mainModel.currentPrice = 7
                                                mainModel.currentSize = "Medium"
                                                openCard.toggle()
                                            }
                                        
                                        
                                        CoffeeView(coffee: Coffee(imageURL: "expresso" , name: "Expresso", price: 7, size: "Hot Coffee"), openCartView: $showAddCartItem, mainModel: mainModel)
                                            .onTapGesture {
                                                mainModel.currentImage = "expresso"
                                                mainModel.currentCoffeeName = "Expresso"
                                                mainModel.currentCoffeeImage = "expresso"
                                                mainModel.currentPrice = 7
                                                mainModel.currentSize = "Medium"
                                                openCard.toggle()
                                            }
                                        
                                        CoffeeView(coffee: Coffee(imageURL: "regular-coffee" , name: "Regular", price: 7, size: "Hot Coffee"), openCartView: $showAddCartItem, mainModel: mainModel)
                                            .onTapGesture {
                                                mainModel.currentImage = "regular-coffee"
                                                mainModel.currentCoffeeName = "Regular"
                                                mainModel.currentCoffeeImage = "regular-coffee"
                                                mainModel.currentPrice = 7
                                                mainModel.currentSize = "Medium"
                                                openCard.toggle()
                                            }
                                        
                                    }
                                    .padding(.leading)
                                    .padding(.trailing)
                                    .padding(.top, 10)
                                }
                 
                            }
                            
                            
                        }

                        VStack (spacing:0){
                            
                            HStack{
                                Text("Hot Picks")
                                    .font(.system(size: 23, design: .rounded))
                                    .fontWeight(.bold)
                                    .padding(.top, 25)
                //                    .font(Font.custom("regular", size: 18))
                                Spacer()
                            }
                            .padding(.leading, 20)
                            
                            HStack{
                                
                                ScrollView(.horizontal, showsIndicators: false){
                                    
                                    HStack{
                                        CoffeeView(coffee: Coffee(imageURL: "cappuccino" , name: "Cappuccino", price: 10, size: "Hot Coffee"), openCartView: $showAddCartItem, mainModel: mainModel)
                                            .onTapGesture {
                                                mainModel.currentImage = "cappuccino"
                                                mainModel.currentCoffeeImage = "cappuccino"
                                                mainModel.currentCoffeeName = "Cappuccino"
                                                mainModel.currentPrice = 10
                                                mainModel.currentSize = "Medium"
                                                openCard.toggle()
                                            }
                                        
                                        CoffeeView(coffee: Coffee(imageURL: "expresso" , name: "Expresso", price: 10, size: "Hot Coffee"), openCartView: $showAddCartItem, mainModel: mainModel)
                                            .onTapGesture {
                                                mainModel.currentImage = "expresso"
                                                mainModel.currentCoffeeName = "Expresso"
                                                mainModel.currentCoffeeImage = "expresso"
                                                mainModel.currentPrice = 10
                                                mainModel.currentSize = "Medium"
                                                openCard.toggle()
                                            }
                                        
                                        CoffeeView(coffee: Coffee(imageURL: "regular-coffee" , name: "Regular", price: 10, size: "Hot Coffee"), openCartView: $showAddCartItem, mainModel: mainModel)
                                            .onTapGesture {
                                                mainModel.currentImage = "regular-coffee"
                                                mainModel.currentCoffeeName = "Regular"
                                                mainModel.currentCoffeeImage = "regular-coffee"
                                                mainModel.currentPrice = 10
                                                mainModel.currentSize = "Medium"
                                                openCard.toggle()
                                            }
                                        
                                    }
                                    .padding(.leading)
                                    .padding(.trailing)
                                    .padding(.top)
                                    
                                }
                 
                            }
                        }
                        
                        VStack (spacing:0){
                            
                            HStack{
                                Text("Cold Picks")
                                    .font(.system(size: 23, design: .rounded))
                                    .fontWeight(.bold)
                                    .padding(.top, 25)
                //                    .font(Font.custom("regular", size: 18))
                                Spacer()
                            }
                            .padding(.leading, 20)
                            
                            HStack{
                                
                                ScrollView(.horizontal, showsIndicators: false){
                                    
                                    HStack{
                                        CoffeeView(coffee: Coffee(imageURL: "iced-caramel-macchiato" , name: "Iced Caramel Macchiato", price: 10, size: "Cold Coffee"), openCartView: $showAddCartItem, mainModel: mainModel)
                                            .onTapGesture {
                                                mainModel.currentImage = "iced-caramel-macchiato"
                                                mainModel.currentCoffeeImage = "iced-caramel-macchiato"
                                                mainModel.currentCoffeeName = "Iced Caramel Macchiato"
                                                mainModel.currentPrice = 10
                                                mainModel.currentSize = "Medium"
                                                openCard.toggle()
                                            }
                                        
                                        CoffeeView(coffee: Coffee(imageURL: "vietnamese-iced-coffee" , name: "Vietnamese Iced Coffee", price: 10, size: "Cold Coffee"), openCartView: $showAddCartItem, mainModel: mainModel)
                                            .onTapGesture {
                                                mainModel.currentImage = "vietnamese-iced-coffee"
                                                mainModel.currentCoffeeImage = "iced-caramel-macchiato"
                                                mainModel.currentCoffeeName = "Vietnamese Iced Coffee"
                                                mainModel.currentPrice = 10
                                                mainModel.currentSize = "Medium"
                                                openCard.toggle()
                                            }
                                        
                                        CoffeeView(coffee: Coffee(imageURL: "chocolate-y-iced-mocha" , name: "Chocolate-y Iced Mocha", price: 10, size: "Cold Coffee"), openCartView: $showAddCartItem, mainModel: mainModel)
                                            .onTapGesture {
                                                mainModel.currentImage = "chocolate-y-iced-mocha"
                                                mainModel.currentCoffeeImage = "chocolate-y-iced-mocha"
                                                mainModel.currentCoffeeName = "Chocolate-y Iced Mocha"
                                                mainModel.currentPrice = 10
                                                mainModel.currentSize = "Medium"
                                                openCard.toggle()
                                            }
                                        
                                    }
                                    .padding(.leading)
                                    .padding(.trailing)
                                    .padding(.top)
                                    
                                }
                 
                            }
                        }
                        
                        
                    }
                    .padding(.bottom, 30)
                }
                .sheet(isPresented: $openCard) {
                    CoffeeSheet(mainModel: mainModel)
                }
                
            }//:VSTACK MAIN
            .padding(.top, 30)
            .padding(.bottom,10	)
            .background(
            
                Color("ColorBackground")
                    .opacity(0.6)
                
            )
            .blur(radius: showAddCartItem ? 8.0 : 0, opaque:  false)
            
            if showAddCartItem{
                BlankView(
                    backgroundColor : Color.black,
                    backgroundOpacity: 0.5
                )
                    .onTapGesture {
                        
                        showAddCartItem = false
                        
                    }
                AddToCartView(currentItem: $currentSizee ,image: mainModel.currentCoffeeImage, name: mainModel.currentCoffeeName, mainModel: mainModel, showDialog: $showAddCartItem)
            }
            
            
//            Circle()
//                .fill(Color.black)
//                .frame(width: 20, height: 20)
//                .offset(x: 158, y: -320)
            
        }
        
     
        
    }
}

struct ReversingScale: AnimatableModifier {
    var value: CGFloat

    private let target: CGFloat
    private let onEnded: () -> ()

    init(to value: CGFloat, onEnded: @escaping () -> () = {}) {
        self.target = value
        self.value = value
        self.onEnded = onEnded // << callback
    }

    var animatableData: CGFloat {
        get { value }
        set { value = newValue
            // newValue here is interpolating by engine, so changing
            // from previous to initially set, so when they got equal
            // animation ended
            let callback = onEnded
            if newValue == target {
                DispatchQueue.main.async(execute: callback)
            }
        }
    }

    func body(content: Content) -> some View {
        content.scaleEffect(value)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro")
    }
}
