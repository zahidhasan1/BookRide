//
//  SignInViewModel.swift
//  BookRide
//
//  Created by ZEUS on 20/2/24.
//

import Foundation
import Combine

class SignInViewModel{

    //MARK: - Properties
    var email: String = ""
    var password: String = ""
    
    public var errorMessagePublisher: AnyPublisher<ErrorMessage, Never>{
        errorMessageSubject.eraseToAnyPublisher()
    }
    
    //MARK:  Publishers
    @Published public private(set) var emailInputEnabled = true
    @Published public private (set) var passwordInputEnabled = true
    @Published public private(set) var loginButtonEnabled = true
    
    private let errorMessageSubject = PassthroughSubject<ErrorMessage, Never>()
    
    //MARK: - Methods
    init() {
        
    }
    
    
    @objc
    func signIn(){
        prepareToSignIn()
    }
    
    func prepareToSignIn(){
        emailInputEnabled = false
        passwordInputEnabled = false
        loginButtonEnabled = false
        
        if let emailValidationErrorMessage =  validateEmail(){
            indicateErrorSigningIn(error: emailValidationErrorMessage)
            return
        }
        
        if let passwordValidationErrorMessage = validatePassword(){
            indicateErrorSigningIn(error: passwordValidationErrorMessage)
            return
        }
    }
    
    func indicateErrorSigningIn(error: ErrorMessage){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            print(error)
            self.errorMessageSubject.send(error)
            self.emailInputEnabled = true
            self.passwordInputEnabled = true
            self.loginButtonEnabled = true
        }
    }
}

//MARK: - TextField Validation
extension SignInViewModel: SignInValidator{
    
    func validateEmail() -> ErrorMessage? {
        switch email.checkValidation(textType: .email) {
        case .empty:
            return ErrorMessage(title: "Sign In Failed", message: "Email field could not be empty")
        case .valid:
            return nil
        case .notValid:
            return ErrorMessage(title: "Sign In Failed", message: "Please type a valid Email address")
        }
    
    }
    
    func validatePassword() -> ErrorMessage? {
        switch password.checkValidation(textType: .password){
        case .empty:
            return ErrorMessage(title: "Sign In Failed", message: "Password field can not be empty")
        case .valid:
            return nil
        case .notValid:
            return ErrorMessage(title: "Sign In Failed", message: "Please type a valid password")
        }
    }
}
