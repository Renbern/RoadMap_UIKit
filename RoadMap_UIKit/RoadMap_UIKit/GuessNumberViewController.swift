//
//  ViewController.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 21.09.2022.
//

import UIKit

/// Класс игры Угадай число
class SecretNumberGame {
    var secret = 0
    var answer = 0
    
    func generateRandomNumber() {
        secret = Int.random(in: 1...10)
    }
    func isRight(answer: Int) -> Bool {
        secret == answer
    }
}

/// Отображает кнопки двух игр, суммы и Угадай число
class GuessNumberViewController: UIViewController {
    let greetingLabel: UILabel = {
        let greeting = UILabel()
        greeting.text = ""
        greeting.textColor = .black
        greeting.frame = CGRect(x: 100, y: 300, width: 200, height: 50)
        return greeting
    }()
    
    lazy var summButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сложение", for: .normal)
        button.setTitleColor(.purple, for: .normal)
        button.backgroundColor = .gray
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 60)
        button.addTarget(self, action: #selector(startSummAction), for: .touchUpInside)
        return button
    }()
    
    lazy var randomNumberButton: UIButton = {
        let button = UIButton()
        button.setTitle("Случайное число", for: .normal)
        button.setTitleColor(.purple, for: .normal)
        button.backgroundColor = .gray
        button.frame = CGRect(x: 100, y: 200, width: 200, height: 60)
        button.addTarget(self, action: #selector(startSecretGameAction), for: .touchUpInside)
        return button
    }()
    
    var numberGame = SecretNumberGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configureUserNameAlertController()
        setupUI()
    }
    
    @objc func startSecretGameAction() {
        configureSecretAlert()
    }
    @objc func startSummAction() {
        configureAlertSummController()
    }
    
    func setupUI() {
        view.addSubview(summButton)
        view.addSubview(randomNumberButton)
        view.addSubview(greetingLabel)
    }
    
    // Алерт принимает два числа и показывает их сумму
    func configureAlertSummController() {
        let sumAlert = UIAlertController(title: "Сумма чисел", message: "Введите два числа", preferredStyle: .alert)
        let sumAlertAction = UIAlertAction(title: "OK", style: .default) { _ in
            guard let firstNumber = Int(sumAlert.textFields?[0].text ?? ""),
                  let secondNumber = Int(sumAlert.textFields?[1].text ?? "") else {
                self.showSummAlert(
                    title: "Упс!",
                    message: "Неверные входящие параметры",
                    preferredStyle: .alert,
                    textField: false
                )
                return
            }
            self.showSummAlert(
                title: "Мы тут посчитали",
                message: "Сумма введённых чисел равна \(firstNumber + secondNumber)",
                preferredStyle: .alert,
                textField: false
            )
        }
        sumAlert.addAction(sumAlertAction)
        sumAlert.addTextField()
        sumAlert.addTextField()
        present(sumAlert, animated: true)
    }
    
    // Конфигурирует аллерт ФИО пользователя
    func configureUserNameAlertController() {
        let usernameAlertController = UIAlertController(
            title: "Давайте познакомимся!",
            message: "Введите ФИО",
            preferredStyle: .alert
        )
        let userNameAlertControllerOkAction = UIAlertAction(title: "OK", style: .default) { _ in
            guard let username = usernameAlertController.textFields?.first?.text else {
                return
            }
            self.greetingLabel.text = "Hi, \(username)!"
        }
        usernameAlertController.addAction(userNameAlertControllerOkAction)
        usernameAlertController.addTextField()
        present(usernameAlertController, animated: true)
    }
    
    // Конфигурирует алерт суммы
    func showSummAlert(title: String, message: String, preferredStyle: UIAlertController.Style, textField: Bool) {
        let sumAlertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: preferredStyle)
        let sumAlertControllerOkAction = UIAlertAction(title: "OK", style: .default) { _ in
            print("OK action")
        }
        if textField {
            sumAlertController.addTextField()
        }
        sumAlertController.addAction(sumAlertControllerOkAction)
        present(sumAlertController, animated: true)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        sumAlertController.addAction(cancelAction)
        sumAlertController.textFields?.first?.placeholder = "Введите первое число"
        sumAlertController.textFields?.last?.placeholder = "Введите второе число"
    }
    
    // Вызывает алерт игры Угадай число, результат выводится в консоль в виде булеовго значения
    func configureSecretAlert() {
        let secretNumberAlertController = UIAlertController(title: "Угадай число",
                                                message: "Загадай число от 1 до 10",
                                                preferredStyle: .alert)
        let secretNumberAlertControllerOkAction = UIAlertAction(title: "OK", style: .default) { _ in
            print(self.numberGame.isRight(answer: self.numberGame.answer))
        }
        secretNumberAlertController.addAction(secretNumberAlertControllerOkAction)
        secretNumberAlertController.addTextField { textField in
            textField.delegate = self
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        secretNumberAlertController.addAction(cancelAction)
        present(secretNumberAlertController, animated: true) {
            self.numberGame.generateRandomNumber()
        }
    }
    
}

extension GuessNumberViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text,
           let number  = Int(text) {
            numberGame.answer = number
        }
    }
}
