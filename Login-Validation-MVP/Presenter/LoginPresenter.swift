//
//  LoginPresenter.swift
//  Login-Validation-MVP
//
//  Created by c.pabon.cuellar on 26/04/2020.
//  Copyright © 2020 cristhia.pabon. All rights reserved.
//

import Foundation

public protocol LoginDelegate: AnyObject {
    func onLogin(email: String, password: String)
}


public class LoginPresenter: LoginDelegate{
    
    private weak var view: LoginViewDelegate?
    private let userModel = UserModel()
    
    init(view: LoginViewDelegate) {
        self.view = view
    }
    
    public func onLogin(email: String, password: String) {
        let loginCode = userModel.isDataValid(email: email, password: password)
        if loginCode == 0 {
            self.view!.onLoginError(message: "Email must not be null")
        } else if loginCode == 1 {
            self.view!.onLoginError(message: "Wrong email address")
        } else if(loginCode == 2){
            self.view!.onLoginError(message: "Password must be greater than 6")
        }else {
            self.view!.onLoginSuccess(message: "Login Success")
        }
    }
}
