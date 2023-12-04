//
//  SignUpViewModel.swift
//  Itribez_iOS
//
//  Created by Indu Pandey on 03/12/23.
//

import Foundation
import SwiftUI


class SignUpViewModel:ObservableObject {
    
    @Published var isSignUp:Bool = false
    @Published var errorMessage: ValidationResponse?
    
    @Published var isToast = false
    
    
    
    var credentials:UserSignUpModel = UserSignUpModel.init(password: "", firstname: "", email: "", lastname: ""){
        didSet {
            
        }
    }
    
    func signUpApi() {
        let validationResult = validatatioinCheck()

        if validationResult.isValid {
            print(credentials.email, "credentials.email", credentials.password, "credentials.password")
            self.signUpUser( firstname: credentials.firstname, email: credentials.email, lastname: credentials.lastname, password: credentials.password) { result in
                switch result {
                case .success(let userResponse):
                    // Update UI with user data
                print(userResponse, "userResponse")
                    self.isSignUp = true
                    UserDefaults.standard.set(userResponse.token, forKey: "AuthToken")
                    print("User registered in successfully.")
                case .failure(let error):
                    // Handle error
                    self.isSignUp = false
                    self.isToast = true
                    self.errorMessage = ValidationResponse(message: "Credentials not matched!", isValid: false)
                    print("Error: \(error.localizedDescription)")
                }
            }
            
        } else {
            isToast = true
            errorMessage = validationResult
        }
    }
    

                                    
    
    func signUpUser( firstname: String, email: String,lastname: String, password: String, completion: @escaping (Result<UserSignUpResponse, Error>) -> Void) {
        let endpoint = "https://itribez-node-apis.onrender.com/user/register"
        let parameters = ["firstname": firstname,"lastname": lastname, "email": email, "password": password]
        
        APIManager.shared.request(endpoint: endpoint, method: "POST", parameters: parameters) { (result: Result<UserSignUpResponse, Error>) in
            switch result {
            case .success(let updatedUserResponse):
                print(updatedUserResponse, "updatedUserResponse")
                completion(.success(updatedUserResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    
    //Validation check method
    func validatatioinCheck()->ValidationResponse{
        if credentials.email.isEmpty{
            return  ValidationResponse(message: "Email cannot be empty", isValid: false)
            
        } else if credentials.email.contains("@") && credentials.email.isValidEmail() == false{
            return ValidationResponse(message: "Enter valid email", isValid: false)
        } else if !credentials.email.isNumber && credentials.email.isAlphanumeric && credentials.email.isValidUsername() == false{
            return ValidationResponse(message: "Enter valid username", isValid: false)
        }
        else if credentials.password.isEmpty{
            return ValidationResponse(message: "Password cannot be empty", isValid: false)
        }
        return ValidationResponse(message: "", isValid: true)
    }
}
