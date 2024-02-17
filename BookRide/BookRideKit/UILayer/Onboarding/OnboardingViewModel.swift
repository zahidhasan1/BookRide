//
//  OnboardingViewModel.swift
//  BookRide
//
//  Created by ZEUS on 17/2/24.
//

import Foundation
import Combine

public typealias OnboardingNavigationAction = NavigationAction<OnboardingView>

public class OnboardingViewModel: GotoSignInNavigator, GotoSignUpNavigator{
    
    @Published public private(set) var navigationAction: OnboardingNavigationAction = OnboardingNavigationAction.present(view: .welcome)
    
    public init(){}
    
    public func gotoSignIn() {
        navigationAction = .present(view: .signIn)
    }
    
    public func gotoSignUp() {
        navigationAction = .present(view: .signUp)
    }
}
