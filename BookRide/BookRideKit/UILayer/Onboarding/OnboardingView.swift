//
//  OnboardingView.swift
//  BookRide
//
//  Created by ZEUS on 18/2/24.
//

import Foundation

public enum OnboardingView{
    case welcome
    case signIn
    case signUp
    
    public func hideNavigationBar() -> Bool{
        switch self {
        case .welcome:
            return true
        default:
            return false
        }
    }
}
