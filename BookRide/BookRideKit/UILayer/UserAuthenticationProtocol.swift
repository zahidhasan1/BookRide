//
//  UserAuthenticationProtocol.swift
//  BookRide
//
//  Created by ZEUS on 17/2/24.
//

import Foundation

public protocol SignedInResponder{
    func signedIn()
}

public protocol NotSignedInResponder{
    func notSignedIn()
}
