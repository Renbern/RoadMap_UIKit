//
//  PizzaChoiseViewController.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 28.09.2022.
//

import UIKit

// выбирает пиццу
class PizzaChoiseViewController: UIViewController {
    
    // MARK: - UI Elements
    var pizza: [Pizza] = [
        Pizza(
            name: "Пепперони",
            pizzaImage: "pepperoni",
            mozarella: false,
            ham: false,
            mashrooms: false,
            olives: false),
        Pizza(
            name: "Маргарита",
            pizzaImage: "margarita",
            mozarella: false,
            ham: false,
            mashrooms: false,
            olives: false
        )]
    
    let pepperoniImageView = UIImageView()
    
    let pepperoniLabel = UILabel()
    
    let margaritaImageView = UIImageView()
    
    let margaritaLabel = UILabel()
    
    let selectPepperoniButton = UIButton()
    
    let selectMargaritaButton = UIButton()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private methods
    func configuratePepperoniImage() {
        pepperoniImageView.image = UIImage(named: pizza[0].pizzaImage ?? "")
        pepperoniImageView.frame = CGRect(x: 25, y: 200, width: 100, height: 100)
        view.addSubview(pepperoniImageView)
    }
    
    func configuratePepperoniLabel() {
        pepperoniLabel.text = pizza[0].name
        pepperoniLabel.font = .systemFont(ofSize: 25, weight: .medium)
        pepperoniLabel.textColor = .black
        pepperoniLabel.frame = CGRect(
            x: pepperoniImageView.frame.maxX + 20,
            y: pepperoniImageView.frame.midY - 25,
            width: 150,
            height: 50
        )
        view.addSubview(pepperoniLabel)
    }
    
    func configurateMargaritaImage() {
        margaritaImageView.image = UIImage(named: pizza[1].pizzaImage ?? "")
        margaritaImageView.frame = CGRect(x: 25, y: 380, width: 100, height: 100)
        view.addSubview(margaritaImageView)
    }
    
    func configurateMargaritaLabel() {
        margaritaLabel.text = pizza[1].name
        margaritaLabel.font = .systemFont(ofSize: 25, weight: .medium)
        margaritaLabel.textColor = .black
        margaritaLabel.frame = CGRect(
            x: margaritaImageView.frame.maxX + 20,
            y: margaritaImageView.frame.midY - 25,
            width: 150,
            height: 50
        )
        view.addSubview(margaritaLabel)
    }
    
    func configurateSelectPepperoniButton() {
        selectPepperoniButton.tintColor = .orange
        selectPepperoniButton.setBackgroundImage(UIImage(systemName: "plus.app.fill"), for: .normal)
        selectPepperoniButton.frame = CGRect(
            x: pepperoniLabel.frame.maxX + 35,
            y: pepperoniLabel.frame.midY - 15,
            width: 45,
            height: 35
        )
        selectPepperoniButton.addTarget(self, action: #selector(toIngridientsAction(_:)), for: .touchUpInside)
        view.addSubview(selectPepperoniButton)
    }
    
    func configurateSelectMargaritaButton() {
        selectMargaritaButton.tintColor = .orange
        selectMargaritaButton.setBackgroundImage(UIImage(systemName: "plus.app.fill"), for: .normal)
        selectMargaritaButton.frame = CGRect(
            x: margaritaLabel.frame.maxX + 35,
            y: margaritaLabel.frame.midY - 15,
            width: 45,
            height: 35
        )
        selectMargaritaButton.addTarget(
            self,
            action: #selector(toIngridientsAction(_:)),
            for: .touchUpInside)
        view.addSubview(selectMargaritaButton)
    }
    
    func setupButtonTag() {
        selectPepperoniButton.tag = 0
        selectMargaritaButton.tag = 1
    }
    
    @objc func toIngridientsAction(_ sender: UIButton) {
        let ingridientsVC = IngridientsViewController()
        switch sender.tag {
        case 0...1:
            ingridientsVC.pizza.pizzaImage = pizza[sender.tag].pizzaImage
            ingridientsVC.pizza.name = pizza[sender.tag].name
            ingridientsVC.modalPresentationStyle = .formSheet
            present(ingridientsVC, animated: true)
        default:
            break
        }
    }
    
    func customBackButton() {
        let backButton = UIBarButtonItem()
        backButton.image = UIImage(systemName: "chevron.left")
        backButton.tintColor = .black
        navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
    
    func setupUI() {
        view.backgroundColor = .white
        title = "Pizza"
        
        configuratePepperoniImage()
        configuratePepperoniLabel()
        configurateMargaritaImage()
        configurateMargaritaLabel()
        configurateSelectPepperoniButton()
        configurateSelectMargaritaButton()
        setupButtonTag()
        customBackButton()
    }
}
