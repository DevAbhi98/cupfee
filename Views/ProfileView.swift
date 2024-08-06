//
//  ProfileView.swift
//  Cuppfee
//
//  Created by The Seven Stallions on 30/06/22.
//

import SwiftUI
import UIKit
import PhoneNumberKit
import iPhoneNumberField
import Combine


struct ProfileView: View {
    
    @ObservedObject var textBindingManager = TextBindingManager(limit: 10)
    @ObservedObject private var numberModel = PhoneNumberModel()
    @State var selectedAvatar:String = ""
    @State var notValidPhoneNumber:Bool = false
    @ObservedObject var mainModel:MainViewModel
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>

    let columns = [
        GridItem(.flexible(minimum:10), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
        ]
    
    init(mainModel:MainViewModel){
        self.mainModel = mainModel
        selectedAvatar = mainModel.currentAvatar
        profileName = mainModel.yourName
        phoneNumber = mainModel.phoneNumber
    }
    
    @State var profileName:String = ""
    @State var phoneNumber:String = ""
    
    func stringContainsLetters(string:String) -> Bool{
        let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
        if(string.rangeOfCharacter(from: characterset.inverted) != nil){
            return true
        }else{
            return false
        }
    }
    
    func saveData(){
        mainModel.avatarChanged = false
        mainModel.nameChanged = false
        mainModel.phoneChanged = false
        mainModel.currentAvatar = selectedAvatar
        mainModel.yourName = profileName
        mainModel.phoneNumber = phoneNumber
        mainModel.saveSettingsData()
        presentationMode.wrappedValue.dismiss()
    }
    
    func decide() -> Binding<String>{
        if(mainModel.editModeOn){
            return $profileName
        }else{
            return $mainModel.yourName
        }
    }
    
    func validPhoneNumber() -> Bool{
        if(phoneNumber.count > 10 || phoneNumber.count < 10){
            return false
        }else{
            return true
        }
    }
    
    func phoneNumberr() -> Binding<String>{
        if(mainModel.editModeOn){
            return $textBindingManager.text
        }else{
            return $mainModel.phoneNumber
        }
    }
    
    func validPhone() -> Bool{
        if(phoneNumber.isValidPhoneNumber() || mainModel.phoneNumber.isValidPhoneNumber()){
            return true
        }else{
            return false
        }
    }
    
    var body: some View {
        NavigationView{
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack{

                    HStack {
                        Text("Your Name")
                            .font(.system(size: 18, design: .rounded))
                            .fontWeight(.semibold)
                            .padding(.leading)
                            .padding(.top)
                            .disabled(mainModel.editModeOn ? false:true)
                        Spacer()
                    }
                    HStack {
                        TextField("Enter Your Name", text: mainModel.editModeOn ? $profileName:$mainModel.yourName)
                            .disabled(mainModel.editModeOn ? false:true)
                            .padding()
                            .background(Color("ColorBackground"))
                            .cornerRadius(10)
                            .onTapGesture {
                                mainModel.nameChanged = true
                            }
                            .padding(.leading)
                            .padding(.trailing)
                    }
                    
                    HStack {
                        Text("Your Phone Number")
                            .font(.system(size: 18, design: .rounded))
                            .fontWeight(.semibold)
                            .padding(.leading)
                            .padding(.top)
                        Spacer()
                    }
                    
                    TextField("Enter your phone number", text: mainModel.editModeOn ? $phoneNumber:$mainModel.phoneNumber)
                        .padding()
                        .disabled(mainModel.editModeOn ? false:true)
                        .background(Color("ColorBackground"))
                        .cornerRadius(10)
                        .onTapGesture {
                            mainModel.phoneChanged = true
                        }
                        .padding(.leading)
                        .padding(.trailing)
                        .onReceive(Just(phoneNumber)) { newValue in
                                   let filtered = phoneNumber.filter { "0123456789".contains($0) }
                                   if filtered != newValue {
                                       self.phoneNumber = filtered
                                   }
                        }
                    
                    HStack{
                        Text("Please enter a valid phone number!")
                            .font(.system(size: 13))
                            .foregroundColor(.red)
                            .opacity(notValidPhoneNumber ?  1:0)
                        Spacer()
                    }
                    .padding(.leading)
                    
                    HStack {
                        Text("Choose your avatar")
                            .font(.system(size: 18, design: .rounded))
                            .fontWeight(.semibold)
                            .padding(.leading)
                            .padding(.top)
                        Spacer()
                    }
                    
       
                        LazyVGrid(columns: columns, spacing: 10){
                            ZStack {

                                Image("avatar-1")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:100)
                                
                                Circle()
                                    .strokeBorder(Color("ColorTheme"), lineWidth: 5)
                                    .frame(width:120)
                                    .overlay(
                                        Image("correct")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width:30)
                                            .padding(.bottom, 10)
                                            .padding(.trailing, 5)
                                        ,alignment: .bottomTrailing
                                        
                                    )
                                    .opacity(mainModel.avatarChanged ? (selectedAvatar=="avatar-1" ? 1:0) : (mainModel.currentAvatar=="avatar-1" ? 1:0))

                            }
                            .onTapGesture {
                                mainModel.avatarChanged = true
                                selectedAvatar = "avatar-1"
                            }
                            .fixedSize()

                            ZStack {

                                Image("avatar-2")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:100)
                                
                                Circle()
                                    .strokeBorder(Color("ColorTheme"), lineWidth: 5)
                                    .frame(width:120)
                                    .overlay(
                                        Image("correct")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width:30)
                                            .padding(.bottom, 10)
                                            .padding(.trailing, 5)
                                        ,alignment: .bottomTrailing
                                        
                                    )
                                    .opacity(mainModel.avatarChanged ? (selectedAvatar=="avatar-2" ? 1:0) : (mainModel.currentAvatar=="avatar-2" ? 1:0))
                            }
                            .onTapGesture {
                                mainModel.avatarChanged = true
                                selectedAvatar="avatar-2"
                            }
                            
                            ZStack {

                                Image("avatar-3")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:100)
                                
                                Circle()
                                    .strokeBorder(Color("ColorTheme"), lineWidth: 5)
                                    .frame(width:120)
                                    .overlay(
                                        Image("correct")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width:30)
                                            .padding(.bottom, 10)
                                            .padding(.trailing, 5)
                                        ,alignment: .bottomTrailing
                                        
                                    )
                                    .opacity(mainModel.avatarChanged ? (selectedAvatar=="avatar-3" ? 1:0) : (mainModel.currentAvatar=="avatar-3" ? 1:0))
                            }
                            .onTapGesture {
                                mainModel.avatarChanged = true
                                selectedAvatar="avatar-3"
                            }
                            
                            ZStack {

                                Image("avatar-4")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:100)
                                
                                Circle()
                                    .strokeBorder(Color("ColorTheme"), lineWidth: 5)
                                    .frame(width:120)
                                    .overlay(
                                        Image("correct")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width:30)
                                            .padding(.bottom, 10)
                                            .padding(.trailing, 5)
                                        ,alignment: .bottomTrailing
                                    )
                                    .opacity(mainModel.avatarChanged ? (selectedAvatar=="avatar-4" ? 1:0) : (mainModel.currentAvatar=="avatar-4" ? 1:0))
                            }
                            .onTapGesture {
                                mainModel.avatarChanged = true
                                selectedAvatar="avatar-4"
                            }
                            
                            
                            ZStack {

                                Image("avatar-5")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:100)
                                
                                Circle()
                                    .strokeBorder(Color("ColorTheme"), lineWidth: 5)
                                    .frame(width:120)
                                    .overlay(
                                        Image("correct")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width:30)
                                            .padding(.bottom, 10)
                                            .padding(.trailing, 5)
                                        ,alignment: .bottomTrailing
                                    )
                                    .opacity(mainModel.avatarChanged ? (selectedAvatar=="avatar-5" ? 1:0) : (mainModel.currentAvatar=="avatar-5" ? 1:0))
                            }
                            .onTapGesture {
                                mainModel.avatarChanged = true
                                selectedAvatar="avatar-5"
                            }
                            
                            ZStack {

                                Image("avatar-6")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:100)
                                
                                Circle()
                                    .strokeBorder(Color("ColorTheme"), lineWidth: 5)
                                    .frame(width:120)
                                    .overlay(
                                        Image("correct")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width:30)
                                            .padding(.bottom, 10)
                                            .padding(.trailing, 5)
                                        ,alignment: .bottomTrailing
                                    )
                                    .opacity(mainModel.avatarChanged ? (selectedAvatar=="avatar-6" ? 1:0) : (mainModel.currentAvatar=="avatar-6" ? 1:0))
                            }
                            .onTapGesture {
                                mainModel.avatarChanged = true
                                selectedAvatar="avatar-6"
                            }
                            
                            ZStack {

                                Image("avatar-7")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:100)
                                
                                Circle()
                                    .strokeBorder(Color("ColorTheme"), lineWidth: 5)
                                    .frame(width:120)
                                    .overlay(
                                        Image("correct")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width:30)
                                            .padding(.bottom, 10)
                                            .padding(.trailing, 5)
                                        ,alignment: .bottomTrailing
                                    )
                                    .opacity(mainModel.avatarChanged ? (selectedAvatar=="avatar-7" ? 1:0) : (mainModel.currentAvatar=="avatar-7" ? 1:0))
                            }
                            .onTapGesture {
                                mainModel.avatarChanged = true
                                selectedAvatar="avatar-7"
                            }
                            
                            ZStack {

                                Image("avatar-8")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:100)
                                
                                Circle()
                                    .strokeBorder(Color("ColorTheme"), lineWidth: 5)
                                    .frame(width:120)
                                    .overlay(
                                        Image("correct")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width:30)
                                            .padding(.bottom, 10)
                                            .padding(.trailing, 5)
                                        ,alignment: .bottomTrailing
                                    )
                                    .opacity(mainModel.avatarChanged ? (selectedAvatar=="avatar-8" ? 1:0) : (mainModel.currentAvatar=="avatar-8" ? 1:0))
                            }
                            .onTapGesture {
                                mainModel.avatarChanged = true
                                selectedAvatar="avatar-8"
                            }
                            
                            ZStack {

                                Image("avatar-9")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:100)
                                
                                Circle()
                                    .strokeBorder(Color("ColorTheme"), lineWidth: 5)
                                    .frame(width:120)
                                    .overlay(
                                        Image("correct")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width:30)
                                            .padding(.bottom, 10)
                                            .padding(.trailing, 5)
                                        ,alignment: .bottomTrailing
                                        
                                    )
                                    .opacity(mainModel.avatarChanged ? (selectedAvatar=="avatar-9" ? 1:0) : (mainModel.currentAvatar=="avatar-9" ? 1:0))
                            }
                            .onTapGesture {
                                mainModel.avatarChanged = true
                                selectedAvatar="avatar-9"
                            }
                        }
                        .disabled(mainModel.editModeOn ? false:true)
                    
                    
                    
                    Spacer()
                    
                    
                    
                }.navigationBarTitle("Profile",  displayMode: .inline)
                    .toolbar(content: {
                        ToolbarItem(placement: .navigationBarTrailing) {
                                            HStack {
                                                Button(action: {
                                                    if(!mainModel.editModeOn){
                                                        phoneNumber = mainModel.phoneNumber
                                                        profileName = mainModel.yourName
                                                        selectedAvatar = mainModel.currentAvatar
                                                    }
                                                    print(mainModel.phoneNumber.count, phoneNumber.count)
                                                    if(mainModel.editModeOn){
                                                        if(validPhoneNumber() && stringContainsLetters(string: phoneNumber )){
                                                            notValidPhoneNumber = false
                                                            mainModel.editModeOn.toggle()
                                                            saveData()
                                                        }else{
                                                            notValidPhoneNumber = true
                                                        }
                                                    }else{
                                                        mainModel.editModeOn.toggle()
                                                    }
                                                    

                                                }, label: {
                                                    Text(mainModel.editModeOn ? "Save":"Edit")
                                                        .foregroundColor(Color("ColorTheme"))
                                                })
                                            }
                                        }
                        
                        ToolbarItem(placement: .navigationBarLeading) {
                                            HStack {
                                                Button(action: {
                                                    mainModel.editModeOn = false
                                                }, label: {
                                                    Text("Cancel")
                                                        .foregroundColor(Color("ColorTheme"))
                                                })
                                            }
                                            .opacity(mainModel.editModeOn ? 1:0)
                                        }
                        
                    })
            }
            
        }
    }
}

extension String {
    func isValidPhoneNumber() -> Bool {
        let regEx = "^\\+(?:[0-9]?){6,14}[0-9]$"

        let phoneCheck = NSPredicate(format: "SELF MATCHES[c] %@", regEx)
        return phoneCheck.evaluate(with: self)
    }
}

class TextBindingManager: ObservableObject {
    @Published var text = "" {
        didSet {
            if text.count > characterLimit && oldValue.count <= characterLimit {
                text = oldValue
            }
        }
    }
    let characterLimit: Int

    init(limit: Int = 10){
        characterLimit = limit
    }
}

struct PhoneNumberTextFieldView: UIViewRepresentable {
    @Binding var phoneNumber: String
    private let textField = PhoneNumberTextField()
 
    func makeUIView(context: Context) -> PhoneNumberTextField {
        
        textField.withExamplePlaceholder = true
        //textField.font = UIFont(name: GlobalConstant.paragraphFont.rawValue, size: 17)
        textField.withFlag = false
        textField.withPrefix = false
        // textField.placeholder = "Enter phone number"
        textField.becomeFirstResponder()
        return textField
    }

    func getCurrentText() {
        self.phoneNumber = textField.text!
    }
    
    func updateUIView(_ view: PhoneNumberTextField, context: Context) {
  
    }
    
}

class PhoneNumberModel: ObservableObject {
    var limit: Int = 10

    @Published var number: String = "" {
        didSet {
            if number.count > limit {
                number = String(number.prefix(limit))
            }
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    
    static var mainModel:MainViewModel = MainViewModel()
    
    static var previews: some View {
        ProfileView(mainModel: mainModel)
    }
}
