//
//  loginView.swift
//  Itribez_iOS
//
//  Created by Devarshi on 18/09/23.
//

import SwiftUI

struct LoginView: View {
    
    
    @State var emailID:String = ""
    @State var password:String = ""
    @ObservedObject var viewModel = LoginViewModel()
    @State private var showShareSheet = false
    @State var isLoginEnable:Bool = false
    
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
                HStack(spacing: 12){
                    
                    HStack{
                        Spacer()
                        Button(action: {
                            
                        }) {
                            Image(uiImage: UIImage.init(named: "close")!)
                                .resizable()
                            
                                .frame(width: 20, height: 20)
                                .scaledToFit()
                                .foregroundColor(.primary)
                            
                        }
                        
                        
                    }.padding([.horizontal,.top])
                    
                }
              
                
                
                VStack(spacing: 20){
                    Image(uiImage: UIImage.init(named: "logo")!)
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: 30, alignment: .leading)
                        .foregroundColor(.primary)
                    
                    Text("Welcome Back!")
                    .font(
                    Font.custom("Montserrat", size: 32)
                    .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                    .frame(width: 262, alignment: .top)
                    
                    Text("Sign in to continue")
                    .font(Font.custom("Montserrat", size: 18))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                    .frame(width: 171, alignment: .top)
                    
                    
                    TextField("Phone Number,username or email", text:$emailID.onChange({ (value) in
                        isLoginEnable =  !emailID.isEmpty && !password.isEmpty
                        
                    }))
                        .frame(height: 25)
                        .padding(8)
                        .background(.gray.opacity(0.05))
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1))
                        .font(.system(size: 14))
                        .accessibilityIdentifier("email_textfield")
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
                                isLoginEnable =  !emailID.isEmpty && !password.isEmpty
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
                    
                    Button(action: {}) {
                        Text("Forgot Password?")
                            .font(.system(size: 13))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                    }.frame(maxWidth: .infinity,maxHeight: 45,alignment: .trailing)
                        .foregroundColor(Color.white)
                        .background(Color.clear)
                        .cornerRadius(8)
                    
                    
                    
                    Button(action: {
                        
                        viewModel.credentials = UserLoginModel.init(email: emailID, password:  password)
                        viewModel.loginApi()
                        
                    }) {
                        Text("Login")
                            .font(.system(size: 13))
                            .fontWeight(.bold)
                        
                        
                    }.frame(maxWidth: .infinity,maxHeight: 45)
                        .foregroundColor(Color.white)
                        .background(isLoginEnable ?  Color.black: Color.black.opacity(0.4))
                        .cornerRadius(8)
                        .accessibilityIdentifier("loginButton")
                        .disabled(!isLoginEnable)
                    
                    HStack{
                        line
                        Text("OR")
                            .font(.system(size: 13))
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        line
                    }
                    
                    HStack{
                        
                        Button(action: {}) {
                            Image(uiImage: UIImage.init(named: "facebook_1")!)
                                .resizable()
                            
                                .frame(width: 15, height: 15)
                                .scaledToFit()
                                .foregroundColor(.primary)
                            Text("Facebook")
                                .font(.system(size: 13))
                                .fontWeight(.bold)
                            
                        }.frame(maxWidth: .infinity,maxHeight: 45)
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(8)
                            .accessibilityIdentifier("loginButton")
                            
                        
                    }.frame(alignment: .bottom)
                    
                    
                }.padding(25)
                
                NavigationLink(destination: TabbarView(), isActive: $viewModel.isLogin) {
                    EmptyView()
                }.hidden()
                
                Spacer()
                HStack{
                    Text("Don't have an account?")
                        .font(.system(size: 15))
                    
                    Button(action: {
                        
                        showShareSheet = true
                    }) {
                        Text("Signup.")
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
            .overlay(overlayView: Banner.init(data: Banner.BannerDataModel(title: "Login", detail: viewModel.errorMessage?.message ?? "", type: .error), show:$viewModel.isToast)
                     , show: $viewModel.isToast)
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


struct ShareSheet: UIViewControllerRepresentable {
    typealias Callback = (_ activityType: UIActivity.ActivityType?, _ completed: Bool, _ returnedItems: [Any]?, _ error: Error?) -> Void
    
    let activityItems: [Any]
    let applicationActivities: [UIActivity]? = nil
    let excludedActivityTypes: [UIActivity.ActivityType]? = nil
    let callback: Callback? = nil
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: applicationActivities)
        controller.excludedActivityTypes = excludedActivityTypes
        controller.completionWithItemsHandler = callback
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        // nothing to do here
    }
}



extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler(newValue)
            }
        )
    }
}

