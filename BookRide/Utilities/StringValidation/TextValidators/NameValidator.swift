//
//  NameValidator.swift
//  BookRide
//
//  Created by ZEUS on 24/2/24.
//

import Foundation

struct NameValidator: TextValidation{
    func validate(text: String) -> Bool {
        // Check if name contains any special characters
        let specialCharacters = CharacterSet(charactersIn: "!@#$%^&*()-_+=[]{}|:;<>,.?/~0123456789")
        if text.rangeOfCharacter(from: specialCharacters) != nil {
            return false
        }
        
        // Check if name has at least 2 characters
        if text.count < 2 {
            return false
        }
        
        // If all conditions are met, return true
        return true
    }
    
    
}
