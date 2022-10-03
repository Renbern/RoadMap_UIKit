//
//  CharacterCreationViewController + Extension.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 03.10.2022.
//

import UIKit

// MARK: - UIPickerViewDelegate
extension CharacterCreationViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Constants.races[row]
    }
}

// MARK: - UIPickerViewDelegate
extension CharacterCreationViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Constants.races.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        raceTextField.text = Constants.races[row]
        raceTextField.resignFirstResponder()
    }
}

// MARK: - UITextFieldDelegate
extension CharacterCreationViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        racePicker.isHidden = false
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        characterNameLabel.text = "\(textField.text ?? "Бузымянный") 1 ур."
        characterNameTextField.resignFirstResponder()
        return true
    }

}
