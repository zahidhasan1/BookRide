//
//  LaunchViewController.swift
//  BookRide
//
//  Created by ZEUS on 17/2/24.
//

import UIKit
public class LaunchViewController: NiblessViewController{
    //MARK: - Properties
    let viewModel: LaunchViewModel
    
    //MARK: - Methods
    init(viewModel: LaunchViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    public override func loadView() {
        view = LaunchRootView(viewModel: viewModel)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
}
