//
//  NormalValidator.swift
//  BookRide
//
//  Created by ZEUS on 24/2/24.
//

import Foundation
struct NoValidation: TextValidation{
    func validate(text: String) -> Bool {
        return true
    }
}
