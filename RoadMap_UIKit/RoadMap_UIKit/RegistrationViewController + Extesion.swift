//
//  RegistrationViewController + Extesion.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 03.10.2022.
//

import UIKit

// MARK: UITextFieldDelegate
extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            nicknameTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return false
    }
}
