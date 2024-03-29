//
//  SignInRootView.swift
//  BookRide
//
//  Created by ZEUS on 20/2/24.
//

import UIKit
import Combine

class SignInRootView: NiblessView {
    
    //MARK: Properties
    var hirarchyNotReady: Bool = true
    let viewModel: SignInViewModel
    var subscriptions = Set<AnyCancellable>()
    
    let contentView = UIView()
    
    let title: UILabel = {
        let label = UILabel()
        label.text = "Welcome,"
        label.font = UIFont(name: "Avenir-Heavy", size: 30)
        label.textColor = Color.EggShell
        return label
    }()
    
    let subTitle: UILabel = {
        let label = UILabel()
        label.text = "Sign in to continue"
        label.font = UIFont(name: "Avenir-Heavy", size: 20)
        label.textColor = Color.EggShell
        return label
    }()
    
    
    let emailTextField: UITextField = {
        let textField =  CustomTextFields.formTextField(placeholder: "Enter Email")
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    let emailIcon: UIImageView = {
        let image = UIImage(systemName: "mail.stack.fill")?.withConfiguration(UIImage.SymbolConfiguration(scale: .small))
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = Color.EggShell
        return imageView
    }()
    
    let passwordTextField: UITextField = {
        let textField = CustomTextFields.passwordTextField(placeholder: "Enter Password")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let passwordIcon: UIImageView = {
        let image = UIImage(systemName: "lock.square.fill")?.withConfiguration(UIImage.SymbolConfiguration(scale: .small))
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = Color.EggShell
        return imageView
    }()
    
    lazy var emailSectionStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailIcon, emailTextField])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var passwordSectionStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [passwordIcon, passwordTextField])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var labelStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [title, subTitle])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 0
        return stackView
    }()
    
    lazy var textEditStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailSectionStackView, passwordSectionStackView])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()
    
    let signInButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.configuration?.cornerStyle = .large
        button.configuration?.baseBackgroundColor = Color.EggShell
        button.configuration?.baseForegroundColor = .black
        let title = NSAttributedString(string: "Sign In",
                                       attributes: [NSAttributedString.Key.font : UIFont(name: "Avenir-Heavy", size: 20) ?? UIFont.systemFont(ofSize: 20, weight: .bold)])
        button.configuration?.attributedTitle = AttributedString(title)
        return button
    }()
    
    //MARK: - Methods
    init(frame: CGRect = .zero,
         viewModel: SignInViewModel){
        self.viewModel = viewModel
        super.init(frame: frame)
        bindTextFieldsToViewModel()
        bindViewModelToView()
    }
    
    public override func didMoveToWindow() {
        super.didMoveToWindow()
        guard hirarchyNotReady else {return}
        setupGesture()
        backgroundColor = Color.Umber
        constructViewHirarchy()
        activeConstraints()
        signInButton.addTarget(self.viewModel, action: #selector(viewModel.signIn), for: .touchUpInside)
        hirarchyNotReady = false
        
    }
    
    func constructViewHirarchy(){
        self.addSubview(contentView)
        self.addSubview(labelStackView)
        self.addSubview(textEditStackView)
        self.addSubview(signInButton)
    }
}

//MARK: - SetupTapGesture to dismissKeyboard
extension SignInRootView{
    private func setupGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tapGesture.cancelsTouchesInView = false
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleTap(_ gesture: UITapGestureRecognizer){
        self.endEditing(true)
    }
}

//MARK: - Bindings TextField
extension SignInRootView{
    func bindTextFieldsToViewModel(){
        bindEmailTextField()
        bindPasswordTextField()
    }
    
    func bindEmailTextField(){
        emailTextField.publisher(for: \.text)
            .map{$0 ?? ""}
            .assign(to: \.email, on: viewModel)
            .store(in: &subscriptions)
    }
    
    func bindPasswordTextField(){
        passwordTextField.publisher(for: \.text)
            .map{$0 ?? ""}
            .assign(to: \.password, on: viewModel)
            .store(in: &subscriptions)
    }
}

//MARK: - Dynamic Behavior
extension SignInRootView{
    func bindViewModelToView(){
        bindViewModelToEmailTextField()
        bindViewModelToPasswordTextField()
        bindViewModelToSignInButton()
    }
    
    func bindViewModelToEmailTextField(){
        viewModel
            .$emailInputEnabled
            .receive(on: DispatchQueue.main)
            .assign(to: \.isEnabled, on: emailTextField)
            .store(in: &subscriptions)
    }
    
    func bindViewModelToPasswordTextField(){
        viewModel
            .$passwordInputEnabled
            .receive(on: DispatchQueue.main)
            .assign(to: \.isEnabled, on: passwordTextField)
            .store(in: &subscriptions)
    }
    
    func bindViewModelToSignInButton(){
        viewModel
            .$loginButtonEnabled
            .receive(on: DispatchQueue.main)
            .assign(to: \.isEnabled, on: signInButton)
            .store(in: &subscriptions)
    }
}



//MARK: - Set Constraints
extension SignInRootView{
    func activeConstraints(){
        activeContentViewConstraint()
        activeLabelStackViewConstraint()
        activeTextEditStackViewConstraint()
        activeSignInButtonConstraint()
    }
 
    func activeContentViewConstraint(){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
    
    func activeLabelStackViewConstraint(){
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            labelStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            labelStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func activeTextEditStackViewConstraint(){
        textEditStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailSectionStackView.heightAnchor.constraint(equalToConstant: 45),
            emailIcon.widthAnchor.constraint(equalTo: emailIcon.heightAnchor, multiplier: 5/9, constant: 0),
            passwordIcon.widthAnchor.constraint(equalTo: emailIcon.heightAnchor, multiplier: 5/9, constant: 0),
            textEditStackView.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 40),
            textEditStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            textEditStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func activeSignInButtonConstraint(){
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            signInButton.topAnchor.constraint(equalTo: textEditStackView.bottomAnchor, constant: 40),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
}

//#Preview(traits: .portrait, body: {
//    var view = SignInRootView(viewModel: SignInViewModel())
//    return view
//})
