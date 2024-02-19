//
//  OnboardingViewController.swift
//  BookRide
//
//  Created by ZEUS on 17/2/24.
//

import UIKit
import Combine

public class OnboardingViewController: NiblessNavigationController {

    //MARK: - Properties
    var viewModel: OnboardingViewModel
    var welcomeViewController: WelcomeViewController
    
    //State
    var subscriptions = Set<AnyCancellable>()
    
    //MARK: - Methods
    
    init(viewModel: OnboardingViewModel,
         welcomeViewController: WelcomeViewController) {
        self.viewModel = viewModel
        self.welcomeViewController = welcomeViewController
        super.init()
        self.delegate = self
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let navigationActionPublisher = viewModel.$navigationAction.eraseToAnyPublisher()
        subscribe(to: navigationActionPublisher)
    }

    
    func subscribe(to publisher: AnyPublisher<OnboardingNavigationAction, Never>){
        publisher
            .receive(on: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] navigationAction in
                self?.respond(to: navigationAction)
            }
            .store(in: &subscriptions)
    }
    
    func respond(to navigationAction: OnboardingNavigationAction){
        switch navigationAction{
        case .present(let view):
            self.presentView(view: view)
        case .presented:
            break
        }
    }
}

//MARK: - PresentViewController
extension OnboardingViewController{
    func presentView(view: OnboardingView){
        switch view {
        case .welcome:
            print("presenting WelcomeViewController")
           presentWelcomeViewController()
        case .signIn:
            print("Presenting SignIn ViewController")
        case .signUp:
            print("Presenting SignUp ViewController")
        }
    }
    
    func presentWelcomeViewController(){
        pushViewController(welcomeViewController, animated: false)
    }
}

extension OnboardingViewController: UINavigationControllerDelegate{
    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        print("Navigation will show")
    }
    
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        print("Navigation did show")
    }
}
