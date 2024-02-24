//
//  SignInTextFieldValidator.swift
//  BookRide
//
//  Created by ZEUS on 24/2/24.
//

import Foundation
protocol SignInValidator{
    func validateEmail() -> ErrorMessage?
    func validatePassword() -> ErrorMessage?
}
