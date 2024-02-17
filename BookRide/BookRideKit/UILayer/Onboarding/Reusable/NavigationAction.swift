//
//  NavigationAction.swift
//  BookRide
//
//  Created by ZEUS on 18/2/24.
//

import Foundation

public enum NavigationAction<ViewModelType> : Equatable where ViewModelType: Equatable{
    case present(view: ViewModelType)
    case presented(view: ViewModelType)
}
