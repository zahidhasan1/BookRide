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
        return MainViewController(mainViewModel: sharedMainViewModel)
    }
}
