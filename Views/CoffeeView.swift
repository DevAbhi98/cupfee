//
//  CoffeeView.swift
//  Cuppfee
//
//  Created by The Seven Stallions on 27/06/22.
//

import SwiftUI

struct CoffeeView: View {
    
    var coffee:Coffee
    @Binding var openCartView:Bool
    var mainModel:MainViewModel
    var array:[Int] = [4,4,6,1,2,4,3,2,4,8,8,6]
    
    mutating func newArray(){
        array = array.sorted()
    }
    
    var body: some View {
        
        VStack(alignment:.leading, spacing: 0){

            Image(coffee.imageURL!)
                .resizable()
                .scaledToFill()
                .frame(width: 230, height: 150)
                .cornerRadius(15)
            Spacer()

            Text(coffee.name!)
                .font(Font.custom("robaga-regular", size: 12))
                .padding(.leading, 10)
            
            Text(coffee.size!)
                .font(Font.custom("robaga-regular", size: 8))
                .padding(.leading, 10)
                .padding(.top, 5)
                .foregroundColor(.gray)
            
            HStack{
                Text("$\(coffee.price!, specifier: "%.2f")")
                    .font(Font.custom("robaga-regular", size: 13))
                    .padding(.leading,10)
                    .padding(.top, 5)
                Spacer()
                
                Button(action: {
                    mainModel.currentCoffeeImage = coffee.imageURL!
                    mainModel.currentCoffeeName = coffee.name!
                    mainModel.currentPrice = coffee.price!
                    mainModel.currentSize = coffee.size!
                    openCartView.toggle()
                }, label: {
                    ZStack{
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .foregroundColor(Color.white)
                            .padding(8)
                    }
                    .background(
                        Circle()
                            .fill(Color("ColorTheme"))
                    )
                })

            }
            .padding(.trailing,10)
            
            Spacer()

        }//:MAIN VSTACK
        .background(Color.white)
        .fixedSize()
        .cornerRadius(20)
    
    }
}

struct CoffeeView_Previews: PreviewProvider {
    
  static var coffee = Coffee(imageURL: "cappucino" , name: "Cappuccino", price: 5, size: "Small")
    
    static var previews: some View {
        CoffeeView(coffee: coffee, openCartView: .constant(false), mainModel: MainViewModel())
            .previewDevice("iPhone 11 Pro")
            .previewLayout(.sizeThatFits)
    }
}
