//
//  AppDependencyContainer.swift
//  BookRide
//
//  Created by ZEUS on 17/2/24.
//

import UIKit

public class AppDependencyContainer{
    let sharedMainViewModel: MainViewModel
    
    public init() {
        self.sharedMainViewModel = MainViewModel()
    }
    
    func makeMainViewController() -> MainViewController{
        let launchViewController = makeLaunchViewController()
        let onboardingViewController = makeOnBoardingViewController()
        
        return MainViewController(mainViewModel: sharedMainViewModel, launchViewController: launchViewController, onBoardingViewController: onboardingViewController)
    }
    
    func makeLaunchViewController() -> LaunchViewController{
        let launchViewModel = makeLaunchViewModel()
        return LaunchViewController(viewModel: launchViewModel)
    }
    
    func makeLaunchViewModel() -> LaunchViewModel {
        return LaunchViewModel(signedInResponder: sharedMainViewModel, notSignedInResponder: sharedMainViewModel)
    }
    
    func makeOnBoardingViewModel() -> OnboardingViewModel{
        return OnboardingViewModel()
    }
    
    func makeOnBoardingViewController() -> OnboardingViewController{
        let onboardingViewModel = makeOnBoardingViewModel()
        return OnboardingViewController(viewModel: onboardingViewModel)
    }
}

extension AppDependencyContainer : LaunchViewModelFactory{
}
