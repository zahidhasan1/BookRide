//
//  PasswordValidator.swift
//  BookRide
//
//  Created by ZEUS on 24/2/24.
//

import Foundation
/// This function checks if a password meets the minimum strength requirements established for your application.
/// - Parameter password: String representing the password to be validated.
/// - Returns: true if the password meets requirements, false otherwise
/// - Minimum Length of 8 charecters
/// - Uppercase letter (A-Z)
/// - Lowercase letter(a-z)
/// - Number(0-9)
/// - Special character (!@#$%^&*()_+-=[]{};':",<.>/?|~`)
struct PasswordValidator: TextValidation{
    func validate(text: String) -> Bool {
        // Check if password is at least 8 characters long
        if text.count < 8 {
            return false
        }
        
        // Check if password contains at least 1 uppercase letter
        let uppercaseRegex = ".*[A-Z]+.*"
        if !NSPredicate(format: "SELF MATCHES %@", uppercaseRegex).evaluate(with: text) {
            return false
        }
        
        // Check if password contains at least 1 lowercase letter
        let lowercaseRegex = ".*[a-z]+.*"
        if !NSPredicate(format: "SELF MATCHES %@", lowercaseRegex).evaluate(with: text) {
            return false
        }
        
        // Check if password contains at least 1 digit
        let digitRegex = ".*[0-9]+.*"
        if !NSPredicate(format: "SELF MATCHES %@", digitRegex).evaluate(with: text) {
            return false
        }
        
        // Check if password contains at least 1 special character
        let specialCharacters = "!@#$%^&*()-_+=[]{}|:;<>,.?/~"
        let specialCharacterSet = CharacterSet(charactersIn: specialCharacters)
        if text.rangeOfCharacter(from: specialCharacterSet) == nil {
            return false
        }
        
        // If all conditions are met, return true
        return true
    }
    
    
}
