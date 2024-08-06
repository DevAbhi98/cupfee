//
//  ScreenTwo.swift
//  Cuppfee
//
//  Created by The Seven Stallions on 29/06/22.
//

import SwiftUI

struct ScreenTwo: View {
//    @StateObject var progress = numberOfOrders()
    
    var new:Custom = Custom()
    
    var body: some View {
        VStack {
           ScreenOne()
//            ScreenOne(progress: progress)
        }
    }
}

struct ScreenTwo_Previews: PreviewProvider {
    static var previews: some View {
        ScreenTwo()
    }
}
