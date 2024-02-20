//
//  WelcomeViewModel.swift
//  BookRide
//
//  Created by ZEUS on 18/2/24.
//

import Foundation

public class WelcomeViewModel{
    //MARK: - Properties
    let signInNavigator: GotoSignInNavigator
    let signUpNavigator: GotoSignUpNavigator
    
    //MARK: - Methods
    init(gotoSignInNavigator: GotoSignInNavigator,
         gotoSignUpNavigatopr: GotoSignUpNavigator){
        self.signInNavigator = gotoSignInNavigator
        self.signUpNavigator = gotoSignUpNavigatopr
    }
    
    @objc
    public func showSignUpView(){
        //signUpNavigator.gotoSignUp()
    }
    
    @objc
    public func showSignInView(){
        signInNavigator.gotoSignIn()
    }
}
