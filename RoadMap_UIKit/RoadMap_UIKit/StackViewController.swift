//
//  StackViewController.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 16.10.2022.
//

import UIKit

/// Экран светофора с использованием Stack View
final class StackViewController: UIViewController {

    // MARK: - Private properties
    private let redView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemRed
        return view
    }()
    
    private let yellowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemYellow
        return view
    }()
    
    private let greenView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGreen
        return view
    }()
    
    private lazy var colorStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [redView, yellowView, greenView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.backgroundColor = .black
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
    }
    
    /// Перерисовка расстояний между цветами
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupSpacing()
    }
    
    // MARK: - Private methods
    private func setupStackView() {
        title = "StackViewController"
        view.addSubview(colorStackView)
        colorStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8).isActive = true
        colorStackView.widthAnchor.constraint(equalTo: colorStackView.heightAnchor, multiplier: 1/3).isActive = true
        colorStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        colorStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func setupSpacing() {
        let metric = view.frame.height / 60
        colorStackView.spacing = metric
        colorStackView.layoutMargins = UIEdgeInsets(top: metric, left: metric, bottom: metric, right: metric)
        colorStackView.isLayoutMarginsRelativeArrangement = true
    }
}
