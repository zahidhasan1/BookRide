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
        let onboardingDependencyContainer = OnboardingDependencyContainer()
        
        return MainViewController(mainViewModel: sharedMainViewModel, launchViewController: launchViewController, onBoardingViewController: onboardingDependencyContainer.makeOnBoardingViewController())
    }
    
    func makeLaunchViewController() -> LaunchViewController{
        let launchViewModel = makeLaunchViewModel()
        return LaunchViewController(viewModel: launchViewModel)
    }
    
    func makeOnBoardingViewModel() -> OnboardingViewModel{
        return OnboardingViewModel()
    }
}

extension AppDependencyContainer : LaunchViewModelFactory{
    func makeLaunchViewModel() -> LaunchViewModel {
        return LaunchViewModel(signedInResponder: sharedMainViewModel, notSignedInResponder: sharedMainViewModel)
    }
}
