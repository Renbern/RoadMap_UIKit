//
//  LabelEditingViewController.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 01.10.2022.
//

import UIKit

/// Экран изменения лейбла
class LabelEditingViewController: UIViewController {
    
    // MARK: - Visual Components
    private let demonstrationLabel = UILabel()
    private let addedLabel = UILabel()
    private let fontSizeSlider = UISlider()
    private let textColorPicker = UIPickerView()
    private let numberOfLinesPicker = UIPickerView()
    private let labelTextColorTextField = UITextField()
    private let numberOfLinesTextField = UITextField()
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private methods
    @objc private func addTextToLabelAlertController() {
        let addTextAlertController = UIAlertController(
            title: "Скажи что-нибудь",
            message: "Не стесняйся",
            preferredStyle: .alert)
        
        let addTextAlertControllerOkAction = UIAlertAction(
            title: "ОК",
            style: .default) { [weak addTextAlertController] _ in
                let textField = addTextAlertController?.textFields?[0]
                self.addedLabel.text = textField?.text
                self.demonstrationLabel.isHidden = false
            }
        
        addTextAlertController.addTextField()
        addTextAlertController.addAction(addTextAlertControllerOkAction)
        present(addTextAlertController, animated: true)
    }
    
    @objc private func fontSizeChangeAction(_ sender: UISlider) {
        demonstrationLabel.font = demonstrationLabel.font.withSize(
            CGFloat(Int(sender.value))
        )
    }
    
    private func setupUI() {
        view.backgroundColor = .lightGray
        title = "Изменение текста"
        configurateDemonstrationLabel()
        configurateAddedLabel()
        createAddButton()
        configurateFontSizeSlider()
        configurateLabelTextColorTextField()
        configurateNumberOfLinesTextField()
        configurateTextColorPicker()
        configurateNumberOfLinesPicker()
    }
    
    private func configurateDemonstrationLabel() {
        demonstrationLabel.text = """
Я скажу то, что для тебя не новость: RoadMap не такой уж солнечный и приветливый.
Это очень опасное, жесткое место, и если только дашь слабину, он опрокинет с такой силой тебя,
что больше уже не встанешь. Ни ты, ни я, никто на свете, не бьёт так сильно, как RoadMap!
Совсем не важно, как ты кодишь, а важно, какой держишь код ревью, как двигаешься вперёд.
Будешь программировать — ПРОГРАММИРУЙ! Если с испугу не свернёшь... Только так побеждают!
Если знаешь, чего ты стоишь — иди и бери своё! Но будь готов отжимания делать,
а не плакаться и говорить: «Я ничего не добился из-за сложной домашки, из-за недостатка времени,
из-за кого-то!» Так делают трусы! А ты не трус! Быть этого не может!
Ты iOS разработчик... иногда навещай Женю с Сашей.
"""
        demonstrationLabel.frame = CGRect(x: 25, y: 75, width: 350, height: 600)
        demonstrationLabel.numberOfLines = 0
        demonstrationLabel.lineBreakMode = .byWordWrapping
        demonstrationLabel.font = .systemFont(ofSize: 10, weight: .regular)
        demonstrationLabel.textColor = .black
        demonstrationLabel.shadowColor = .lightGray
        demonstrationLabel.layer.shadowOpacity = 0.3
        demonstrationLabel.layer.shadowRadius = 2
        demonstrationLabel.shadowOffset = CGSize(width: 2, height: 2)
        demonstrationLabel.isHidden = true
        view.addSubview(demonstrationLabel)
    }
    
    private func configurateAddedLabel() {
        addedLabel.frame = CGRect(x: 150, y: 100, width: 250, height: 50)
        view.addSubview(addedLabel)
    }
    
    private func createAddButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addTextToLabelAlertController)
        )
    }
    
    private func configurateFontSizeSlider() {
        fontSizeSlider.frame = CGRect(x: 65, y: 650, width: 250, height: 25)
        fontSizeSlider.maximumValue = 30
        fontSizeSlider.minimumValue = 5
        fontSizeSlider.value = 10
        fontSizeSlider.addTarget(self, action: #selector(fontSizeChangeAction), for: .valueChanged)
        view.addSubview(fontSizeSlider)
    }
    
    private func configurateLabelTextColorTextField() {
        labelTextColorTextField.frame = CGRect(x: 25, y: 700, width: 100, height: 50)
        labelTextColorTextField.placeholder = "Выберите цвет текста"
        labelTextColorTextField.inputView = textColorPicker
        view.addSubview(labelTextColorTextField)
    }
    
    private func configurateNumberOfLinesTextField() {
        numberOfLinesTextField.frame = CGRect(x: 175, y: 700, width: 100, height: 50)
        numberOfLinesTextField.placeholder = "Выберите количество строк"
        numberOfLinesTextField.inputView = numberOfLinesPicker
        view.addSubview(numberOfLinesTextField)
    }
    
    private func configurateTextColorPicker() {
        textColorPicker.tag = 1
        textColorPicker.delegate = self
        textColorPicker.dataSource = self
    }
    
    private func configurateNumberOfLinesPicker() {
        numberOfLinesPicker.tag = 2
        numberOfLinesPicker.delegate = self
        numberOfLinesPicker.dataSource = self
    }
    
    let textColors = ["MyRed", "MyGreen", "MyBlue", "MyPurple"]
    let numbersOfLine = [10, 11, 12, 13, 14, 15, 16, 17, 18]
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension LabelEditingViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return textColors[row]
        case 2:
            return "\(numbersOfLine[row])"
        default:
            return "Error"
        }
    }
}

extension LabelEditingViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return textColors.count
        case 2:
            return numbersOfLine.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            labelTextColorTextField.text = textColors[row]
            demonstrationLabel.textColor = UIColor(named: textColors[row])
            labelTextColorTextField.resignFirstResponder()
        case 2:
            numberOfLinesTextField.text = "\(numbersOfLine[row])"
            demonstrationLabel.numberOfLines = numbersOfLine[row]
            numberOfLinesTextField.resignFirstResponder()
        default:
            return
        }
    }
}
