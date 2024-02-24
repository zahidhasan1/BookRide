//
//  SignUpTextFieldValidator.swift
//  BookRide
//
//  Created by ZEUS on 24/2/24.
//

import Foundation
protocol SignUpValidator{
    func validateFullName() -> ErrorMessage?
    func validateNickName() -> ErrorMessage?
    func validateEmail() -> ErrorMessage?
    func validatePhoneNumber() -> ErrorMessage?
    func validatePassword() -> ErrorMessage?
}
