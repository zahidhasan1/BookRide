//
//  LaunchRootView.swift
//  BookRide
//
//  Created by ZEUS on 17/2/24.
//

import UIKit

class LaunchRootView: NiblessView {
    //MARK: Properties
    let viewModel: LaunchViewModel
   
    //MARK: - Methods
    init(frame: CGRect = .zero,
         viewModel: LaunchViewModel){
        self.viewModel = viewModel
        super.init(frame: frame)
        styleView()
    }

    func styleView(){
        backgroundColor = Color.background
    }
}
