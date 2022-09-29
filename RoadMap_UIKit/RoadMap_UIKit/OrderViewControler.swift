//
//  OrderViewControler.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 29.09.2022.
//

import UIKit

/// Видим детали заказа, выбираем способ оплаты и оплачиваем
class OrderViewController: UIViewController {
    
    weak var delegate: PopToRootVC?
    
    var pizza: Pizza?
    
    private let paymentButton = UIButton()
    
    private let orderDetailsLabel = UILabel()
    
    private let cardPayLabel: UILabel = {
        let label = UILabel()
        label.text = "Оплата картой"
        label.frame = CGRect(x: 25, y: 500, width: 150, height: 30)
        return label
    }()
    
    private lazy var cardPaySwitch: UISwitch = {
        let cardPay = UISwitch()
        cardPay.frame = CGRect(x: 300, y: 500, width: 45, height: 20)
        cardPay.addTarget(self, action: #selector(toggleCashCardSwitch), for: .touchUpInside)
        return cardPay
    }()
    
    private let cashPayLabel: UILabel = {
        let label = UILabel()
        label.text = "Оплата наличными"
        label.frame = CGRect(x: 25, y: 540, width: 200, height: 30)
        return label
    }()
    
    private lazy var cashPaySwitch: UISwitch = {
        let cashPay = UISwitch()
        cashPay.frame = CGRect(x: 300, y: 540, width: 45, height: 20)
        cashPay.addTarget(
            self,
            action: #selector(toggleCashCardSwitch),
            for: .valueChanged)
        return cashPay
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func configuratePaymentButton() {
        paymentButton.setTitle(" \u{F8FF} Pay", for: .normal)
        paymentButton.backgroundColor = .black
        paymentButton.layer.cornerRadius = 10
        paymentButton.addTarget(self, action: #selector(showPaymentAlertControllerAction), for: .touchUpInside)
        paymentButton.frame = CGRect(x: 25, y: 650, width: 350, height: 55)
        view.addSubview(paymentButton)
    }
    
    @objc func showPaymentAlertControllerAction() {
        let showPaymentAlertController = UIAlertController(
            title: "Заказ оплачен",
            message: "Ваш заказ доставят в течении 16 минут! Приятного аппетита!",
            preferredStyle: .alert
        )
        let showPaymentOkAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.dismiss(animated: false)
            self.delegate?.goToRootViewController()
        }
        let showReviewAction = UIAlertAction(title: "Оставить отзыв", style: .default) { _ in
            self.giveReview()
        }
        showPaymentAlertController.addAction(showPaymentOkAction)
        showPaymentAlertController.addAction(showReviewAction)
        present(showPaymentAlertController, animated: true)
    }
    
    @objc func giveReview() {
        let giveReviewAlertController = UIAlertController(
            title: "Нам важен ваш отзыв!",
            message: "Пожалуйста опишите ваши впечатления от нашей пиццерии!",
            preferredStyle: .alert
        )
        let giveReviewOkAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.dismiss(animated: false)
            self.delegate?.goToRootViewController()
        }
        giveReviewAlertController.addTextField()
        giveReviewAlertController.addAction(giveReviewOkAction)
        present(giveReviewAlertController, animated: true)
    }
    
    func configurateOrderDetailsLabel() {
        var order = ""
        if let pizza = pizza {
            order += "Ваша пицца: \(pizza.name ?? "")\n"
            order += pizza.mozarella ?? false ? "- Моцарелла\n" : ""
            order += pizza.ham ?? false ? "- Ветчина\n" : ""
            order += pizza.mashrooms ?? false ? "- Грибы\n" : ""
            order += pizza.olives ?? false ? "- Маслины\n" : ""
        }
        orderDetailsLabel.text = order
        orderDetailsLabel.frame = CGRect(x: 25, y: 200, width: 350, height: 200)
        orderDetailsLabel.textAlignment = .left
        orderDetailsLabel.numberOfLines = 0
        orderDetailsLabel.font = .systemFont(ofSize: 25, weight: .semibold)
        view.addSubview(orderDetailsLabel)
    }
    
    @objc func toggleCashCardSwitch(_ sender: UISwitch) {
        if cardPaySwitch === sender {
            cashPaySwitch.isOn.toggle()
        } else {
            cardPaySwitch.isOn.toggle()
        }
    }
    
    func setupUI() {
        view.backgroundColor = .white
        cashPaySwitch.isOn = true

        view.addSubview(cardPayLabel)
        view.addSubview(cardPaySwitch)
        view.addSubview(cashPayLabel)
        view.addSubview(cashPaySwitch)
        configuratePaymentButton()
        configurateOrderDetailsLabel()
    }
}
