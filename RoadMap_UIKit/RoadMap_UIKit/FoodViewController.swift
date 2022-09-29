//
//  FoodViewController.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 28.09.2022.
//

import UIKit

/// экран выбора категории еды
class FoodViewController: UIViewController {
    
    let pizzaButton = UIButton()
    
    let sushiButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func configuratePizzaButton() {
        pizzaButton.setTitle("Пицца", for: .normal)
        pizzaButton.setTitleColor(.black, for: .normal)
        pizzaButton.layer.borderColor = UIColor.black.cgColor
        pizzaButton.layer.borderWidth = 1
        pizzaButton.addTarget(self, action: #selector(toPizzaChoise), for: .touchUpInside)
        pizzaButton.frame = CGRect(x: 20, y: 100, width: 350, height: 140)
        view.addSubview(pizzaButton)
    }
    
    func configurateSushiButton() {
        sushiButton.setTitle("Суши", for: .normal)
        sushiButton.setTitleColor(.black, for: .normal)
        sushiButton.layer.borderColor = UIColor.black.cgColor
        sushiButton.layer.borderWidth = 1
        sushiButton.frame = CGRect(x: 20, y: 270, width: 350, height: 140)
        view.addSubview(sushiButton)
    }
    
    @objc func toPizzaChoise() {
        let pizzaChoiseVC = PizzaChoiseViewController()
        pizzaChoiseVC.title = "Pizza"
        navigationController?.pushViewController(pizzaChoiseVC, animated: true)
    }
    
    func setupUI() {
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        
        configuratePizzaButton()
        configurateSushiButton()
    }
}
