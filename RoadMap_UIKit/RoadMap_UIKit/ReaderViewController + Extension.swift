//
//  ReaderViewController + Extension.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 04.10.2022.
//

import UIKit

// MARK: - UIPickerViewDelegate
extension ReaderViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Constants.fonts[row]
    }
}

// MARK: - UIPickerViewDataSource
extension ReaderViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Constants.fonts.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        fontTextField.text = Constants.fonts[row]
        myTextView.font = UIFont(name: Constants.fonts[row], size: 15)
        fontTextField.resignFirstResponder()
    }
}
