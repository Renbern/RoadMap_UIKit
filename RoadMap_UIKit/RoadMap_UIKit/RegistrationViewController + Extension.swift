//
//  RegistrationViewController + Extension.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 03.10.2022.
//

import UIKit

// MARK: - UITextFieldDelegate
extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            textField.resignFirstResponder()
            emailTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else if textField == nicknameTextField {
            textField.resignFirstResponder()
        }
        return true
    }
}
