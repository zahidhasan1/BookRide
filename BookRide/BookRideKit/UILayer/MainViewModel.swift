//
//  MainViewModel.swift
//  BookRide
//
//  Created by ZEUS on 17/2/24.
//

import Foundation
import Combine

public class MainViewModel{
    //MARK: - Properties
    @Published public private(set) var view: MainView = .launching
    public init(){}
}
