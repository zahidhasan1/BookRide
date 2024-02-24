//
//  TextValidation.swift
//  BookRide
//
//  Created by ZEUS on 23/2/24.
//

import Foundation

extension String {
    func checkValidation(textType: TextType = .normal) -> TextValidationError {
        if self.isEmpty {return .empty}
        
        let validator = getValidator(for: textType)
        
        
        let isValid = validator.validate(text: self)
        return isValid ? .valid : .notValid
        
        
    }
    
    private func getValidator(for textType: TextType = .normal) -> TextValidation {
        switch textType {
        case .email:
            return EmailValidator()
        case .password:
            return PasswordValidator()
        case .name:
            return NameValidator()
        case .normal:
            return NoValidation()
        case .phoneNumber:
            return PhoneNumberValidator()
        }
    }
}
