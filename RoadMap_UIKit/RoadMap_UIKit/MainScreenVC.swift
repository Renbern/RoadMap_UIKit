//
//  ViewController.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 21.09.2022.
//

import UIKit

/// главный экран приложения
class MainScreenVC: UIViewController {
    
    let appNameLabel: UILabel = {
        let appName = UILabel()
        appName.text = "Birthday Reminder"
        appName.frame = CGRect(x: 105, y: 110, width: 180, height: 70)
        appName.textAlignment = .center
        appName.textColor = .systemCyan
        appName.font = .systemFont(ofSize: 18)
        appName.layer.borderColor = UIColor.black.cgColor
        appName.layer.borderWidth = 1
        return appName
    }()

    let signInLabel: UILabel = {
        let signIn = UILabel()
        signIn.text = "Sign in"
        signIn.font = .systemFont(ofSize: 25, weight: .heavy)
        signIn.frame = CGRect(x: 50, y: 250, width: 100, height: 70)
        return signIn
    }()

    let emailLabel: UILabel = {
        let email = UILabel()
        email.text = "E-mail"
        email.textColor = .systemCyan
        email.font = .systemFont(ofSize: 15, weight: .semibold)
        email.frame = CGRect(x: 50, y: 300, width: 100, height: 50)
        return email
    }()

    let emailTextField: UITextField = {
        let email = UITextField()
        email.textColor = .black
        email.font = .systemFont(ofSize: 13, weight: .light)
        email.frame = CGRect(x: 50, y: 340, width: 300, height: 30)
        return email
    }()

    let passwordLabel: UILabel = {
        let password = UILabel()
        password.text = "Password"
        password.textColor = .systemCyan
        password.font = .systemFont(ofSize: 15, weight: .semibold)
        password.frame = CGRect(x: 50, y: 400, width: 100, height: 50)
        return password
    }()

    let passwordTextField: UITextField = {
        let password = UITextField()
        password.textColor = .black
        password.font = .systemFont(ofSize: 13, weight: .light)
        password.frame = CGRect(x: 50, y: 440, width: 300, height: 30)
        password.isSecureTextEntry = true
        return password
    }()
    
    private lazy var eyeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "eye.fill"), for: .normal)
        button.tintColor = .lightGray
        button.addTarget(self, action: #selector(showHidePasswordAction), for: .touchUpInside)
        button.frame = CGRect(x: 300, y: 440, width: 40, height: 25)
        return button
    }()

    let faceIdEntranceLabel: UILabel = {
        let faceID = UILabel()
        faceID.text = "Вход по FaceID"
        faceID.font = .systemFont(ofSize: 15, weight: .semibold)
        faceID.textColor = .black
        faceID.frame = CGRect(x: 150, y: 510, width: 160, height: 50)
        return faceID
    }()

    let faceIdSwitch: UISwitch = {
        let faceSwitch = UISwitch()
        faceSwitch.frame = CGRect(x: 280, y: 520, width: 60, height: 40)
        return faceSwitch
    }()

    private lazy var enterButton: UIButton = {
        let enter = UIButton()
        enter.setTitle("Войти", for: .normal)
        enter.backgroundColor = .systemCyan
        enter.frame = CGRect(x: 100, y: 680, width: 200, height: 50)
        enter.layer.cornerRadius = 10
        enter.addTarget(self, action: #selector(toTheFriendsListAction), for: .touchUpInside)
        return enter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        view.addSubview(appNameLabel)
        view.addSubview(signInLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(faceIdEntranceLabel)
        view.addSubview(faceIdSwitch)
        view.addSubview(enterButton)
        view.addSubview(eyeButton)
        view.backgroundColor = .white
        setUnderlines()
    }
    
    func setUnderlines() {
        emailTextField.setUnderLine()
        passwordTextField.setUnderLine()
    }
    
    @objc func toTheFriendsListAction() {
        let friendsList = FriendsListVC()
        friendsList.title = "Birthday"
        navigationController?.pushViewController(friendsList, animated: true)
    }
    
    @objc func showHidePasswordAction() {
        if passwordTextField.isSecureTextEntry {
            passwordTextField.isSecureTextEntry = false
            eyeButton.setBackgroundImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        } else {
            passwordTextField.isSecureTextEntry = true
            eyeButton.setBackgroundImage(UIImage(systemName: "eye.fill"), for: .normal)
        }
    }
}

/// Добавляет подчеркивание текстового поля
extension UIControl {
    func setUnderLine() {
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor.gray.cgColor
        border.frame = CGRect(
            x: 0, y: self.frame.size.height - width,
            width: self.frame.size.width - 10,
            height: self.frame.size.height
        )
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
