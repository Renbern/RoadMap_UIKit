//
//  MainScreenViewController.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 26.09.2022.
//

import UIKit

// Экран входа в приложение
class MainScreenViewController: UIViewController {
    
    /// UI elements
    let appLogoImage = UIImageView()
    let appNameLabel = UILabel()
    let signInButton = UIButton()
    let usernameLabel = UILabel()
    let usernameTextField = UITextField()
    let passwordLabel = UILabel()
    let passwordTextField = UITextField()
    private lazy var showHidePasswordButton: UIButton = {
        let eyeBotton = UIButton()
        eyeBotton.setBackgroundImage(UIImage(systemName: "eye.fill"), for: .normal)
        eyeBotton.tintColor = .systemOrange
        eyeBotton.addTarget(self, action: #selector(showHidePasswordButtonAction), for: .touchUpInside)
        eyeBotton.frame = CGRect(x: 320, y: 560, width: 25, height: 15)
        return eyeBotton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    // Метод перехода на следующий экран
    @objc func routeToProductListAction() {
        let productList = ProductViewController()
        navigationController?.pushViewController(productList, animated: true)
    }
    
    @objc func showHidePasswordButtonAction() {
        if passwordTextField.isSecureTextEntry {
            passwordTextField.isSecureTextEntry = false
            showHidePasswordButton.setBackgroundImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
            showHidePasswordButton.tintColor = .darkGray
        } else {
            passwordTextField.isSecureTextEntry = true
            showHidePasswordButton.setBackgroundImage(UIImage(systemName: "eye.fill"), for: .normal)
            showHidePasswordButton.tintColor = .systemOrange
        }
    }
    
    /// Конфигурация элементов интерфейса
    func configureAppLogoImage() {
        appLogoImage.image = UIImage(named: "AppLogo")
        appLogoImage.frame = CGRect(x: -50, y: 100, width: 500, height: 250)
        view.addSubview(appLogoImage)
    }
    
    func configureAppNameLabel() {
        appNameLabel.text = "Game Rent"
        appNameLabel.font = UIFont(name: "Helvetica", size: 35)
        appNameLabel.frame = CGRect(x: 100, y: 350, width: 240, height: 60)
        view.addSubview(appNameLabel)
    }
    
    func configureUsernameLabel() {
        usernameLabel.text = "Логин"
        usernameLabel.font = .systemFont(ofSize: 20, weight: .black)
        usernameLabel.frame = CGRect(x: 35, y: 435, width: 100, height: 45)
        view.addSubview(usernameLabel)
    }
    
    func configureUsernameTextField() {
        usernameTextField.placeholder = "Введите логин"
        usernameTextField.frame = CGRect(x: 33, y: 470, width: 320, height: 30)
        usernameTextField.borderStyle = .roundedRect
        view.addSubview(usernameTextField)
    }
    
    func configurePasswordLabel() {
        passwordLabel.text = "Пароль"
        passwordLabel.font = .systemFont(ofSize: 20, weight: .black)
        passwordLabel.frame = CGRect(x: 35, y: 520, width: 100, height: 30)
        view.addSubview(passwordLabel)
    }
    
    func configurePasswordTextField() {
        passwordTextField.placeholder = "Введите пароль"
        passwordTextField.frame = CGRect(x: 33, y: 550, width: 320, height: 30)
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        view.addSubview(passwordTextField)
    }
    
    func configureSignInButton() {
        signInButton.setTitle("Войти", for: .normal)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.backgroundColor = .systemGray2
        signInButton.layer.cornerRadius = 10
        signInButton.addTarget(self, action: #selector(routeToProductListAction), for: .touchUpInside)
        signInButton.frame = CGRect(x: 50, y: 650, width: 300, height: 70)
        view.addSubview(signInButton)
    }
    
    func setupUI() {
        configureAppLogoImage()
        configureAppNameLabel()
        configureUsernameLabel()
        configureUsernameTextField()
        configurePasswordLabel()
        configurePasswordTextField()
        configureSignInButton()
    }
}
