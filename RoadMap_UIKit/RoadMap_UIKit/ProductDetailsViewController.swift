//
//  ViewController.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 21.09.2022.
//

import UIKit

/// Экран выбора игры
class ProductDetailsViewController: UIViewController {
    
    // Конфигурация элементов UI
    let rentDatePicker = UIDatePicker()

    let products = [UIImage(named: "Cyberpunk2077_PS4"),
                      UIImage(named: "Cyberpunk2077_XBOX")]
    
    let rentDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Аренда до:"
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.frame = CGRect(x: 65, y: 497, width: 150, height: 30)
        return label
    }()
    
    let pointsDeductLabel: UILabel = {
        let label = UILabel()
        label.text = "Списать баллы"
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.frame = CGRect(x: 65, y: 535, width: 150, height: 30)
        return label
    }()
    
    let rentDateTextField: UITextField = {
        let rent = UITextField()
        rent.textColor = .black
        rent.placeholder = "Выберите дату"
        rent.font = .systemFont(ofSize: 15, weight: .light)
        rent.frame = CGRect(x: 230, y: 500, width: 150, height: 30)
        return rent
    }()
    
    let quantityOfPointsLabel: UILabel = {
        let label = UILabel()
        label.text = "Количество баллов к списанию"
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.isHidden = true
        label.frame = CGRect(x: 68, y: 575, width: 250, height: 30)
        label.textAlignment = .center
        return label
    }()
    
    let quantityOfPoints: UILabel = {
        let quantity = UILabel()
        quantity.text = ""
        quantity.isHidden = true
        quantity.textColor = .systemOrange
        quantity.font = .systemFont(ofSize: 25, weight: .bold)
        quantity.frame = CGRect(x: 170, y: 600, width: 100, height: 50)
        return quantity
    }()
    
    var segmentControl = UISegmentedControl()
    var segmentItems = ["PlayStation 4", "Xbox ONE"]
    
    var imageView = UIImageView()
    
    private lazy var pointsDeductSwitch: UISwitch = {
        let points = UISwitch()
        points.frame = CGRect(x: 250, y: 535, width: 45, height: 30)
        points.tintColor = .systemOrange
        points.addTarget(self, action: #selector(showSliderAction), for: .valueChanged)
        return points
    }()
    
    private lazy var pointsToDeduct: UISlider = {
        let points = UISlider()
        points.frame = CGRect(x: 55, y: 645, width: 290, height: 20)
        points.tintColor = .systemOrange
        points.isHidden = true
        points.maximumValue = 500
        points.minimumValue = 1
        points.isContinuous = true
        points.addTarget(self, action: #selector(pointsSliderValueDidChangeAction), for: .valueChanged)
        points.value = 50
        return points
    }()
    
    private lazy var toRentButton: UIButton = {
        let toRent = UIButton()
        toRent.setTitle("Арендовать", for: .normal)
        toRent.setTitleColor(.white, for: .normal)
        toRent.backgroundColor = .systemGray2
        toRent.layer.cornerRadius = 10
        toRent.addTarget(self, action: #selector(showRentIsDoneAlertAction), for: .touchUpInside)
        toRent.frame = CGRect(x: 50, y: 700, width: 300, height: 40)
        view.addSubview(toRent)
        return toRent
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    @objc func pointsSliderValueDidChangeAction(sender: UISlider) {
        quantityOfPoints.text = "\(Int(sender.value))"
    }
    
    @objc func selectImage(target: UISegmentedControl) {
        if target == segmentControl {
            let segmentIndex = target.selectedSegmentIndex
            imageView.image = products[segmentIndex]
        }
    }
    
    @objc func showSliderAction() {
        if pointsDeductSwitch.isOn {
            quantityOfPointsLabel.isHidden = false
            quantityOfPoints.isHidden = false
            pointsToDeduct.isHidden = false
        } else {
            quantityOfPointsLabel.isHidden = true
            quantityOfPoints.isHidden = true
            pointsToDeduct.isHidden = true
        }
    }
    
    @objc func showRentIsDoneAlertAction() {
        let alertController = UIAlertController(
            title: "Заказ на аренду сделан",
            message: "Спасибо, что выбираете нас!",
            preferredStyle: .alert
        )
        let showRentIsDoneAlertActionOkAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.dismiss(animated: true)
        }
        alertController.addAction(showRentIsDoneAlertActionOkAction)
        present(alertController, animated: true)
    }
    
    @objc func donePressedAction() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        self.rentDateTextField.text = dateFormatter.string(from: rentDatePicker.date)
        self.view.endEditing(true)
    }
    
    func toProductList() {
        dismiss(animated: true)
    }
    
    func createToolBar() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: nil,
            action: #selector(donePressedAction)
        )
        toolBar.setItems([doneButton], animated: true)
        return toolBar
    }
    
    func createDatePicker() {
        rentDatePicker.preferredDatePickerStyle = .wheels
        rentDatePicker.datePickerMode = .date
        rentDateTextField.inputView = rentDatePicker
        rentDateTextField.inputAccessoryView = createToolBar()
    }
    
    func configureSegmentControl() {
        imageView.frame = CGRect(x: 45, y: 35, width: 300, height: 400)
        imageView.image = products[0]
        view.addSubview(self.imageView)
        
        segmentControl = UISegmentedControl(items: self.segmentItems)
        segmentControl.frame = CGRect(x: 35, y: 460, width: 320, height: 30)
        view.addSubview(self.segmentControl)
        segmentControl.addTarget(self, action: #selector(selectImage), for: .valueChanged)
    }
    
    func setupUI() {
        configureSegmentControl()
        createDatePicker()
        view.addSubview(rentDateTextField)
        view.addSubview(rentDateLabel)
        view.addSubview(pointsDeductLabel)
        view.addSubview(pointsDeductSwitch)
        view.addSubview(pointsToDeduct)
        view.addSubview(quantityOfPoints)
        view.addSubview(quantityOfPointsLabel)
        view.addSubview(toRentButton)
    }
    
}
