//
//  TextValidation.swift
//  BookRide
//
//  Created by ZEUS on 23/2/24.
//

import Foundation

extension String {
    func checkValidation(textType: TextType = .normal) -> Result<Bool, TextValidationError>{
        if self.isEmpty {return .failure(.empty)}
        
        let validator = getValidator(for: textType)
        
        return validator.validate(text: self) ? .success(true) : .failure(.notValid)
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
        }
    }
}
