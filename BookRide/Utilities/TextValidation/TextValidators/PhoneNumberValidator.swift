//
//  PhoneNumberValidator.swift
//  BookRide
//
//  Created by ZEUS on 25/2/24.
//

import Foundation
struct PhoneNumberValidator: TextValidation{
    func validate(text: String) -> Bool {
        let pattern = "^\\d{7,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: text)
    }
}
