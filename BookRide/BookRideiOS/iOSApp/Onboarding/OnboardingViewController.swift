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
    var signInViewController: SignInViewController
    var signUpViewController: SignUpViewController
    
    //State
    var subscriptions = Set<AnyCancellable>()
    
    //MARK: - Methods
    
    init(viewModel: OnboardingViewModel,
         welcomeViewController: WelcomeViewController,
         signInViewController: SignInViewController,
         signUpViewController: SignUpViewController) {
        self.viewModel = viewModel
        self.welcomeViewController = welcomeViewController
        self.signInViewController = signInViewController
        self.signUpViewController = signUpViewController
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
            presentSignInViewController()
            print("Presenting SignIn ViewController")
        case .signUp:
            presentSignUpViewController()
            print("Presenting SignUp ViewController")
        }
    }
    
    func presentWelcomeViewController(){
        pushViewController(welcomeViewController, animated: false)
    }
    
    func presentSignInViewController(){
        pushViewController(signInViewController, animated: true)
    }
    
    func presentSignUpViewController(){
        pushViewController(signUpViewController, animated: true)
    }
}

extension OnboardingViewController: UINavigationControllerDelegate{
    
    func hideOrShowNavigationBarIfNeeded(for view: OnboardingView, animated: Bool){
        if view.hideNavigationBar(){
            hideNavigationBar(animated: animated)
        }else{
            showNavigationBar(animated: animated)
        }
    }
    
    func hideNavigationBar(animated: Bool){
        if animated{
            transitionCoordinator?.animate(alongsideTransition: { context in
                self.setNavigationBarHidden(true, animated: animated)
            })
        }else{
            setNavigationBarHidden(true, animated: false)
        }
    }
    
    func showNavigationBar(animated: Bool){
        if self.isNavigationBarHidden{
            self.setNavigationBarHidden(false, animated: animated)
        }
    }
    
    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        guard let viewToBeShown = onboardingView(associatedWith: viewController) else {return}
        hideOrShowNavigationBarIfNeeded(for: viewToBeShown, animated: animated)
    }
    
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let shownView = onboardingView(associatedWith: viewController) else {return}
        viewModel.uiPresented(onboardingView: shownView)
    }
}

extension OnboardingViewController{
    func onboardingView(associatedWith viewController: UIViewController) -> OnboardingView?{
        switch viewController{
        case is WelcomeViewController:
            return .welcome
        case is SignInViewController:
            return .signIn
        case is SignUpViewController:
            return .signUp
        default:
            assertionFailure("Encountered an unexpected child viewController type in OnboardingViewController")
            return nil
        }
    }
    
}


