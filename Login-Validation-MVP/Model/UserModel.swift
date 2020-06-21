//
//  User.swift
//  Login-Validation-MVP
//
//  Created by c.pabon.cuellar on 26/04/2020.
//  Copyright © 2020 cristhia.pabon. All rights reserved.
//

import Foundation

public class UserModel {
    
    func isDataValid(email: String, password: String) -> Int {
        let email = email
        let password = password
        
        if email == "" {
            return 0 // 0 error email esta vacio
        } else if !(isEmailValid(email: email)) {
            return 1 // 1 error patron no matchea con el email
        } else if password.count <= 6 {
            return 2 // 2 error cantidad de chars no valido
        } else {
            return -1
        }
    }
    
    func isEmailValid(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
