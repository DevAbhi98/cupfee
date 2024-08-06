//
//  SmarScrollView.swift
//  Cuppfee
//
//  Created by The Seven Stallions on 06/07/22.
//

import Foundation
import SwiftUI

private struct ViewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat { 0 }
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = value + nextValue()
    }
}

struct SmartScrollView<Content: View>: View {
    @State private var fitInScreen = false
    @State var axes = Axis.Set.vertical
    
    let content: () -> Content
    
    var body: some View {
        GeometryReader { gp in
            ScrollView(axes) {
                content()
                    .onAppear {
                        axes = fitInScreen ? [] : .vertical
                    }
                    
                .background(GeometryReader {
                    // calculate height by consumed background and store in
                    // view preference
                    Color.clear.preference(key: ViewHeightKey.self,
                        value: $0.frame(in: .local).size.height) })
                
            }
            .onPreferenceChange(ViewHeightKey.self) {
                 self.fitInScreen = $0 < gp.size.height    // << here !!
            }
            
           
        }
        
    }
    
}
