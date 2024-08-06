//
//  FavoutiteItem.swift
//  Cuppfee
//
//  Created by The Seven Stallions on 02/07/22.
//

import SwiftUI

struct FavoutiteItem: View {
    
    var image:String
    var name:String
    
    var body: some View {
        VStack{
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .cornerRadius(50)
            
            Text(name)
            
        }
    }
}

struct FavoutiteItem_Previews: PreviewProvider {
    static var previews: some View {
        FavoutiteItem(image: "regular-coffee", name: "Regular")
            .previewLayout(.sizeThatFits)
    }
}
