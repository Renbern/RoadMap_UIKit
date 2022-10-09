//
//  CharacterCreationViewController.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 03.10.2022.
//

import UIKit

// MARK: - Создание персонажа
final class CharacterCreationViewController: UIViewController {

    // MARK: - Constants
    enum Constants {
        static let races = ["Эльф", "Человек", "Гном"]
        static let classes = ["Warrior", "Archer", "Necromant"]
        static let questionMark = "Question"
    }
    
    // MARK: - IBOutlets
    @IBOutlet private weak var characterNameLabel: UILabel!
    @IBOutlet private weak var characterImageView: UIImageView!
    @IBOutlet private weak var classSegmentControl: UISegmentedControl!
    @IBOutlet private weak var stregthLabel: UILabel!
    @IBOutlet private weak var characterNameTextField: UITextField!
    @IBOutlet private weak var intellegenceLabel: UILabel!
    @IBOutlet private weak var raceTextField: UITextField!
    @IBOutlet private weak var agilityLabel: UILabel!
    @IBOutlet private weak var racePicker: UIPickerView!
    @IBOutlet private weak var strengthSlider: UISlider!
    @IBOutlet private weak var intellegenceSlider: UISlider!
    @IBOutlet private weak var agilitySlider: UISlider!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // MARK: - IBActions
    @IBAction private func classSegmentControllAction(_ sender: Any) {
        switch classSegmentControl.selectedSegmentIndex {
        case 0...2:
            characterImageView.image = UIImage(named: Constants.classes[classSegmentControl.selectedSegmentIndex])
        default:
            characterImageView.image = UIImage(systemName: "questionmark")
        }
    }

    // MARK: - Private methods
    @objc private func strengthPointsSliderAction(sender: UISlider) {
          stregthLabel.text = "Сила - \(Int(sender.value))"
      }
    
    @objc private func intellegencePointsSliderAction(sender: UISlider) {
          intellegenceLabel.text = "Интеллект - \(Int(sender.value))"
      }
    
    @objc private func agilityPointsSliderAction(sender: UISlider) {
          agilityLabel.text = "Ловкость - \(Int(sender.value))"
      }
    
    private func configurateRacePicker() {
        raceTextField.inputView = racePicker
        racePicker.delegate = self
        racePicker.dataSource = self
    }
    
    private func configurateRaceTextField() {
        raceTextField.delegate = self
    }
    
    private func configurateClassSegmentControl() {
        classSegmentControl.selectedSegmentTintColor = .systemOrange
    }
    
    private func configurateCharacterNameTextField() {
        characterNameTextField.delegate = self
    }
    
    private func configurateStrengthSlider() {
        strengthSlider.addTarget(self, action: #selector(strengthPointsSliderAction), for: .valueChanged)
    }
    
    private func configurateIntellegenceSlider() {
        intellegenceSlider.addTarget(self, action: #selector(intellegencePointsSliderAction), for: .valueChanged)
    }
    
    private func configurateAgilitySlider() {
        agilitySlider.addTarget(self, action: #selector(agilityPointsSliderAction), for: .valueChanged)
    }
    
    private func setupUI() {
        configurateRacePicker()
        configurateRaceTextField()
        configurateCharacterNameTextField()
        configurateClassSegmentControl()
        configurateStrengthSlider()
        configurateIntellegenceSlider()
        configurateAgilitySlider()
    }
}

// MARK: - Extension

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
        characterNameLabel.text = "\(textField.text ?? "Бeзымянный") 1 ур."
        characterNameTextField.resignFirstResponder()
        return true
    }
}
