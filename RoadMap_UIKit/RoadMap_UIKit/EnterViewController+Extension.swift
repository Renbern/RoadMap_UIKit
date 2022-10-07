//
//  EnterViewController+Extension.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 07.10.2022.
//

import UIKit

// MARK: - UITextFieldDelegate
extension EnterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordTextField.resignFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return false
    }
}
