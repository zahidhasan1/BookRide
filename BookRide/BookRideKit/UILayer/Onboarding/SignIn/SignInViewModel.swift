//
//  SignInViewModel.swift
//  BookRide
//
//  Created by ZEUS on 20/2/24.
//

import Foundation
class SignInViewModel{
    init() {
    }
    
    var email: String = ""
    var password: String = ""
    
    @objc
    func signIn(){
        print("email: \(email)")
        print("password: \(password)")
    }
}
