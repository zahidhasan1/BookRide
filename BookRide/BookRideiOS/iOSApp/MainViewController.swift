//
//  MainViewController.swift
//  BookRide
//
//  Created by ZEUS on 17/2/24.
//

import UIKit
import Combine

public class MainViewController: NiblessViewController {
    //MARK: - Properties
    //ViewModel
    let mainViewModel: MainViewModel
    let launchViewController: LaunchViewController
    //ChildViewControllers
    
    
    //State
    var subscriptions = Set<AnyCancellable>()
    
    
    //MARK: - Methods
    public init(mainViewModel: MainViewModel,
                launchViewController: LaunchViewController) {
        self.mainViewModel = mainViewModel
        self.launchViewController = launchViewController
        super.init()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.observerViewModel()
    }
    
    func subscribe(to publisher: AnyPublisher<MainView, Never>){
        publisher.receive(on: DispatchQueue.main)
            .sink { [weak self] view in
                self?.present(view)
            }
            .store(in: &subscriptions)
    }
    
    func present(_ view: MainView){
        switch view {
        case .launching:
            presentLaunchViewController()
        case .onboarding:
            print("Onboarding view")
        case .signedIn:
            print("SignedIn view")
        }
    }
    
    private func observerViewModel(){
        let publisher =
        mainViewModel.$view
            .removeDuplicates()
            .eraseToAnyPublisher()
        subscribe(to: publisher)
    }
}

//ViewController presenting methods
extension MainViewController{
    func presentLaunchViewController(){
        addFullScreen(childViewController: launchViewController)
    }
}
