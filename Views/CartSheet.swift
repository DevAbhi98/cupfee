//
//  CartSheet.swift
//  Cuppfee
//
//  Created by The Seven Stallions on 28/06/22.
//

import SwiftUI

struct CartSheet: View {
    
//    @ObservedObject var number:numberOfOrders = numberOfOrders()
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>

//    @Binding var cartArray:[CartItem]
    @ObservedObject var mainModel:MainViewModel
//    @State var orderNumber:Int
    @State var setNumber:Int = 1
    @State var showCharges:Bool = false
    @State var showError:Bool = false
    @State var title:String = ""
    @State var text:String = ""
    @State var finalArray:[CartItem] = []
    
    init(mainModel:MainViewModel){
        self.mainModel = mainModel
    }

    
    @State var cappuccinoSmall = 0
    @State var cappuccinoLarge = 0
    @State var cappuccinoMedium = 0
    @State var expressoSmall = 0
    @State var expressoMedium = 0
    @State var expressoLarge = 0
    @State var regularSmall = 0
    @State var regularMedium = 0
    @State var regularLarge = 0
    @State var numberOfOrders = 0
    
    func calculateTotalPrice() -> Double{
        var finalPrice:Double = 0
        for order in mainModel.cartOrders {
            finalPrice = finalPrice + order.total!
        }
       return finalPrice
    }
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 0){
            
                ZStack{
                    
                    ScrollView(.vertical, showsIndicators: false){
                        
                        ForEach(mainModel.cartOrders.indices, id: \.self){ index in
       
                            CartItemCard(cartItem: mainModel.cartOrders[index], mainViewModel: mainModel, index: index, numberOfOrders: 1)
                                    .padding(.top)
                            
                        }
                        ExtractedView(calculatedPrice: calculateTotalPrice())
                 
                    }.opacity(mainModel.cartOrders.count == 0 ? 0:1)
                    

                    VStack{
                        Spacer()
                        TempView()
                        Spacer()
                    }.opacity(mainModel.cartOrders.count == 0 ? 1:0)
                        
                    
                }
                
                
                
                Spacer()
                
                Button(action: {
                    
                    if(mainModel.currentAvatar == "" && mainModel.yourName == ""){
                        title = "Add Profile Details"
                        text = "Please, complete your profile details before placing an order!"
                        showError = true
                    }else if(mainModel.currentCity == "" && mainModel.currentRegion == "" && mainModel.currentCountry == ""){
                        title = "Add Location Details"
                        text = "Please, set your location before placing an order!"
                        showError = true
                    }else{
                        showError = false
                        mainModel.placeOrder()
                        presentationMode.wrappedValue.dismiss()
                        mainModel.cartOrders.removeAll()
                        mainModel.saveSettingsData()
                    }
                    
                }, label: {
                    ZStack{
                        Rectangle()
                            .fill(Color("ColorTheme"))
                            .cornerRadius(5)
                            .frame(height: 50)
                            .padding()
                            .opacity(mainModel.cartOrders.count == 0 ? 0.6: 1)
                        
                        Text("Place Order")
                            .font(.system(size: 18, design: .rounded))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        
                    }
                })
                .disabled(mainModel.cartOrders.count == 0 ? true:false)
                
            }//:MAIN VSTACK
            .background(Color("ColorBackground").opacity(0.6))
            .blur(radius: showError ? 8.0 : 0, opaque:  false)
            
            if showError{
                BlankView(
                    backgroundColor : Color.black,
                    backgroundOpacity: 0.5
                )
                    .onTapGesture {
                        
                        showError = false
                        
                    }
                ErrorView( showDialog: $showError, title: title, text: text)
            }
            
        }
    }
}

struct CartSheet_Previews: PreviewProvider {
    
    @State static var new:[CartItem] = []
    @State static var number:Int = 1
    static var newModel = MainViewModel()
    
    static var previews: some View {
        CartSheet(mainModel: newModel)
    }
}

struct TempView:View{
    var body: some View{
        VStack{
            Text("No Orders!")
        }
    }
}

struct ExtractedView: View {
    
    var calculatedPrice:Double
    
    var body: some View {
        VStack {
            HStack {
                Text("Delivery Charges ")
                    .font(.system(size: 18, design: .rounded))
                    .fontWeight(.semibold)
                Spacer()
                Text("$0.50")
                    .font(.system(size: 18, design: .rounded))
                    .fontWeight(.semibold)
            }
            .padding(.leading,50)
            .padding(.trailing,50)
            .padding(.top, 10)
            
            Divider()
                .padding()
                .padding(.leading, 25)
                .padding(.trailing, 25)
            
            HStack {
                Text("Total ")
                    .font(.system(size: 18, design: .rounded))
                    .fontWeight(.bold)
                Spacer()
                Text("$\(calculatedPrice + 0.50, specifier: "%.2f")")
                    .font(.system(size: 18, design: .rounded))
                    .fontWeight(.bold)
            }
            .padding(.leading,50)
            .padding(.trailing,50)
        }
        
        
        
    }
}
