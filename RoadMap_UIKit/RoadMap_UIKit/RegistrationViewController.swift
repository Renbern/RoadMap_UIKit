//
//  ViewController.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 21.09.2022.

import UIKit

// Стартовый экран приложения
final class RegistrationViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        nicknameTextField.delegate = self
    }

    // MARK: - IBActions
    @IBAction func registrationAction(_ sender: Any) {
        showExistingUserAlertController()
    }
    
    // MARK: - Private methods
    @objc private func showExistingUserAlertController() {
        guard let userEmail = emailTextField.text else { return }
        UserDefaults.standard.set(userEmail, forKey: "emailTextField")
        navigationController?.popViewController(animated: true)
    }
    
    private let defaults = UserDefaults.standard
    
    private func setupUI() {
        view.backgroundColor = .white
        movingView()
        defaults.string(forKey: "emailTextField")
    }
    
    // Moving view by Y
    private func movingView() {
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil,
            queue: nil
        ) { _ in
            self.view.frame.origin.y = -250
        }
        
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil,
            queue: nil
        ) { _ in
            self.view.frame.origin.y = 0
        }
    }
    
    private func existingUserAlertController() {
        let existingUserAlertController = UIAlertController(
            title: "Регистрация отклонена",
            message: "Пользователь с такой почтой уже зарегистрирован",
            preferredStyle: .alert
        )
        let existingUserAlertControllerEnterAction = UIAlertAction(title: "Войти", style: .default) { _ in
            let enterVC = UIStoryboard(name: "Main", bundle: nil)
            guard let nextScreen = enterVC.instantiateViewController(
                withIdentifier: "EnterViewController"
            ) as? EnterViewController else { return }
            nextScreen.modalPresentationStyle = .fullScreen
            self.show(nextScreen, sender: nil)
        }
        
        let stayAction = UIAlertAction(title: "Отмена", style: .cancel)
        existingUserAlertController.addAction(stayAction)
        existingUserAlertController.addAction(existingUserAlertControllerEnterAction)
        navigationController?.popViewController(animated: true)
        present(existingUserAlertController, animated: true)
    }
}
