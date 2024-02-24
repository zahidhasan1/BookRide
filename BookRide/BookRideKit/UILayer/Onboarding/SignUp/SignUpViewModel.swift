//
//  SignUpViewModel.swift
//  BookRide
//
//  Created by ZEUS on 21/2/24.
//

import Foundation
import Combine

class SignUpViewModel{

    //MARK: -  Properties
    public var name = ""
    public var nickName = ""
    public var email = ""
    public var mobileNumber = ""
    public var password = ""
    
    //Publishers
    public var errorMessagePublisher: AnyPublisher<ErrorMessage, Never>{
        errorMessageSubject.eraseToAnyPublisher()
    }
    private let errorMessageSubject = PassthroughSubject<ErrorMessage, Never>()
    
    @Published public private(set) var nameInputEnabled = true
    @Published public private(set) var nickNameInputEnabled = true
    @Published public private(set) var emailInputEnabled = true
    @Published public private(set) var phoneNumberInputEnabled = true
    @Published public private(set) var passwordInputEnabled = true
    @Published public private(set) var signUpButtonEnabled = true
    
    
    //MARK: - Methods
    init() {}
    
    @objc
    public func signUP() {
        prepareToSignUp()
    }
    
    func prepareToSignUp(){
        nameInputEnabled = false
        nickNameInputEnabled = false
        emailInputEnabled = false
        phoneNumberInputEnabled = false
        passwordInputEnabled = false
        isAllInputTextValid() ? print("All are valid") : print("Not all are valid")
    }
    
    func indicateErrorSignUp(error: ErrorMessage){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.nameInputEnabled = true
            self.nickNameInputEnabled = true
            self.emailInputEnabled = true
            self.phoneNumberInputEnabled = true
            self.passwordInputEnabled = true
            self.errorMessageSubject.send(error)
        }
    }
    
}

//MARK: - Extension
extension SignUpViewModel: SignUpValidator{
    
    func isAllInputTextValid() -> Bool{
        if let fullNameValidationErrorMessage = validateFullName(){
            indicateErrorSignUp(error: fullNameValidationErrorMessage)
            return false
        }
        if let nickNameValidationErrorMessage = validateNickName(){
            indicateErrorSignUp(error: nickNameValidationErrorMessage)
            return false
        }
        if let emailValidationErrorMessage = validateEmail(){
            indicateErrorSignUp(error: emailValidationErrorMessage)
            return false
        }
        if let phoneNumberValidationErrorMessage = validatePhoneNumber(){
            indicateErrorSignUp(error: phoneNumberValidationErrorMessage)
            return false
        }
        if let passwordValidationErrorMessage = validatePassword(){
            indicateErrorSignUp(error: passwordValidationErrorMessage)
            return false
        }
        
        return true
    }
    
    func validateFullName() -> ErrorMessage? {
        switch name.checkValidation(textType: .name) {
        case .empty:
            return ErrorMessage(title: "Sign up failed!", message: "please provide your full name")
        case .valid:
            return nil
        case .notValid:
            return ErrorMessage(title: "Sign up failed!", message: "please provide a valid name")
        }
    }
    
    func validateNickName() -> ErrorMessage? {
        switch nickName.checkValidation(textType: .name) {
        case .empty:
            return ErrorMessage(title: "Sign up failed!", message: "please provide your nickName")
        case .valid:
            return nil
        case .notValid:
            return ErrorMessage(title: "Sign up failed!", message: "please provide a valid name")
        }
    }
    
    func validateEmail() -> ErrorMessage? {
        switch email.checkValidation(textType: .email) {
        case .empty:
            return ErrorMessage(title: "Sign up Failed", message: "Email field could not be empty")
        case .valid:
            return nil
        case .notValid:
            return ErrorMessage(title: "Sign up Failed", message: "Please type a valid Email address")
        }
    }
    
    func validatePhoneNumber() -> ErrorMessage? {
        switch mobileNumber.checkValidation(textType: .phoneNumber) {
        case .empty:
            return ErrorMessage(title: "Sign up Failed", message: "phone number field could not be empty")
            
        case .valid:
            return nil
        case .notValid:
            return ErrorMessage(title: "Sign up Failed", message: "Please type a valid phone number")
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
