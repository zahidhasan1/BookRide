//
//  SignUpViewController.swift
//  BookRide
//
//  Created by ZEUS on 21/2/24.
//

import UIKit
import Combine

class SignUpViewController: NiblessViewController {
    //MARK: - Properties
    let viewModelFactory: SignUpViewModelFactory
    let viewModel: SignUpViewModel
    var subscribers = Set<AnyCancellable>()
    
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
        (view as! SignUpRootView).configureViewAfterLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addKeyboardObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeObservers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func observerErrorMessage(){
        viewModel
            .errorMessagePublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] errorMessage in
                self?.present(errorMessage)
            }
            .store(in: &subscribers)
    }
}

extension SignUpViewController{
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

//MARK: - Keyboard
extension SignUpViewController{
    func addKeyboardObservers(){
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(self, selector: #selector(handleContentUnderKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        notificationCenter.addObserver(self, selector: #selector(handleContentUnderKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeObservers(){
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    @objc
    func handleContentUnderKeyboard(notification: Notification){
        if let userInfo = notification.userInfo,
           let keyboardEndFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue{
            let convertedKeyboardFrame = view.convert(keyboardEndFrame.cgRectValue, from: view.window)
            if notification.name == UIResponder.keyboardWillHideNotification{
                (view as! SignUpRootView).moveContentForDismissKeyboard()
            }else{
                (view as! SignUpRootView).moveContent(for: convertedKeyboardFrame)
            }
        }
    }
}

protocol SignUpViewModelFactory{
    func makeSignUpViewModel() -> SignUpViewModel
}

