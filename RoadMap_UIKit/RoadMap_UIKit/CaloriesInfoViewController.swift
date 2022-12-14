//
//  CaloriesInfoViewController.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 30.09.2022.
//

import UIKit

/// экран показа калорий пиццы
class CaloriesInfoViewController: UIViewController {
    
    var pizza: Pizza?
    
    let pizzaLabel = UILabel()
    
    let caloriesLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        configuratePizzaLabel()
        configurateCaloriesLabel()
    }
    
    func configuratePizzaLabel() {
        pizzaLabel.text = pizza?.name
        pizzaLabel.frame = CGRect(x: 50, y: 100, width: 500, height: 50)
        pizzaLabel.font = .systemFont(ofSize: 45, weight: .heavy)
        view.addSubview(pizzaLabel)
    }
    
    func configurateCaloriesLabel() {
        if pizzaLabel.text == "Пепперони" {
            caloriesLabel.text = "1600 ккал\n 20 г. белков\n 164 г. жиров\n 530 г. углеводов"
        } else {
            caloriesLabel.text = "1200 ккал\n 16 г. белков\n 142 г. жиров\n 320 г. углеводов"
        }
        caloriesLabel.frame = CGRect(x: 50, y: 150, width: 200, height: 350)
        caloriesLabel.numberOfLines = 0
        view.addSubview(caloriesLabel)
    }
}
