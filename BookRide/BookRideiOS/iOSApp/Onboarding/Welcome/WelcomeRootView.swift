//
//  WelcomeRootView.swift
//  BookRide
//
//  Created by ZEUS on 17/2/24.
//

import UIKit
public class WelcomeRootView: NiblessView{
    //MARK: - Properties
    let viewModel: WelcomeViewModel
    var hirarchyNotReady = true
    
    let backgroundView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Welcome_Background"))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let signInButton: UIButton = {
        let button = UIButton(configuration: .filled())
        
        button.configuration?.cornerStyle = .medium
        button.configuration?.baseBackgroundColor = .gray.withAlphaComponent(0.8)
        let title = NSAttributedString(string: "Sign In", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .bold)])
        button.configuration?.attributedTitle = AttributedString(title)
        button.heightAnchor
            .constraint(equalToConstant: 50)
            .isActive = true
        return button
    }()
    
    let signUpButton: UIButton = {
        
        let button = UIButton(configuration: .filled())
        
        button.configuration?.cornerStyle = .medium
        button.configuration?.baseBackgroundColor = .brown.withAlphaComponent(0.8)
        let title = NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .bold)])
        button.configuration?.attributedTitle = AttributedString(title)
        button.heightAnchor
            .constraint(equalToConstant: 50)
            .isActive = true
        return button
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [signInButton, signUpButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()
    
    //MARK: - Methods
    init(frame: CGRect = .zero,
         viewModel: WelcomeViewModel){
        self.viewModel = viewModel
        super.init(frame: frame)
    }
    
    public override func didMoveToWindow() {
        super.didMoveToWindow()
        guard hirarchyNotReady else {return}
        constructHirarchy()
        activateConstraints()
        signInButton.addTarget(viewModel, action: #selector(viewModel.showSignInView), for: .touchUpInside)
        signUpButton.addTarget(viewModel, action: #selector(viewModel.showSignUpView), for: .touchUpInside)
        hirarchyNotReady = false
    }
    
    func constructHirarchy(){
        self.addSubview(backgroundView)
        self.addSubview(buttonStackView)
    }
    
}

//MARK: - Set constraint
extension WelcomeRootView{
    func activateConstraints(){
        activateConstraintsbackgroundView()
        activateConstraintsForButtonStackView()
    }
    
    func activateConstraintsbackgroundView(){
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func activateConstraintsForButtonStackView(){
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStackView.leadingAnchor
              .constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            buttonStackView.trailingAnchor
              .constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            safeAreaLayoutGuide.bottomAnchor
              .constraint(equalTo: buttonStackView.bottomAnchor, constant: 30),
            buttonStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
