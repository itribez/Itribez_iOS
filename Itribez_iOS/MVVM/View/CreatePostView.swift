//
//  CreatePostView.swift
//  Itribez_iOS
//
//  Created by Indu Pandey on 04/12/23.
//

import SwiftUI

struct CreatePostView: View {
    
    @State private var image: Image? = Image("karthick")
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionScheet = false
    @State private var shouldPresentCamera = false
    @State var caption: String = ""
    @State var location: String = ""
    @State var people: String = ""
    
    var body: some View {
        // WARNING: Force wrapped image for demo purpose
        NavigationView{
            VStack{
                VStack(spacing: 15){
                    image!
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                        .onTapGesture { self.shouldPresentActionScheet = true }
                        .sheet(isPresented: $shouldPresentImagePicker) {
                            SUImagePickerView(sourceType: self.shouldPresentCamera ? .camera : .photoLibrary, image: self.$image, isPresented: self.$shouldPresentImagePicker)
                    }.actionSheet(isPresented: $shouldPresentActionScheet) { () -> ActionSheet in
                        ActionSheet(title: Text("Choose mode"), message: Text("Please choose your preferred mode to set your profile image"), buttons: [ActionSheet.Button.default(Text("Camera"), action: {
                            self.shouldPresentImagePicker = true
                            self.shouldPresentCamera = true
                        }), ActionSheet.Button.default(Text("Photo Library"), action: {
                            self.shouldPresentImagePicker = true
                            self.shouldPresentCamera = false
                        }), ActionSheet.Button.cancel()])
                    }
              
                    
           //Caption
                Text("Add Your Caption")
                  .font(Font.custom("Montserrat", size: 12))
                  .padding(8)
                  .foregroundColor(Color(red: 0.4, green: 0.44, blue: 0.52))
                // First Name
                TextField("Add Your Caption", text:$caption.onChange({ (value) in
                    
                }))
                    .frame(height: 30)
                    .padding(15)
                    .background(.gray.opacity(0.05))
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1))
                    .font(.system(size: 14))
                    .accessibilityIdentifier("caption")
                    
            //Location
                Text("Add Location")
                  .font(Font.custom("Montserrat", size: 12))
                  .padding(8)
                  .foregroundColor(Color(red: 0.4, green: 0.44, blue: 0.52))
                // First Name
                TextField("Add Location", text:$location.onChange({ (value) in
                    
                }))
                    .frame(height: 30)
                    .padding(15)
                    .background(.gray.opacity(0.05))
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1))
                    .font(.system(size: 14))
                    .accessibilityIdentifier("caption")
                    
                    
                    
           //People
                        Text("Add People")
                          .font(Font.custom("Montserrat", size: 12))
                          .padding(8)
                          .foregroundColor(Color(red: 0.4, green: 0.44, blue: 0.52))
                        // First Name
                        TextField("Add People", text:$people.onChange({ (value) in
                            
                        }))
                            .frame(height: 30)
                            .padding(15)
                            .background(.gray.opacity(0.05))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1))
                            .font(.system(size: 14))
                            .accessibilityIdentifier("caption")
             //Button
                   
                    Button(action: {
                        
//                        viewModel.credentials = UserSignUpModel.init(password:  password, firstname: firstname, email: emailID, lastname: lastname)
//                        viewModel.signUpApi()
                        
                    }) {
                        Text("Post")
                            .font(.system(size: 13))
                            .fontWeight(.bold)
                        
                        
                    }.frame(maxWidth: .infinity,maxHeight: 45)
                        .foregroundColor(Color.white)
                        .background(Color.black)
                        .cornerRadius(8)
                        .accessibilityIdentifier("postButton")
                        
                }.padding(15)
            }
        }
     
    }
}

struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostView()
    }
}
