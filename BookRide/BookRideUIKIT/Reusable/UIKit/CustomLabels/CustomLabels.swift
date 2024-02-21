//
//  CustomLabels.swift
//  BookRide
//
//  Created by ZEUS on 21/2/24.
//

import UIKit

final class CustomTextFields{
    public static func formTextField(placeholder: String) -> UITextField{
        let textField = UITextField()
        textField.font = UIFont(name: "Avenir-Book", size: 16)
        textField.placeholder = placeholder
        textField.backgroundColor = .clear
        textField.textColor = Color.EggShell
        textField.borderStyle = .roundedRect
        textField.tintColor = Color.EggShell
        textField.layer.borderColor = Color.EggShell.cgColor
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        if let placeholderText = textField.placeholder {
            textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor: Color.EggShell.withAlphaComponent(0.5)])
        }
        return textField
    }
    
    public static func passwordTextField(placeholder: String) -> UITextField{
        let textField = UITextField()
        textField.font = UIFont(name: "Avenir-Book", size: 16)
        textField.placeholder = placeholder
        textField.backgroundColor = .clear
        textField.textColor = Color.EggShell
        textField.borderStyle = .roundedRect
        textField.tintColor = Color.EggShell
        textField.layer.borderColor = Color.EggShell.cgColor
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        if let placeholderText = textField.placeholder {
            textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor: Color.EggShell.withAlphaComponent(0.5)])
        }
        return textField
    }
}
