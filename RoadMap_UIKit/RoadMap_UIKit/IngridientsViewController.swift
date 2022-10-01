//
//  IngridientsViewController.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 28.09.2022.
//

import UIKit

// Протокол для перехода на рутовый контроллер
protocol PopToRootDelegate: AnyObject {
    func goToRootViewController()
}

// MARK: - выбираем ингридиенты для пиццы
class IngridientsViewController: UIViewController {
    
    // MARK: - UI Elements
    var pizza = Pizza(name: "", pizzaImage: "", mozarella: false, ham: false, mashrooms: false, olives: false)
    
    var pizzaImageView = UIImageView()
    var pizzaLabel = UILabel()
    var mozarellaLabel = UILabel()
    var mozarellaSwitch = UISwitch()
    var hamLabel = UILabel()
    var hamSwitch = UISwitch()
    var mashroomLabel = UILabel()
    var mashroomSwitch = UISwitch()
    var oliveLabel = UILabel()
    var oliveSwitch = UISwitch()
    var selectIngridientsButton = UIButton()
    let caloriesInfoButton = UIButton()

// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
// MARK: - Private method
    @objc private func toOrderDetailsAction() {
        additionalIngridients()
        let orderVC = OrderViewController()
        let secondNavigationController = UINavigationController(rootViewController: orderVC)
        orderVC.title = "Оплата"
        orderVC.pizza = pizza
        
        secondNavigationController.modalPresentationStyle = .fullScreen
        orderVC.delegate = self
        present(secondNavigationController, animated: true)
    }
    
    @objc private func toCaloriesInfoAction(_ sender: UIButton) {
        let caloriesVC = CaloriesInfoViewController()
        caloriesVC.pizza = pizza
        caloriesVC.view.backgroundColor = .white
        caloriesVC.modalPresentationStyle = .popover
        present(caloriesVC, animated: true)
    }
    
    private func configuratePizzaImageView() {
        pizzaImageView.frame = CGRect(x: 70, y: 70, width: 250, height: 250)
        pizzaImageView.image = UIImage(named: pizza.pizzaImage ?? "")
        view.addSubview(pizzaImageView)
    }
    
    private func configuratePizzaLabel() {
        pizzaLabel.text = pizza.name
        pizzaLabel.frame = CGRect(
            x: pizzaImageView.frame.midX - 80,
            y: pizzaImageView.frame.minY - 45,
            width: 200,
            height: 30)
        pizzaLabel.font = .systemFont(ofSize: 30, weight: .semibold)
        view.addSubview(pizzaLabel)
    }
    
    private func configurateMozarellaLabel() {
        mozarellaLabel.text = "Сыр моцарелла"
        mozarellaLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        mozarellaLabel.frame = CGRect(x: 35, y: 350, width: 200, height: 30)
        view.addSubview(mozarellaLabel)
    }
    
    private func configurateMozarellaSwitch() {
        mozarellaSwitch.frame = CGRect(x: 280, y: 350, width: 45, height: 20)
        view.addSubview(mozarellaSwitch)
    }
    
    private func configurateHamLabel() {
        hamLabel.text = "Ветчина"
        hamLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        hamLabel.frame = CGRect(x: 35, y: 410, width: 200, height: 30)
        view.addSubview(hamLabel)
    }
    
    private func configurateHamSwitch() {
        hamSwitch.frame = CGRect(x: 280, y: 410, width: 45, height: 20)
        view.addSubview(hamSwitch)
    }
    
    private func configurateMashroomLabel() {
        mashroomLabel.text = "Грибы"
        mashroomLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        mashroomLabel.frame = CGRect(x: 35, y: 470, width: 200, height: 30)
        view.addSubview(mashroomLabel)
    }
    
    private func configurateMashroomSwitch() {
        mashroomSwitch.frame = CGRect(x: 280, y: 470, width: 45, height: 20)
        view.addSubview(mashroomSwitch)
    }
    
    private func configurateOliveLabel() {
        oliveLabel.text = "Маслины"
        oliveLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        oliveLabel.frame = CGRect(x: 35, y: 530, width: 200, height: 30)
        view.addSubview(oliveLabel)
    }
    
    private func configurateOliveSwitch() {
        oliveSwitch.frame = CGRect(x: 280, y: 530, width: 45, height: 20)
        view.addSubview(oliveSwitch)
    }
    
    private func configurateSelectIngridientsButton() {
        selectIngridientsButton.setTitle("Выбрать", for: .normal)
        selectIngridientsButton.backgroundColor = .orange
        selectIngridientsButton.frame = CGRect(x: 25, y: 650, width: 350, height: 55)
        selectIngridientsButton.layer.cornerRadius = 10
        selectIngridientsButton.addTarget(self, action: #selector(toOrderDetailsAction), for: .touchUpInside)
        view.addSubview(selectIngridientsButton)
    }
    
    private func additionalIngridients() {
        pizza.mozarella = mozarellaSwitch.isOn
        pizza.ham = hamSwitch.isOn
        pizza.mashrooms = mashroomSwitch.isOn
        pizza.olives = oliveSwitch.isOn
    }
    
    private func configurateCaloriesButton() {
        caloriesInfoButton.setBackgroundImage(UIImage(systemName: "info.circle"), for: .normal)
        caloriesInfoButton.frame = CGRect(x: 330, y: 27, width: 30, height: 30)
        caloriesInfoButton.tintColor = .orange
        caloriesInfoButton.addTarget(self, action: #selector(toCaloriesInfoAction(_:)), for: .touchUpInside)
        view.addSubview(caloriesInfoButton)
    }
        
    private func setupUI() {
        view.backgroundColor = .white
        
        configuratePizzaImageView()
        configuratePizzaLabel()
        configurateMozarellaLabel()
        configurateMozarellaSwitch()
        configurateHamLabel()
        configurateHamSwitch()
        configurateMashroomLabel()
        configurateMashroomSwitch()
        configurateOliveLabel()
        configurateOliveSwitch()
        configurateSelectIngridientsButton()
        configurateCaloriesButton()
    }
}

// MARK: - для перехода на второй экран
extension IngridientsViewController: PopToRootDelegate {
    func goToRootViewController() {
        if let presentingViewController = presentingViewController as? UINavigationController {
            view.isHidden = true
            dismiss(animated: false)
            presentingViewController.popToRootViewController(animated: false)
        }
    }
}
