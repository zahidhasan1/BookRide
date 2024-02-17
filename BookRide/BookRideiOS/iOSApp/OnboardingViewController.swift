//
//  OnboardingViewController.swift
//  BookRide
//
//  Created by ZEUS on 17/2/24.
//

import UIKit

public class OnboardingViewController: NiblessViewController {

    //MARK: - Properties
    var viewModel: OnboardingViewModel
    //MARK: - Methods
    
    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
    }

}
