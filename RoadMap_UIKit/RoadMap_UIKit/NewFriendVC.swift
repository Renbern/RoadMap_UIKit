//
//  NewFriendVC.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 24.09.2022.
//

import UIKit

/// добавляет нового человека к списку друзей
class NewFriendVC: UIViewController {
    
    var birthdayPicker = UIDatePicker()
    
    var agePicker = UIPickerView()
    
    var genderPicker = UIPickerView()
    
    private lazy var cancelButton: UIButton = {
        let button  = UIButton()
        button.setTitle("Отмена", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(toFriendsListAction), for: .touchUpInside)
        button.frame = CGRect(x: 25, y: 25, width: 70, height: 30)
        return button
    }()
    
    private lazy var addButton: UIButton = {
        let button  = UIButton()
        button.setTitle("Добавить", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(addPersonAction), for: .touchUpInside)
        button.frame = CGRect(x: 280, y: 25, width: 90, height: 30)
        return button
    }()
    
    private lazy var instagramTextField: UITextField = {
        let instagram = UITextField()
        instagram.textColor = .black
        instagram.placeholder = "Добавить"
        instagram.addTarget(self, action: #selector(instagramAlert), for: .allEditingEvents)
        instagram.font = .systemFont(ofSize: 15, weight: .light)
        instagram.frame = CGRect(x: 50, y: 640, width: 300, height: 30)
        return instagram
    }()
    
    // Линт ругался на длину строки, пришлось дать угла
    let ages = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
                11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21]
    
    let genders = ["Male", "Female", "Not selected"]
    
    let newFriendPhotoButton: UIButton = {
        let photo = UIButton(type: .custom)
        photo.setBackgroundImage(UIImage(systemName: "person.crop.circle.fill"), for: .normal)
        photo.tintColor = .gray
        photo.frame = CGRect(x: 105, y: 75, width: 155, height: 155)
        return photo
    }()
    
    let changePhotoLabel: UIButton = {
        let button  = UIButton()
        button.setTitle("Изменить фото", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.frame = CGRect(x: 105, y: 235, width: 150, height: 30)
        return button
    }()
    
    let nameLabel: UILabel = {
        let email = UILabel()
        email.text = "Имя"
        email.textColor = .systemCyan
        email.font = .systemFont(ofSize: 18, weight: .semibold)
        email.frame = CGRect(x: 50, y: 280, width: 100, height: 50)
        return email
    }()

    let nameTextField: UITextField = {
        let name = UITextField()
        name.textColor = .black
        name.placeholder = "Введите имя"
        name.font = .systemFont(ofSize: 15, weight: .light)
        name.frame = CGRect(x: 50, y: 320, width: 300, height: 30)
        return name
    }()

    let birthdayLabel: UILabel = {
        let password = UILabel()
        password.text = "Дата"
        password.textColor = .systemCyan
        password.font = .systemFont(ofSize: 18, weight: .semibold)
        password.frame = CGRect(x: 50, y: 360, width: 100, height: 50)
        return password
    }()
    
    let birthdayTextField: UITextField = {
        let birthday = UITextField()
        birthday.textColor = .black
        birthday.placeholder = "Выберите дату"
        birthday.font = .systemFont(ofSize: 15, weight: .light)
        birthday.frame = CGRect(x: 50, y: 400, width: 300, height: 30)
        return birthday
    }()
    
    let ageLabel: UILabel = {
        let age = UILabel()
        age.text = "Возраст"
        age.textColor = .systemCyan
        age.font = .systemFont(ofSize: 18, weight: .semibold)
        age.frame = CGRect(x: 50, y: 440, width: 100, height: 50)
        return age
    }()
    
    let ageTextField: UITextField = {
        let age = UITextField()
        age.textColor = .black
        age.placeholder = "Добавить"
        age.font = .systemFont(ofSize: 15, weight: .light)
        age.frame = CGRect(x: 50, y: 480, width: 300, height: 30)
        return age
    }()
    
    let genderLabel: UILabel = {
        let gender = UILabel()
        gender.text = "Пол"
        gender.textColor = .systemCyan
        gender.font = .systemFont(ofSize: 18, weight: .semibold)
        gender.frame = CGRect(x: 50, y: 520, width: 100, height: 50)
        return gender
    }()
    
    let genderTextField: UITextField = {
        let gender = UITextField()
        gender.textColor = .black
        gender.placeholder = "Добавить"
        gender.font = .systemFont(ofSize: 15, weight: .light)
        gender.frame = CGRect(x: 50, y: 560, width: 300, height: 30)
        return gender
    }()
    
    let instagramLabel: UILabel = {
        let instagram = UILabel()
        instagram.text = "Запрещёнограм"
        instagram.textColor = .systemCyan
        instagram.font = .systemFont(ofSize: 18, weight: .semibold)
        instagram.frame = CGRect(x: 50, y: 600, width: 100, height: 50)
        return instagram
    }()
    
    let newPerson = FriendsListVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc func toFriendsListAction() {
        dismiss(animated: true)
    }
    
    @objc func addPersonAction() {
        newPerson.fourthFriendPhoto.isHidden = false
        newPerson.fourthFriendNameLabel.isHidden = false
        newPerson.fourthFriendBirthdayLabel.isHidden = false
        newPerson.daysToFourthFrindBirtdayLabel.isHidden = false
        dismiss(animated: true)
    }

    func createToolBar() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedAction))
        toolBar.setItems([doneButton], animated: true)
        return toolBar
    }
    
    func createDatePicker() {
        birthdayPicker.preferredDatePickerStyle = .wheels
        birthdayPicker.datePickerMode = .date
        birthdayTextField.inputView = birthdayPicker
        birthdayTextField.inputAccessoryView = createToolBar()
    }
    
    @objc func donePressedAction() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        birthdayTextField.text = dateFormatter.string(from: birthdayPicker.date)
        view.endEditing(true)
    }
    
    @objc func showInstagramAlertAction(_ textField: UITextField) -> Bool {
        let alert = UIAlertController(title: "Укажите ваш профиль в Instagram", message: nil, preferredStyle: .alert)
        let alertInstaButton = UIAlertAction(title: "OK", style: .default) { _ in
            guard let text = alert.textFields?.first?.text else {
                return
            }
            self.instagramTextField.text = text
        }
        alert.addAction(alertInstaButton)
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        
        alert.addTextField()
        
        present(alert, animated: true)
        return true
    }
    
    func setupUI() {
        view.addSubview(newFriendPhotoButton)
        view.addSubview(cancelButton)
        view.addSubview(addButton)
        view.addSubview(changePhotoLabel)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(birthdayLabel)
        view.addSubview(birthdayTextField)
        view.addSubview(ageLabel)
        view.addSubview(ageTextField)
        view.addSubview(genderLabel)
        view.addSubview(genderTextField)
        view.addSubview(instagramLabel)
        view.addSubview(instagramTextField)
        
        view.backgroundColor = .white
        
        agePicker.delegate = self
        agePicker.dataSource = self
        ageTextField.inputView = agePicker
        agePicker.tag = 1
        
        genderPicker.delegate = self
        genderPicker.dataSource = self
        genderTextField.inputView = genderPicker
        genderPicker.tag = 2
        
        setUnderlines()
        createDatePicker()
    }
    
    func setUnderlines() {
        nameTextField.setUnderLine()
        birthdayTextField.setUnderLine()
        ageTextField.setUnderLine()
        instagramTextField.setUnderLine()
    }
}

/// Расширение для конфигурации пикеров
 extension NewFriendVC: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
     
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return ages.count
        case 2:
            return genders.count
        default:
            return 1
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return "\(ages[row])"
        case 2:
            return genders[row]
        default:
            return "Error"
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            ageTextField.text = "\(ages[row])"
            ageTextField.resignFirstResponder()
        case 2:
            genderTextField.text = genders[row]
            genderTextField.resignFirstResponder()
        default:
            return
        }
    }
 }
