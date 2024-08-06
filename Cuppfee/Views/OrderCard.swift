//
//  OrderCard.swift
//  Cuppfee
//
//  Created by The Seven Stallions on 28/06/22.
//

import SwiftUI

struct OrderCard: View {
    
    @State var showOrderDetails:Bool = false
    let order:OrderViewModel
    
    @State var profile:String
    
//    init(orders:OrderViewModel){
//        self.orders = orders
//    }
    
    var body: some View {
        VStack{

            HStack {
                
                Image("\(String(describing: order.imageURL.lowercased()))")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 110, height: 110)
                    .cornerRadius(20)
                
                VStack(alignment: .leading , spacing:0) {
                    HStack {
                        
                        Text(order.name)
                            .font(.system(size: 20, design: .rounded))
                            .padding(.top, 10)
                        
                        Spacer()
                        
                    }
               
                    HStack(spacing:0) {

                        Image("coffee-cup")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22, height: 22)
                            .padding(.trailing, 7)

                        Text (order.coffeeName)
                            .font(.system(size: 15, design: .rounded))

                        Image("glasses")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .padding(.leading)
                            .padding(.trailing, 7)

                        Text ("\(order.size)")
                            .font(.system(size: 15, design: .rounded))
                        Spacer()
                    }
                    .padding(.top, 5)
                    
                    HStack {
                        
                        Button(action: {
                            showOrderDetails.toggle()
                        }, label: {
                            ZStack {
                                Rectangle()
                                    .fill(Color("ColorTheme"))
                                    .cornerRadius(10)
                                Text("View Details")
                                    .font(.system(size: 12, design: .rounded))
                                    .foregroundColor(Color.white)
                            }
                            .padding(.top, 10)
                            
                        })
                        .frame(width: 140)

                        Spacer()

                        Text("$\(order.total, specifier: "%.2f")")
                            .font(.system(size: 18, design: .rounded))
                            .fontWeight(.bold)
                            .padding(.top, 7)
                            .padding(.trailing)
                        
                    }
              
                                        
                    Spacer()
                }
                .sheet(isPresented: $showOrderDetails, content: {
                    OrderDetailsSheetView(order: order, profile: profile)
                })
                .padding(.leading)
                Spacer()
            }
            
        }//:MAIN VSTACK
        .background(Color.white)
        .frame(height: 110)
        .cornerRadius(20)
        .padding(.leading)
        .padding(.trailing)
        .onTapGesture {
            showOrderDetails.toggle()
        }

    }
}

struct OrderCard_Previews: PreviewProvider {
    
    static var orders = Order(name: "Chandler Bing" , coffeeName: "Cappucino", total: 5.6, size: "Large", imageURL: "cappuccino")
    
    static var order: OrderViewModel = OrderViewModel(order: orders)
    
    static var previews: some View {
        OrderCard(order: order, profile: "")
            .background(Color.black)
            .previewLayout(.sizeThatFits)
    }
}
