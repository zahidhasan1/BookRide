//
//  LaunchViewModel.swift
//  BookRide
//
//  Created by ZEUS on 17/2/24.
//

import Foundation

public class LaunchViewModel{
    //MARK: - Properties
    let signedInResponder: SignedInResponder
    let notSignedInResponder: NotSignedInResponder
    
    //MARK: - Methods
    init(signedInResponder: SignedInResponder, notSignedInResponder: NotSignedInResponder) {
        self.signedInResponder = signedInResponder
        self.notSignedInResponder = notSignedInResponder
    }
    
    func loadUserSession(){
        userNotSignedIn()
    }
    
    func userSignedIn(){
        signedInResponder.signedIn()
    }
    
    func userNotSignedIn(){
        notSignedInResponder.notSignedIn()
    }
}
