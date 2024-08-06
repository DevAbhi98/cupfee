//
//  ErrorView.swift
//  Cuppfee
//
//  Created by The Seven Stallions on 05/07/22.
//

import SwiftUI

struct ErrorView: View {
    
    @Binding var showDialog:Bool
    var title:String
    var text:String
    
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .font(.system(size: 25, design: .rounded))
                    .fontWeight(.bold)
                    .padding(.leading)
                    .padding(.top)
                Spacer()
            }
            
            HStack{

                VStack{
                    Text(text)
                        .multilineTextAlignment(.center)
                }
                .padding(.leading)
                .padding(.trailing)
                
            }
            .padding()
            
            Button(action: {
                
                showDialog.toggle()
            }, label: {
                ZStack{
                    Rectangle()
                        .fill(Color("ColorTheme"))
                        .cornerRadius(10)
                        .frame(height: 50)
                        .padding(.leading)
                        .padding(.trailing)

                    Text("Ok")
                        .font(.system(size: 20, design: .rounded))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
            })
            
        }
        .padding(.bottom)
        .background(Color.white)
        .cornerRadius(20)
        .fixedSize(horizontal: false, vertical: true)
        .frame(width: 350, height: 120)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(showDialog: .constant(false), title: "Add Profile Details", text: "Please enter your Profile Details before placing an order")
    }
}
