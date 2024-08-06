//
//  CartRedDotView.swift
//  Cuppfee
//
//  Created by The Seven Stallions on 02/07/22.
//

import SwiftUI

struct CartRedDotView: View {
    
    @ObservedObject var mainModel:MainViewModel
    
    var body: some View {
        ZStack{
            Circle()
                .fill(Color.red)
                .frame(width: 10)
        }
    }
}

struct CartRedDotView_Previews: PreviewProvider {
    static var previews: some View {
        CartRedDotView(mainModel: MainViewModel())
    }
}
