//
//  ViewController.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 21.09.2022.

import UIKit

// Стартовый экран приложения
final class MainViewController: UIViewController {

    // MARK: - IBOutlets
    // MARK: - Visual Components

    private let editButton = UIButton()
    // MARK: - Public properties
    // MARK: - Private properties
    // MARK: - Initializers
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // MARK: - Public methods
    // MARK: - IBActions
    // MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .black
        setUnderlines()
        configurateEditButton()
    }
    
    private func configurateEditButton() {
        editButton.setTitle("Edit", for: .normal)
        editButton.frame = CGRect(x: 100, y: 200, width: 59, height: 59)
        editButton.backgroundColor = .red
        editButton.addTarget(self, action: #selector(createTabBarAction), for: .touchUpInside)
        view.addSubview(editButton)
    }
    
    @objc private func createTabBarAction() {
        let tabBarVC = UITabBarController()
        
        let mainVC = UINavigationController(rootViewController: LabelEditingViewController())
        let secondaryVC = UINavigationController(rootViewController: SecondViewController())
        
        mainVC.title = "Изменение текста"
        secondaryVC.title = "Другое"
        
        tabBarVC.setViewControllers([mainVC, secondaryVC], animated: false)
        
        let images = ["pencil", "star"]
        guard let items = tabBarVC.tabBar.items else {
            return
        }
        for item in 0..<items.count {
            items[item].image = UIImage(systemName: images[item])
        }
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
    }
    
    private func setUnderlines() {
    }
    // MARK: - Types
    // MARK: - Constants
}
