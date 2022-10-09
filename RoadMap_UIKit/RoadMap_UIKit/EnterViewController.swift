//
//  EnterViewController.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 07.10.2022.
//

import UIKit

// экран входа в приложение
final class EnterViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    // MARK: - Private properties
    private(set) var key = ""
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        key = UserDefaults.standard.string(forKey: "emailTextField") ?? ""
    }
    
    // MARK: - IBActions
    @IBAction private func enterButtonAction(_ sender: Any) {
        if emailTextField.text == key {
            toCharacterVC()
        }
    }
    
    @IBAction private func registrationButtonAction(_ sender: Any) {
        toRegistrationVC()
    }
    
    // MARK: - Private methods
    private func setupUI() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func toCharacterVC() {
        let characterVC = UIStoryboard(name: "Main", bundle: nil)
        guard let nextScreen = characterVC.instantiateViewController(
            withIdentifier: "CharacterCreationViewController"
        ) as? CharacterCreationViewController else { return }
        nextScreen.modalPresentationStyle = .fullScreen
        show(nextScreen, sender: nil)
    }
    
    private func toRegistrationVC() {
        let registrationVC = UIStoryboard(name: "Main", bundle: nil)
        guard let nextScreen = registrationVC.instantiateViewController(
            withIdentifier: "RegistrationViewController"
        ) as? RegistrationViewController else { return }
        navigationController?.pushViewController(nextScreen, animated: true)
    }
}
