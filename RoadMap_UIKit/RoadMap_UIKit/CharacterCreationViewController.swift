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
    
    @IBOutlet weak var characterNameLabel: UILabel!
    
    @IBOutlet weak var characterImageView: UIImageView!
    
    @IBOutlet weak var classSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var stregthLabel: UILabel!
    
    @IBOutlet weak var characterNameTextField: UITextField!
    
    @IBOutlet weak var intellegenceLabel: UILabel!
    
    @IBOutlet weak var raceTextField: UITextField!
    
    @IBOutlet weak var agilityLabel: UILabel!
    
    @IBOutlet weak var racePicker: UIPickerView!
    
    @IBOutlet weak var strengthSlider: UISlider!
    
    @IBOutlet weak var intellegenceSlider: UISlider!
    
    @IBOutlet weak var agilitySlider: UISlider!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // MARK: - IBActions
    @IBAction private func classSegmentControllAction(_ sender: Any) {
        switch classSegmentControl.selectedSegmentIndex {
        case 0:
            characterImageView.image = UIImage(named: Constants.classes[0])
        case 1:
            characterImageView.image = UIImage(named: Constants.classes[1])
        case 2:
            characterImageView.image = UIImage(named: Constants.classes[2])
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
