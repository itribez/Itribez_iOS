//
//  SignUpView.swift
//  Itribez_iOS
//
//  Created by Indu Pandey on 03/12/23.
//

import SwiftUI

struct SignUpView: View {
    @State var username:String = ""
    @State var firstname:String = ""
    @State var lastname:String = ""
    @State var emailID:String = ""
    @State var password:String = ""
    
    @ObservedObject var viewModel = SignUpViewModel()
    @State private var showShareSheet = false
    @State var isSignUpEnable:Bool = false
    
    @FocusState var focused: focusedField?
    @State var showPassword: Bool = false
    var line: some View {
        VStack { Divider().background(.gray) }.padding()
    }
    
    enum focusedField {
        case secure, unSecure
    }
    

    var body: some View {
        
        NavigationView{
            VStack{
                //Header top
//                HStack(spacing: 12){
//
//                    HStack{
//                        Spacer()
//                        Button(action: {
//
//                        }) {
//                            Image(uiImage: UIImage.init(named: "close")!)
//                                .resizable()
//
//                                .frame(width: 20, height: 20)
//                                .scaledToFit()
//                                .foregroundColor(.primary)
//
//                        }
//
//
//                    }.padding([.horizontal,.top])
//
//                }
              
                
                VStack(spacing: 20){
                    Image(uiImage: UIImage.init(named: "logo")!)
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: 30, alignment: .leading)
                        .foregroundColor(.primary)
                    
                    Text("Hey Tribez Buds!")
                    .font(
                    Font.custom("Montserrat", size: 32)
                    .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                    .frame(width: 262, alignment: .top)
                    
                    Text("Create Your Account")
                    .font(Font.custom("Montserrat", size: 18))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                    .frame(width: 171, alignment: .top)
                    
                    // First Name
                    TextField("First Name", text:$firstname.onChange({ (value) in
//                        isSignUpEnable =  !emailID.isEmpty && !password.isEmpty
                        
                    }))
                        .frame(height: 25)
                        .padding(8)
                        .background(.gray.opacity(0.05))
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1))
                        .font(.system(size: 14))
                        .accessibilityIdentifier("firstname_textfield")
                    
                    // Last Name
                    TextField("Last Name", text:$lastname.onChange({ (value) in
//                        isSignUpEnable =  !emailID.isEmpty && !password.isEmpty
                        
                    }))
                        .frame(height: 25)
                        .padding(8)
                        .background(.gray.opacity(0.05))
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1))
                        .font(.system(size: 14))
                        .accessibilityIdentifier("lastname_textfield")
                    
                    // Email Id
                    TextField("Email ID", text:$emailID.onChange({ (value) in
//                        isSignUpEnable =  !emailID.isEmpty && !password.isEmpty
                        
                    }))
                        .frame(height: 25)
                        .padding(8)
                        .background(.gray.opacity(0.05))
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1))
                        .font(.system(size: 14))
                        .accessibilityIdentifier("email_textfield")
                    
                    // Password
                    HStack {
                        ZStack(alignment: .trailing) {
                            TextField("Password", text: $password)
                                .focused($focused, equals: .unSecure)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                            // This is needed to remove suggestion bar, otherwise swapping between
                            // fields will change keyboard height and be distracting to user.
                                .keyboardType(.alphabet)
                                .frame(height: 25)
                                .padding(8)
                                .background(.gray.opacity(0.05))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.gray.opacity(0.3), lineWidth: 1))
                                .font(.system(size: 14))
                                .opacity(showPassword ? 1 : 0)
                            SecureField("Password", text: $password.onChange({ (value) in
                                isSignUpEnable =  !emailID.isEmpty && !password.isEmpty
                            }))
                                .frame(height: 25)
                                .padding(8)
                                .background(.gray.opacity(0.05))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.gray.opacity(0.3), lineWidth: 1))
                                .font(.system(size: 14))
                                .accessibilityIdentifier("password_textfield")
                                .focused($focused, equals: .secure)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                                .opacity(showPassword ? 0 : 1)
                            
                            
                            Button(action: {
                                showPassword.toggle()
                                focused = focused == .secure ? .unSecure : .secure
                            }, label: {
                                Image(systemName: self.showPassword ? "eye.slash.fill" : "eye.fill")
                                    .padding()
                            }).foregroundColor(Color.gray)
                        }
                    }
                    
                    
                    Button(action: {
                        
                        viewModel.credentials = UserSignUpModel.init(password:  password, firstname: firstname, email: emailID, lastname: lastname)
                        viewModel.signUpApi()
                        
                    }) {
                        Text("Sign Up")
                            .font(.system(size: 13))
                            .fontWeight(.bold)
                        
                        
                    }.frame(maxWidth: .infinity,maxHeight: 45)
                        .foregroundColor(Color.white)
                        .background(isSignUpEnable ?  Color.black: Color.black.opacity(0.4))
                        .cornerRadius(8)
                        .accessibilityIdentifier("signupButton")
                        .disabled(!isSignUpEnable)
                    
                   
                    
                    
                }.padding(25)
                
                NavigationLink(destination: TabbarView(), isActive: $viewModel.isSignUp) {
                    EmptyView()
                }.hidden()
                
               
                HStack{
                    Text("You have an account?")
                        .font(.system(size: 15))
                    
                    Button(action: {
                        
                        showShareSheet = true
                    }) {
                        Text("Sign In.")
                            .font(.system(size: 15))
                        
                        
                    }
                    .foregroundColor(Color.black)
                    .background(Color.clear)
                    
                    
                }.frame(alignment: .bottom)
            }.sheet(isPresented: $showShareSheet) {
                ShareSheet(activityItems: ["Hello World"])
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .overlay(overlayView: Banner.init(data: Banner.BannerDataModel(title: "Sign Up", detail: viewModel.errorMessage?.message ?? "", type: .error), show:$viewModel.isToast)
                     , show: $viewModel.isToast)
        }
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
