//
//  SignInViewController.swift
//  BookRide
//
//  Created by ZEUS on 20/2/24.
//

import UIKit

public class SignInViewController: NiblessViewController {
    //MARK: - Properties
    let viewModelFactory: SignInViewModelFactory
    let viewModel: SignInViewModel
    
    //MARK: - Methods
    
    init(viewModelFactory: SignInViewModelFactory){
        self.viewModelFactory = viewModelFactory
        self.viewModel = viewModelFactory.makeSignInViewModel()
        super.init()
    }
    
    public override func loadView() {
        view = SignInRootView(viewModel: viewModel)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
}


protocol SignInViewModelFactory{
    func makeSignInViewModel() -> SignInViewModel
}
