//
//  ViewController.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 21.09.2022.
//

import UIKit

/// ViewController
class GrandmotherViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var buttonShare = UIButton()
    var activityViewController: UIActivityViewController?
    var relatives = ["Старшая дочь", "Младшая дочь", "Внук"]
    var relativesPicker = UIPickerView()

    @IBOutlet weak var postcardImageView: UIImageView!
    
    @IBOutlet weak var relativeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        relativeTextField.inputView = relativesPicker
        relativesPicker.delegate = self
        relativesPicker.dataSource = self
        view.backgroundColor = .white
    }
    
    // MARK: - Methods
    
    // конфигурация алерт контроллера
    @objc func handleShareAction(paramSender: Any) {
        let text = relativeTextField.text
        
        guard text == "Внук" else {
            let message = "Выберите любимого родственника"
            let shareAlertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let shareAlertControllerOkAction = UIAlertAction(title: "OK", style: .cancel)
            shareAlertController.addAction(shareAlertControllerOkAction)
            present(shareAlertController, animated: true)
            return
        }
        showActivityController()
    }
    
    @IBAction func shareButtonAction(_ sender: AnyObject) {
        sender.addTarget(self, action: #selector(handleShareAction), for: .touchUpInside)
    }
    
    func showActivityController() {
        activityViewController = UIActivityViewController(
            activityItems: [
                "Сообщение отправлено родственнику:\(relativeTextField.text ?? "???") с помощью программы",
                postcardImageView.image ?? "no image"
            ],
            applicationActivities: nil
        )
        activityViewController?.excludedActivityTypes = [
            UIActivity.ActivityType.airDrop,
            UIActivity.ActivityType.postToFacebook
        ]
        guard let activity = activityViewController else {
            return
        }
        present(activity, animated: true)
    }
    
    // MARK: - методы протоколов пикера
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return relatives.count
    }
    
    func  pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return relatives[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        relativeTextField.text = relatives[row]
        guard relativeTextField.text == "Внук" else {
            return
        }
        relativeTextField.resignFirstResponder()
        showActivityController()
    }
}
