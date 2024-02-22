//
//  SignUpViewController.swift
//  BookRide
//
//  Created by ZEUS on 21/2/24.
//

import UIKit

class SignUpViewController: NiblessViewController {
    //MARK: - Properties
    let viewModelFactory: SignUpViewModelFactory
    let viewModel: SignUpViewModel
    
    //MARK: - Mehods
    init(viewModelFactory: SignUpViewModelFactory) {
        self.viewModelFactory = viewModelFactory
        self.viewModel = viewModelFactory.makeSignUpViewModel()
        super.init()
    }
    
    public override func loadView() {
        view = SignUpRootView(viewModel: viewModel)
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //(view as! SignUpRootView).configureViewAfterLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

protocol SignUpViewModelFactory{
    func makeSignUpViewModel() -> SignUpViewModel
}

