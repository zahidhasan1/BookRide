//
//  SignInViewController.swift
//  BookRide
//
//  Created by ZEUS on 20/2/24.
//

import UIKit
import Combine

public class SignInViewController: NiblessViewController {
    //MARK: - Properties
    let viewModelFactory: SignInViewModelFactory
    let viewModel: SignInViewModel
    
    var subscriptions = Set<AnyCancellable>()
    
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
        observeErrorMessage()
    }
    
    func observeErrorMessage(){
        viewModel
            .errorMessagePublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] errorMessage in
                self?.present(errorMessage)
            }
            .store(in: &subscriptions)
    }
}

extension SignInViewController{
    func present(_ errorMessage: ErrorMessage){
        let errorAlertController = UIAlertController(
            title: errorMessage.title,
            message: errorMessage.message,
            preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        errorAlertController.addAction(okAction)
        present(errorAlertController, animated: true)
    }
}


protocol SignInViewModelFactory{
    func makeSignInViewModel() -> SignInViewModel
}
