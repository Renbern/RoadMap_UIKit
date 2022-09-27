//
//  ProductListViewController.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 26.09.2022.
//

import UIKit

/// выбирает продукт для аренды
class ProductViewController: UIViewController {
    
    // Конфигурация элементов UI
    let firstProductNameLabel: UILabel = {
        let product = UILabel()
        product.text = "Cyberpunk 2077"
        product.font = .systemFont(ofSize: 15, weight: .heavy)
        product.frame = CGRect(x: 25, y: 355, width: 150, height: 25)
        return product
    }()
    
    let secondProductNameLabel: UILabel = {
        let product = UILabel()
        product.text = "It takes two"
        product.font = .systemFont(ofSize: 15, weight: .heavy)
        product.frame = CGRect(x: 25, y: 650, width: 150, height: 25)
        return product
    }()
    
    private lazy var firstProductImageButton: UIButton = {
        let image = UIButton()
        image.setBackgroundImage(UIImage(named: "Cyberpunk2077_PS4"), for: .normal)
        image.frame = CGRect(x: 25, y: 145, width: 150, height: 200)
        image.addTarget(self, action: #selector(toProductDetailsAction), for: .touchUpInside)
        return image
    }()
    
    private lazy var secondProductImageButton: UIButton = {
        let image = UIButton()
        image.setBackgroundImage(UIImage(named: "ItTakesTwo_PS4"), for: .normal)
        image.frame = CGRect(x: 25, y: 445, width: 150, height: 200)
        image.addTarget(self, action: #selector(showNotAvailableAlertAction), for: .touchUpInside)
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    // переход на экран с деталями заказа
    @objc func toProductDetailsAction() {
        let productDetails = ProductDetailsViewController()
        productDetails.modalPresentationStyle = .formSheet
        self.present(productDetails, animated: true, completion: nil)
    }
    
    @objc func showNotAvailableAlertAction() {
        let alertController = UIAlertController(
            title: "Игры нет в налиции :(",
            message: "Выберите другую позицию",
            preferredStyle: .alert
        )
        let showNotAvailableAlertControllerOkAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(showNotAvailableAlertControllerOkAction)
        present(alertController, animated: true)
    }
    
    func setupUI() {
        view.addSubview(firstProductNameLabel)
        view.addSubview(firstProductImageButton)
        view.addSubview(secondProductNameLabel)
        view.addSubview(secondProductImageButton)
    }
}
