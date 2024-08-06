//
//  CoffeeApp.swift
//  Cuppfee
//
//  Created by The Seven Stallions on 27/06/22.
//

import SwiftUI

struct CoffeeApp: View {
    
    @State private var selectedTab = "One"

    
    var body: some View {
        
        TabView(selection: $selectedTab){
            
            ContentView()
                .tabItem{
                    VStack {
                        Image( selectedTab == "One" ? "home-filled":"home")
                        Text("Home")
                            .font(.system(.body, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(Color("ColorTheme"))
                    }
                }
                .tag("One")
            
            OrdersView()
                .tabItem{
                    VStack {
                        Image(selectedTab == "Two" ? "clipboard-filled":"clipboard")
                        Text("Orders")
                            .font(.system(.body, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(Color("ColorTheme"))
                    }
                }
                .tag("Two")
            
            SettingsView()
                .tabItem{
                    VStack {
                        Image(selectedTab == "Three" ? "settings-filled":"settings")
                        Text("Settings")
                            .font(.system(size: 30, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(Color("ColorTheme"))
                    }
                }
                .tag("Three")
            
        }
        .accentColor(Color("ColorTheme"))
        
        
    }
}

struct CoffeeApp_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeApp()
    }
}
