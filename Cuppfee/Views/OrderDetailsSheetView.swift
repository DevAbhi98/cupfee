//
//  OrderDetailsSheetView.swift
//  Cuppfee
//
//  Created by The Seven Stallions on 28/06/22.
//

import SwiftUI

struct OrderDetailsSheetView: View {
    
    let order:OrderViewModel
    @State var profile:String
    
    var body: some View {
        VStack(spacing: 0){
            Image(order.imageURL.lowercased())
                .resizable()
                .scaledToFill()
                .frame(width: 450)
            
            Image(profile)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .cornerRadius(100)
                .padding(.top)
            
            Text(order.name)
                .font(.system(size: 25, design: .rounded))
                .fontWeight(.semibold)
                .padding(.top)
            
            HStack {
                Spacer()
                VStack(alignment:.center ,spacing:0){
                    Text("Out for Delivery")
                    
                    Text("Arriving Soon")
                        .font(.system(size: 25, design: .rounded))
                        .fontWeight(.regular)
                        .padding(.top, 5)
                       
                }
                .padding()
                
                Spacer()
                
            }
            .padding(.top, 10)
            
            HStack {
                Text("1x \(order.coffeeName.capitalized) ")
                    .font(.system(size: 18, design: .rounded))
                    .fontWeight(.semibold)
                Spacer()
                Text("$\(order.total, specifier: "%.2f")")
                    .font(.system(size: 18, design: .rounded))
                    .fontWeight(.semibold)
            }
            .padding(.leading,50)
            .padding(.trailing,50)
            .padding(.top)

            HStack {
                Text("Delivery Charges")
                    .font(.system(size: 18, design: .rounded))
                    .fontWeight(.semibold)
                Spacer()
                Text("$0.50")
                    .font(.system(size: 18, design: .rounded))
                    .fontWeight(.semibold)
            }
            .padding(.leading,50)
            .padding(.trailing,50)
            .padding(.top, 5)

            Divider()
                .padding()
                .padding(.leading, 25)
                .padding(.trailing, 25)
            
            HStack {
                Text("Total ")
                    .font(.system(size: 18, design: .rounded))
                    .fontWeight(.bold)
                Spacer()
                Text("$\(order.total + 0.50, specifier: "%.2f")")
                    .font(.system(size: 18, design: .rounded))
                    .fontWeight(.bold)
            }
            .padding(.leading,50)
            .padding(.trailing,50)
            
            Spacer()
        
            Button(action: {
                
            }, label: {
                ZStack{
                    Rectangle()
                        .fill(Color("ColorTheme"))
                        .cornerRadius(20)
                        .frame(height: 50)
                        .padding()
                    
                    Text("Cancel Order")
                        .font(.system(size: 22, design: .rounded))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                }
            })
            
        }//:MAIN VSTACK

    }
}

struct OrderDetailsSheetView_Previews: PreviewProvider {
    
    static var orders = Order(name: "Chandler Bing" , coffeeName: "Cappucino", total: 5.6, size: "Large", imageURL: "cappuccino")
    
    static var order: OrderViewModel = OrderViewModel(order: orders)
    
    static var previews: some View {
        OrderDetailsSheetView(order: order, profile: "")
            .previewLayout(.sizeThatFits)
    }
}
