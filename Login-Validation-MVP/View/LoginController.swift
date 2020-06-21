//
//  ViewController.swift
//  Login-Validation-MVP
//
//  Created by c.pabon.cuellar on 26/04/2020.
//  Copyright © 2020 cristhia.pabon. All rights reserved.
//

import UIKit

public protocol LoginViewDelegate: AnyObject {
    func onLoginSuccess(message: String)
    func onLoginError(message: String)
}

class LoginController: UIViewController,LoginViewDelegate {
    
    var presenter: LoginPresenter!
    //MARK: UI components
    private lazy var textFieldStack: UIStackView = {
       var stackview = UIStackView()
        stackview.axis = .vertical
//        stackview.distribution =
        stackview.spacing = 10
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    private lazy var emailTextField: UITextField = {
       var textfield = UITextField()
        textfield.backgroundColor = .white
        textfield.placeholder = "Email"
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    private lazy var passwordTextField: UITextField = {
       var textfield = UITextField()
        textfield.backgroundColor = .white
        textfield.placeholder = "Clave"
        textfield.isSecureTextEntry = true
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    private lazy var loginButton: UIButton = {
        var button = UIButton()
        button.setTitle("LOGIN", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
            
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        presenter = LoginPresenter(view: self)
    }
    
    //MARK: Events

    
    //MARK: Delegate Methods
    func onLoginSuccess(message: String) {
        print(message)
    }
    
    func onLoginError(message: String) {
        print(message)
    }
}

extension LoginController: ProgrammaticallyLayoutable {

    //MARK: Programmatically
    func buildViewHierarchy() {
        view.addSubview(textFieldStack)
        textFieldStack.addArrangedSubview(emailTextField)
        textFieldStack.addArrangedSubview(passwordTextField)
        view.addSubview(loginButton)
    }

    func setUpConstraints() {
        setUpTextFieldStack()
        setUpLoginButton()
    }

    func setUpAdditionalConfigs() {
        setUpViewBackground()
    }
    
    //MARK: Constraints Methods
    func setUpTextFieldStack(){
        textFieldStack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200).isActive = true
        textFieldStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        textFieldStack.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
    }
    
    func setUpLoginButton(){
        loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
    
    //MARK: Additional Method Configs
    func setUpViewBackground(){
        self.view.backgroundColor = .systemGray
    }
}

fileprivate extension String {
    static let logoImageText = "beer"
}
