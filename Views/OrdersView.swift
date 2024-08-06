//
//  OrdersView.swift
//  Cuppfee
//
//  Created by The Seven Stallions on 27/06/22.
//

import SwiftUI

struct OrdersView: View {
    
    @AppStorage("Settings") var settingsData:Data = Data()
    @State var fitInScreen:Bool = false
    @State var isSheetOpen:Bool = true
    @State var size:CGSize = .zero
    @State var hasTimeElapsed:Bool = false
    @State var isAnimating:Bool = false
    
    var order = Order(name: "Chandler Bing", coffeeName: "Cappucino",  total: 20.5, size: "Large", imageURL: "cappuccino")
    @ObservedObject private var orderListViewModel = OrderListViewModel()
    var screenDontFitInDevice: Bool = UIScreen.main.bounds.size.height < 700 ? true : false
    
    @State var profile:String = ""
    
    private func delayText() {
          // Delay of 7.5 seconds
        hasTimeElapsed = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.8) {
              hasTimeElapsed = true
            }
      }
    
    init(){
        orderListViewModel.fetchOrders()
    }

    func getSettingsData() -> String{
        guard let settings = try? JSONDecoder().decode(Settings.self, from: settingsData) else{
            return ""
        }

        return settings.currentProfile
        
    }
    
    var body: some View {
        
        NavigationView {
            ZStack {
                                
                VStack{
                    
                    HStack {
                        Text("Your Orders")
                            .padding(.leading)
                            .font(.system(size: 30, weight: .bold))
                        Spacer()
                    }
                    
                    SmartScrollView{
                        ForEach(orderListViewModel.orders, id:\.id){ order in
                            OrderCard(order: order, profile: getSettingsData())
                        }
                    }
    //                OrderCard(order: orderListViewModel)
                    Spacer()
                }//:VSTACK MAIN
                .padding(.top, 70)
                .onAppear{
                    delayText()
                }
                .background(Color("ColorBackground").opacity(0.6))
                .opacity(hasTimeElapsed ? 1:0)
                
                VStack(alignment: .center){
                    HStack {
                        Spacer()
                        GifImage("coffee-loading")
                            .frame(width: 100, height: 100)
                        Spacer()
                    }
                    .opacity(hasTimeElapsed ? 0:1)
                    
                }
                .opacity(hasTimeElapsed ? 1:1)
                
            }
            .ignoresSafeArea()
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
        
        
    }
}

extension View {
  func useScrollView(
    when condition: Bool,
    showsIndicators: Bool = true
  ) -> AnyView {
    if condition {
      return AnyView(
        ScrollView(showsIndicators: showsIndicators) {
          self
        }
      )
    } else {
      return AnyView(self)
    }
  }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
            .previewDevice("iPhone 11 Pro")
    }
}
