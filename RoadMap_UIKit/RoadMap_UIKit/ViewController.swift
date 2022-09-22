//
//  ViewController.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 21.09.2022.
//

import UIKit

/// Отображает кнопки двух игр, суммы и Угадай число
class ViewController: UIViewController {
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
        button.addTarget(self, action: #selector(startSumm), for: .touchUpInside)
        return button
    }()
    
    lazy var randomNumberButton: UIButton = {
        let button = UIButton()
        button.setTitle("Случайное число", for: .normal)
        button.setTitleColor(.purple, for: .normal)
        button.backgroundColor = .gray
        button.frame = CGRect(x: 100, y: 200, width: 200, height: 60)
        button.addTarget(self, action: #selector(startSecretGame), for: .touchUpInside)
        return button
    }()
    
    var numberGame = SecretNumberGame()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showUsernameAlert()
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func startSecretGame() {
        showSecretAlert()
    }
    @objc func startSumm() {
        alertSumm()
    }
    
    func setupUI() {
        view.addSubview(summButton)
        view.addSubview(randomNumberButton)
        view.addSubview(greetingLabel)
    }
    
    // Алерт принимает два числа и показывает их сумму
    func alertSumm() {
        let sumAlert = UIAlertController(title: "Сумма чисел", message: "Введите два числа", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
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
        sumAlert.addAction(action)
        sumAlert.addTextField()
        sumAlert.addTextField()
        self.present(sumAlert, animated: true)
}
    
    // Конфигурирует аллерт ФИО пользователя
    func showUsernameAlert() {
        let usernameAlertController = UIAlertController(
            title: "Давайте познакомимся!",
            message: "Введите ФИО",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            guard let username = usernameAlertController.textFields?.first?.text else {
                return
            }
            self.greetingLabel.text = "Hi, \(username)!"
        }
        usernameAlertController.addAction(okAction)
        usernameAlertController.addTextField()
        self.present(usernameAlertController, animated: true)
    }
    
    // Конфигурирует алерт суммы
    func showSummAlert(title: String, message: String, preferredStyle: UIAlertController.Style, textField: Bool) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: preferredStyle)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            print("OK action")
        }
        if textField {
            alertController.addTextField()
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(cancelAction)
        alertController.textFields?.first?.placeholder = "Введите первое число"
        alertController.textFields?.last?.placeholder = "Введите второе число"
    }

    // Вызывает алерт игры Угадай число, результат выводится в консоль в виде булеовго значения
    func showSecretAlert() {
        let alertController = UIAlertController(title: "Угадай число",
                                                message: "Загадай число от 1 до 10",
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            print(self.numberGame.isRight(answer: self.numberGame.answer))
        }
        alertController.addAction(okAction)
        alertController.addTextField { textField in
            textField.delegate = self
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(cancelAction)
        present(alertController, animated: true) {
            self.numberGame.generate()
        }
    }

}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text,
           let number  = Int(text) {
            numberGame.answer = number
        }
    }
}

/// Класс игры Угадай число
class SecretNumberGame {
    var secret: Int
    var answer: Int
    init() {
        secret = 0
        answer = 0
    }
    func generate() {
        secret = Int.random(in: 1...10)
    }
    func isRight(answer: Int) -> Bool {
        secret == answer
    }
}
