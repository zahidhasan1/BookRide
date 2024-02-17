//
//  MainViewModel.swift
//  BookRide
//
//  Created by ZEUS on 17/2/24.
//

import Foundation
import Combine

public class MainViewModel: SignedInResponder, NotSignedInResponder {
    //MARK: - Properties
    @Published public private(set) var view: MainView = .launching
    
    //Methods
    public init(){}
    
    public func signedIn() {
        view = .signedIn
    }
    
    public func notSignedIn() {
        view = .onboarding
    }
}
