//
//  ViewController.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 21.09.2022.

import UIKit

// Стартовый экран приложения
final class ViewController: UIViewController {

    // MARK: - Constants
    private enum Constants {
        static let titleName = "Storyboard"
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.titleName
    }
}
