//
//  MainViewController.swift
//  BookRide
//
//  Created by ZEUS on 17/2/24.
//

import UIKit

public class MainViewController: NiblessViewController {
    
    let mainViewModel: MainViewModel
    
    public init(mainViewModel: MainViewModel) {
        self.mainViewModel = mainViewModel
        super.init()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        print("MainViewController is instantiated")
        self.view.backgroundColor = .systemBlue
    }
}
