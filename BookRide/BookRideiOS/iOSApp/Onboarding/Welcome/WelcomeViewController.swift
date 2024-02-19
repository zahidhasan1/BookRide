//
//  WelcomeViewController.swift
//  BookRide
//
//  Created by ZEUS on 17/2/24.
//

import UIKit

public class WelcomeViewController : NiblessViewController{
    //Properties
    let welcomeViewModelFactory: WelcomeViewModelFactory
    
    
    //Methods
    init(welcomeViewModelFactory: WelcomeViewModelFactory) {
        self.welcomeViewModelFactory = welcomeViewModelFactory
        super.init()
    }
    
    public override func loadView() {
        let viewModel = welcomeViewModelFactory.makeWelcomeViewModel()
        view = WelcomeRootView(viewModel: viewModel)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
} 

protocol WelcomeViewModelFactory{
    func makeWelcomeViewModel() -> WelcomeViewModel
}
