//
//  ViewController.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 21.09.2022.

import UIKit

// Стартовый экран приложения
final class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    // MARK: - Visual Components
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
        view.backgroundColor = .white
        
        setUnderlines()
    }
    
    private func setUnderlines() {
    }
    // MARK: - Types
    // MARK: - Constants
}
