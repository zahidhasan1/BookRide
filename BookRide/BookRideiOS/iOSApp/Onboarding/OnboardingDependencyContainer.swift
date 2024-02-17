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
        
        return OnboardingViewController(viewModel: sharedOnboardingViewModel, welcomeViewController: welcomeViewController)
    }
    
    func makeWelcomeViewController() -> WelcomeViewController{
        return WelcomeViewController(welcomeViewModelFactory: self)
    }
}

extension OnboardingDependencyContainer: WelcomeViewModelFactory{
    func makeWelcomeViewModel() -> WelcomeViewModel {
        return WelcomeViewModel()
    }
    
    
}
