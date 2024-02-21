//
//  SignUpRootView.swift
//  BookRide
//
//  Created by ZEUS on 21/2/24.
//

import UIKit

class SignUpRootView: NiblessView {

    //MARK: Properties
    var hirarchyNotReady: Bool = true
    let viewModel: SignUpViewModel
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
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
        return CustomTextFields.formTextField(placeholder: "Email")
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
        return CustomTextFields.formTextField(placeholder: "Mobile Number")
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
        return CustomTextFields.passwordTextField(placeholder: "Password")
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
    }
    
    public override func didMoveToWindow() {
        super.didMoveToWindow()
        guard hirarchyNotReady else {return}
        backgroundColor = Color.Umber
        constructViewHirarchy()
        activeConstraints()
        //self.layoutIfNeeded()
        hirarchyNotReady = false
    }
    
    func constructViewHirarchy(){
        self.addSubview(contentView)
       // contentView.addSubview(textEditStackView)
        contentView.addSubview(textEditStackView)
        contentView.addSubview(signUpButton)
    }
}


extension SignUpRootView{
    func activeConstraints(){
        activeContentViewConstraint()
        activeTextEditStackViewConstraint()
        activeSignUpButtonConstraint()
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
    
    func activeTextEditStackViewConstraint() {
        textEditStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textEditStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            textEditStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            textEditStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            //textEditStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            //textEditStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func activeSignUpButtonConstraint(){
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signUpButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            signUpButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            signUpButton.topAnchor.constraint(equalTo: textEditStackView.bottomAnchor, constant: 40),
            signUpButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
}
