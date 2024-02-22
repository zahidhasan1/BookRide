//
//  SignUpViewModel.swift
//  BookRide
//
//  Created by ZEUS on 21/2/24.
//

import Foundation
class SignUpViewModel{
    init() {
        
    }
    
    public var name = ""
    public var nickName = ""
    public var email = ""
    public var mobileNumber = ""
    public var password = ""
    
    @objc
    public func signUP() {
        print("name: \(name)")
        print("nickName: \(nickName)")
        print("email: \(email)")
        print("mobileNumber: \(mobileNumber)")
        print("password: \(password)")
    }
    
}
