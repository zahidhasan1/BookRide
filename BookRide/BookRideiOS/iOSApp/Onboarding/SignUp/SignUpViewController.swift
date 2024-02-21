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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

protocol SignUpViewModelFactory{
    func makeSignUpViewModel() -> SignUpViewModel
}

