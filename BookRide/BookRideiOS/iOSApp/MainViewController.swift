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
    let onBoardingViewController: OnboardingViewController
    //ChildViewControllers
    
    
    //State
    var subscriptions = Set<AnyCancellable>()
    
    
    //MARK: - Methods
    public init(mainViewModel: MainViewModel,
                launchViewController: LaunchViewController,
                onBoardingViewController: OnboardingViewController) {
        self.mainViewModel = mainViewModel
        self.launchViewController = launchViewController
        self.onBoardingViewController = onBoardingViewController
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
            print("Presenting LaunchViewController")
            presentLaunchViewController()
        case .onboarding:
            print("Presenting Onboarding ViewController")
            presentOnboardingViewController()
        case .signedIn:
            print("Presenting SignedInViewController")
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
    
    func presentOnboardingViewController(){
        onBoardingViewController.modalPresentationStyle = .fullScreen
        present(onBoardingViewController, animated: true) {[weak self] in
            guard let self = self else {return}
            self.remove(childViewController: self.launchViewController)
        }
    }
}
