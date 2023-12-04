//
//  LoginViewModel.swift
//  Itribez_iOS
//
//  Created by Indu Pandey on 08/08/23.
//



import Foundation
import SwiftUI


struct ValidationResponse {
    let message: String?
    let isValid: Bool
}



class LoginViewModel:ObservableObject {
    
    @Published var isLogin:Bool = false
    @Published var errorMessage:ValidationResponse?
    //Here our model notify that was updated
    
    @Published var isToast = false
    
    
    
    var credentials:UserLoginModel = UserLoginModel.init(email: "", password: ""){
        didSet {
            
        }
    }
    
    func loginApi() {
        let validationResult = validatatioinCheck()

        if validationResult.isValid {
            print(credentials.email, "credentials.email", credentials.password, "credentials.password")
            self.loginUser(email: credentials.email, password: credentials.password) { result in
                switch result {
                case .success(let userResponse):
                    // Update UI with user data
                print(userResponse, "userResponse")
                    DispatchQueue.main.async
                    {
                        self.isLogin = true
                        UserDefaults.standard.set(userResponse.token, forKey: "AuthToken")
                        print("User logged in successfully.")
                    }
                case .failure(let error):
                    // Handle error
                    DispatchQueue.main.async
                    {
                        self.isLogin = false
                        self.isToast = true
                        self.errorMessage = ValidationResponse(message: "Credentials not matched!", isValid: false)
                        print("Error: \(error.localizedDescription)")
                    }
                }
            }
            
        } else {
            isToast = true
            errorMessage = validationResult
        }
    }
    
                                    
    
    func loginUser(email: String, password: String, completion: @escaping (Result<UserLoginResponse, Error>) -> Void) {
        let endpoint = "https://itribez-node-apis.onrender.com/user/login"
        let parameters = ["email": email, "password": password]
        
        APIManager.shared.request(endpoint: endpoint, method: "POST", parameters: parameters) { (result: Result<UserLoginResponse, Error>) in
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
