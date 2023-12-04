//
//  LoginModel.swift
//  Itribez_iOS
//
//  Created by Indu Pandey on 08/08/23.
//


import Foundation


struct UserLoginModel: Codable{
    var email: String
    var password: String
}

struct UserLoginResponse: Codable {
    var token: String
    var userId: String
}


struct UserSignUpModel: Codable{
    var password: String
    var firstname: String
    var email: String
    var lastname: String
}

struct UserSignUpResponse: Codable {
    var token: String
    var message: String
}
