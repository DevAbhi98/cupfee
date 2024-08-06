//
//  SettingsView.swift
//  Weather App
//
//  Created by The Seven Stallions on 25/06/22.
//

import SwiftUI

struct SettingsView: View {
    

    @State var showingSetCity:Bool = false
    @State var showingTempUnit:Bool = false
    @State var windUnit:Bool = false
    @State var distanceUnit:Bool = false
    
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                Color("ColorBackground").opacity(0.6)
                    .ignoresSafeArea()
                
                VStack{
                    
                    HStack{
                        Text("About the application").foregroundColor(Color.black)
                        Spacer()
                    }
                    .padding(.top)
                    .padding(.top)
                    .padding(.leading)
                    
                    VStack(alignment:.leading, spacing: 0){

                        HStack{
                            
                            Image(systemName: "gear")
                                .foregroundColor(Color("ColorTheme"))
                            
                            Text("Application")
                                .foregroundColor(Color("ColorTheme"))
                                .padding(.leading, 5)
                            Spacer()
                            
                            Text("CuppFee")
                                .foregroundColor(Color.gray)
                        }
                        .padding(.leading, 10)
                        .padding(.top, 5)
                        .padding(.trailing, 10)

                        
                        Divider()
                            .foregroundColor(Color.white)
                            .padding()
                        
                        HStack{
                            
                            Image(systemName: "checkmark.seal")
                                .foregroundColor(Color("ColorTheme"))
                            
                            Text("Compatibility")
                                .foregroundColor(Color("ColorTheme"))
                                .padding(.leading, 5)
                            Spacer()
                            
                            Text("iPhone / iPad")
                                .foregroundColor(Color.gray)

                        }
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
         
                        
                        Divider()
                            .foregroundColor(Color.white)
                            .padding()
                        
                        HStack{
                            
                            Image(systemName: "keyboard")
                                .foregroundColor(Color("ColorTheme"))
                            
                            Text("Developer")
                                .foregroundColor(Color("ColorTheme"))
                                .padding(.leading, 5)
                            Spacer()
                            
                            Text("Abhishek Joshi")
                                .foregroundColor(Color.gray)
                        }
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        
                        Divider()
                            .foregroundColor(Color.white)
                            .padding()
                        
                        HStack{
                            
                            Image(systemName: "paintbrush")
                                .foregroundColor(Color("ColorTheme"))
                            
                            Text("Designer")
                                .foregroundColor(Color("ColorTheme"))
                                .padding(.leading, 5)
                            Spacer()
                            
                            Text("Abhishek Joshi")
                                .foregroundColor(Color.gray)
                        }
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        
                        Divider()
                            .foregroundColor(Color.white)
                            .padding()
                        
                        HStack{
                            
                            Image(systemName: "flag")
                                .foregroundColor(Color("ColorTheme"))
                            
                            Text("Version")
                                .foregroundColor(Color("ColorTheme"))
                                .padding(.leading, 5)
                            Spacer()
                            
                            Text("1.0.0")
                                .foregroundColor(Color.gray)
                            
                        }
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        .padding(.bottom,5)
                        
                     
                    }
                    .padding()
                    .background(
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color("ColorBackground"))
                                .blendMode(.hardLight)
                        }
                    )
                    .padding(.leading)
                    .padding(.trailing)
                    .cornerRadius(20)
                    .foregroundStyle(.ultraThinMaterial)
                    
                    Spacer()
                    
                }
                
            }

            .navigationBarTitle("Settings", displayMode: .inline)

        }
        .navigationViewStyle(StackNavigationViewStyle())
    
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

struct FormItem: View {
    
    var title:String
    var endText:String
    
    var body: some View {
        VStack(alignment:.leading, spacing: 0){
            
            HStack{
                Text("Weather Settings").foregroundColor(Color.white)
                Spacer()
            }.padding(.top)
                .padding(.top)
                .padding(.leading)
            VStack{
                HStack{
                    Text("Hello")
                        .foregroundColor(Color.white)
                    Spacer()
                }
            }
            .padding()
            .background(
                
                ZStack{
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color("ColorBackground"))
                        .blendMode(.hardLight)
                        .opacity(0.8)
                }
            )
            .padding()
            .cornerRadius(20)
            .foregroundStyle(.ultraThinMaterial)
            Spacer()
            
        }
    }
}
