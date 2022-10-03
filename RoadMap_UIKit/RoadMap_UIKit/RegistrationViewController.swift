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
        if nicknameTextField.text == "Renbern" {
            existingUserAlertController()
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        movingView()
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
            message: "Пользователь с таким никнеймом уже зарегистрирован",
            preferredStyle: .alert
        )
        let existingUserAlertControllerOkAction = UIAlertAction(title: "Ok", style: .default)
        existingUserAlertController.addAction(existingUserAlertControllerOkAction)
        navigationController?.popViewController(animated: true)
        present(existingUserAlertController, animated: true)
    }
}
