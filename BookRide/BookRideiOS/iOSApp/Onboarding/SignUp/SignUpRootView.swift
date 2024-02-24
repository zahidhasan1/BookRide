//
//  SignUpRootView.swift
//  BookRide
//
//  Created by ZEUS on 21/2/24.
//

import UIKit
import Combine

class SignUpRootView: NiblessView {

    //MARK: Properties
    var hirarchyNotReady: Bool = true
    let viewModel: SignUpViewModel
    var subscriptions = Set<AnyCancellable>()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.delaysContentTouches = false
        return scrollView
    }()
    let contentView = UIView()
    
    //MARK: - Title and Subtitle
    let title: UILabel = {
        let label = UILabel()
        label.text = "Hi,"
        label.font = UIFont(name: "Avenir-Heavy", size: 30)
        label.textColor = Color.EggShell
        return label
    }()
    
    let subTitle: UILabel = {
        let label = UILabel()
        label.text = "Create a new Account"
        label.font = UIFont(name: "Avenir-Heavy", size: 20)
        label.textColor = Color.EggShell
        return label
    }()
    
    lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [title, subTitle])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 0
        return stackView
    }()
    
    //MARK: - FullName
    let nameTextField: UITextField = {
        
        return CustomTextFields.formTextField(placeholder: "Full Name")
    }()
    
    let nameIcon: UIImageView = {
        let image = UIImage(systemName: "person.fill")?.withConfiguration(UIImage.SymbolConfiguration(scale: .small))
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = Color.EggShell
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 5/9, constant: 0).isActive = true
        return imageView
    }()
    
    lazy var stackNameInputField: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameIcon, nameTextField])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.heightAnchor.constraint(equalToConstant: 45).isActive = true

        return stackView
    }()
    
    
    //MARK: - NickName
    let nickNameTextField: UITextField = {
        return CustomTextFields.formTextField(placeholder: "What should we call you")
    }()
    
    let nickNameIcon: UIImageView = {
        let image = UIImage(systemName: "tag.fill")?.withConfiguration(UIImage.SymbolConfiguration(scale: .small))
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = Color.EggShell
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 5/9, constant: 0).isActive = true
        return imageView
    }()
    
    lazy var stacknickNameField: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nickNameIcon, nickNameTextField])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.heightAnchor.constraint(equalToConstant: 45).isActive = true

        return stackView
    }()
    
    
    //MARK: - Email
    let emailTextField: UITextField = {
        let textField = CustomTextFields.formTextField(placeholder: "Email")
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    let emailIcon: UIImageView = {
        let image = UIImage(systemName: "envelope.fill")?.withConfiguration(UIImage.SymbolConfiguration(scale: .small))
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = Color.EggShell
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 5/9, constant: 0).isActive = true
        return imageView
    }()
    
    lazy var stackEmailField: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailIcon, emailTextField])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.heightAnchor.constraint(equalToConstant: 45).isActive = true

        return stackView
    }()
    
    //MARK: - Mobile
    let mobileTextField: UITextField = {
        let textField = CustomTextFields.formTextField(placeholder: "Mobile Number")
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let mobileNumberIcon: UIImageView = {
        let image = UIImage(systemName: "phone.fill")?.withConfiguration(UIImage.SymbolConfiguration(scale: .small))
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = Color.EggShell
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 5/9, constant: 0).isActive = true
        return imageView
    }()
    
    lazy var stackMobileNumberField: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [mobileNumberIcon, mobileTextField])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        return stackView
    }()
    
    
    //MARK: - Password
    let passwordTextField: UITextField = {
        let textField = CustomTextFields.passwordTextField(placeholder: "Password")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let passwordIcon: UIImageView = {
        let image = UIImage(systemName: "lock.fill")?.withConfiguration(UIImage.SymbolConfiguration(scale: .small))
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = Color.EggShell
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 5/9, constant: 0).isActive = true
        return imageView
    }()
    
    lazy var stackPasswordField: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [passwordIcon, passwordTextField])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        return stackView
    }()
    
    //MARK: - All Input Fields
    lazy var textEditStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews:
                                        [stackNameInputField,
                                         stacknickNameField,
                                        stackEmailField,
                                        stackMobileNumberField,
                                        stackPasswordField])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()
    
    //MARK: - SignUpButton
    let signUpButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.configuration?.cornerStyle = .large
        button.configuration?.baseBackgroundColor = Color.EggShell
        button.configuration?.baseForegroundColor = .black
        let title = NSAttributedString(string: "Sign Up",
                                       attributes: [NSAttributedString.Key.font : UIFont(name: "Avenir-Heavy", size: 20) ?? UIFont.systemFont(ofSize: 20, weight: .bold)])
        button.configuration?.attributedTitle = AttributedString(title)
        return button
    }()
    
    
    //MARK: - Methods
    init(frame: CGRect = .zero, viewModel: SignUpViewModel){
        self.viewModel = viewModel
        super.init(frame: frame)
        bindTextFieldsToViewModel()
    }
    
    public override func didMoveToWindow() {
        super.didMoveToWindow()
        guard hirarchyNotReady else {return}
        setupGesture()
        backgroundColor = Color.Umber
        constructViewHirarchy()
        activeConstraints()
        signUpButton.addTarget(viewModel, action: #selector(viewModel.signUP), for: .touchUpInside)
        hirarchyNotReady = false
    }
    
    func configureViewAfterLayout(){
        resetScrollViewContentInset()
    }
    
    func resetScrollViewContentInset(){
        let scrollViewBounds = scrollView.bounds
        let contentViewHeight = CGFloat(530.0)
        
        var scrollViewInsets = UIEdgeInsets.zero
        scrollViewInsets.top = scrollViewBounds.size.height / 2.0
        scrollViewInsets.top -= contentViewHeight / 2.0
        
        scrollViewInsets.bottom = scrollViewBounds.size.height / 2.0
        scrollViewInsets.bottom -= contentViewHeight / 2.0
        
        scrollView.contentInset = scrollViewInsets
    }
    
    func constructViewHirarchy(){
        scrollView.addSubview(contentView)
        contentView.addSubview(labelStackView)
        contentView.addSubview(textEditStackView)
        contentView.addSubview(signUpButton)
        addSubview(scrollView)
    }
}

//MARK: - SetupTapGesture to dismissKeyboard
extension SignUpRootView{
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
extension SignUpRootView{
    
    func bindTextFieldsToViewModel(){
        bindNameTextField()
        bindNickNameTextField()
        bindEmailField()
        bindMobileNumberField()
        bindPasswordField()
    }
    
    func bindNameTextField(){
        nameTextField.publisher(for: \.text)
            .map{$0 ?? ""}
            .assign(to: \.name, on: viewModel)
            .store(in: &subscriptions)
    }
    
    func bindNickNameTextField(){
        nickNameTextField.publisher(for: \.text)
            .map{ $0 ?? ""}
            .assign(to: \.nickName, on: viewModel)
            .store(in: &subscriptions)
    }
    
    func bindEmailField(){
        emailTextField.publisher(for: \.text)
            .map{ $0 ?? ""}
            .assign(to: \.email, on: viewModel)
            .store(in: &subscriptions)
    }
    
    func bindMobileNumberField(){
        mobileTextField.publisher(for: \.text)
            .map{ $0 ?? ""}
            .assign(to: \.mobileNumber, on: viewModel)
            .store(in: &subscriptions)
    }
    
    func bindPasswordField(){
        passwordTextField.publisher(for: \.text)
            .map{ $0 ?? ""}
            .assign(to: \.password, on: viewModel)
            .store(in: &subscriptions)
    }
}



//MARK: -SetupConstraints
extension SignUpRootView{
    func activeConstraints(){
        activeConstraintForScrollView()
        activeContentViewConstraint()
        activeLabelStackViewConstraint()
        activeTextEditStackViewConstraint()
        activeSignUpButtonConstraint()
    }
    
    func activeConstraintForScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func activeContentViewConstraint(){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
    func activeLabelStackViewConstraint(){
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            labelStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            labelStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func activeTextEditStackViewConstraint() {
        textEditStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textEditStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            textEditStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            textEditStackView.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 40)
        ])
    }
    
    func activeSignUpButtonConstraint(){
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signUpButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            signUpButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            signUpButton.topAnchor.constraint(equalTo: textEditStackView.bottomAnchor, constant: 40),
            signUpButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            signUpButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
}
