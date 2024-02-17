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
        return MainViewController(mainViewModel: sharedMainViewModel, launchViewController: launchViewController)
    }
    
    func makeLaunchViewController() -> LaunchViewController{
        let launchViewModel = LaunchViewModel()
        return LaunchViewController(viewModel: launchViewModel)
    }
}
