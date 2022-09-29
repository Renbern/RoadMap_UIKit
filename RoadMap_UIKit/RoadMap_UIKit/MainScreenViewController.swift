//
//  ViewController.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 21.09.2022.

import UIKit

/// ViewController
class MainScreenViewController: UIViewController {
    
    // MARK: - UI Elements
    
    let pizzaLogoImageView = UIImageView()
    
    let emailLabel = UILabel()
    
    let emailTextField = UITextField()
    
    let passwordLabel = UILabel()
    
    let passwordTextField = UITextField()
    
    let signInButton = UIButton()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .white
        
        configuratePizzaLogoImage()
        configurateEmailLabel()
        configurateEmailTextField()
        configuratePasswordLabel()
        configuratePassordTextField()
        configurateSignInButton()
        
        setUnderlines()
    }
    
    private func setUnderlines() {
        emailTextField.setUnderLine()
        passwordTextField.setUnderLine()
    }
    
    private func configuratePizzaLogoImage() {
        pizzaLogoImageView.image = UIImage(named: "pizzaLogo")
        pizzaLogoImageView.frame = CGRect(x: 130, y: 150, width: 145, height: 145)
        view.addSubview(pizzaLogoImageView)
    }
    
    private func configurateEmailLabel() {
        emailLabel.text = "Email"
        emailLabel.textColor = .systemCyan
        emailLabel.frame = CGRect(x: 25, y: 300, width: 100, height: 30)
        view.addSubview(emailLabel)
    }
    
    private func configurateEmailTextField() {
        emailTextField.placeholder = "Введите номер телефона"
        emailTextField.frame = CGRect(x: 25, y: 340, width: 340, height: 30)
        emailTextField.keyboardType = .numberPad
        view.addSubview(emailTextField)
    }
    
    private func configuratePasswordLabel() {
        passwordLabel.text = "Password"
        passwordLabel.textColor = .systemCyan
        passwordLabel.frame = CGRect(x: 25, y: 400, width: 100, height: 30)
        view.addSubview(passwordLabel)
    }
    
    private func configuratePassordTextField() {
        passwordTextField.placeholder = "Введите пароль"
        passwordTextField.frame = CGRect(x: 25, y: 440, width: 340, height: 30)
        passwordTextField.isSecureTextEntry = true
        view.addSubview(passwordTextField)
    }
    
    private func configurateSignInButton() {
        signInButton.setTitle("Войти", for: .normal)
        signInButton.backgroundColor = .systemCyan
        signInButton.frame = CGRect(x: 40, y: 600, width: 300, height: 50)
        signInButton.layer.cornerRadius = 10
        signInButton.addTarget(self, action: #selector(toFoodScreenAction), for: .touchUpInside)
        view.addSubview(signInButton)
    }
    
    @objc func toFoodScreenAction() {
        let foodVC = FoodViewController()
        let navigationController = UINavigationController(rootViewController: foodVC)
        foodVC.title = "Food"
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
}

// MARK: - устанавливает нижнюю линию под элементом
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
