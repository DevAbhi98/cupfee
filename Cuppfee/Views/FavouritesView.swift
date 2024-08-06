//
//  FavouritesView.swift
//  Cuppfee
//
//  Created by The Seven Stallions on 02/07/22.
//

import SwiftUI

struct FavouritesView: View {
    
    var mainModel:MainViewModel
    
    let columns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
        ]
    
    var body: some View {
        NavigationView{
            ZStack {
                VStack {
                        LazyVGrid(columns: columns, spacing: 10){
                            ForEach(mainModel.favouriteCoffe, id: \.self){ coffee in
                                
                                    if(coffee.lowercased() == "cappuccino"){
                                        FavoutiteItem(image: "cappuccino", name: "Cappuccino")
                                    }else if(coffee.lowercased() == "expresso"){
                                        FavoutiteItem(image: "expresso", name: "Expresso")
                                    }else if(coffee.lowercased() == "regular"){
                                        FavoutiteItem(image: "regular-coffee", name: "Regular")
                                    }else if(coffee.lowercased() == "latte"){
                                        FavoutiteItem(image: "latte", name: "Latte")
                                    }else if (coffee.lowercased() == "iced caramel macchiato"){
                                        FavoutiteItem(image: "iced-caramel-macchiato", name: "Iced Caramel Macchiato")
                                    }else if (coffee.lowercased() == "vietnamese iced coffee"){
                                        FavoutiteItem(image: "vietnamese-iced-coffee", name: "Vietnamese Iced Coffee")
                                    }else if (coffee.lowercased() == "chocolate-y iced mocha"){
                                        FavoutiteItem(image: "chocolate-y-iced-mocha", name: "Chocolate-y Iced Mocha")
                                    }
                                
                            }
                        }
                    .padding(.top)
                    Spacer()
                }
                
                Text("No Faviorite items!")
                    .opacity(mainModel.favouriteCoffe.count == 0 ? 1:0)
                
            }.navigationBarTitle("Your Favourite items!")

        }
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView(mainModel: MainViewModel())
    }
}
