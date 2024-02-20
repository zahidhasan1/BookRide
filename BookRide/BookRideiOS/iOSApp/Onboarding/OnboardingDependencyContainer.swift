//
//  OnboardingDependencyContainer.swift
//  BookRide
//
//  Created by ZEUS on 18/2/24.
//

import UIKit

public class OnboardingDependencyContainer{
    //MARK: - Properties
    let sharedOnboardingViewModel: OnboardingViewModel
    
    public init() {
        func makeOnboardingViewModel() -> OnboardingViewModel{
            return OnboardingViewModel()
        }
        self.sharedOnboardingViewModel = makeOnboardingViewModel()
    }
    
    func makeOnBoardingViewController() -> OnboardingViewController{
        
        let welcomeViewController = makeWelcomeViewController()
        let signInViewController = makeSignInViewController()
        
        return OnboardingViewController(viewModel: sharedOnboardingViewModel, welcomeViewController: welcomeViewController, signInViewController: signInViewController)
    }
    
    func makeWelcomeViewController() -> WelcomeViewController{
        return WelcomeViewController(welcomeViewModelFactory: self)
    }
    
    func makeSignInViewController() -> SignInViewController{
        return SignInViewController(viewModelFactory: self)
    }
}

extension OnboardingDependencyContainer: WelcomeViewModelFactory{
    func makeWelcomeViewModel() -> WelcomeViewModel {
        return WelcomeViewModel(gotoSignInNavigator: sharedOnboardingViewModel, gotoSignUpNavigatopr: sharedOnboardingViewModel)
    }
}

extension OnboardingDependencyContainer: SignInViewModelFactory{
    func makeSignInViewModel() -> SignInViewModel {
        return SignInViewModel()
    }
}
