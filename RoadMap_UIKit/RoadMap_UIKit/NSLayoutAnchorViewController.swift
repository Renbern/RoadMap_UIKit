//
//  NSLayoutAnchorViewController.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 16.10.2022.
//

import UIKit

/// Экран свертофора с якорями
final class NSLayoutAnchorViewController: UIViewController {

    // MARK: - Constants
    private enum Constants {
        static let titleName = "NSLayoutAnchor"
    }
    
    // MARK: - Private visual elements 
    private let blackView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
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
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private methods
    private func setupUI() {
        title = Constants.titleName
        view.addSubview(blackView)
        view.addSubview(yellowView)
        view.addSubview(redView)
        view.addSubview(greenView)
        configurateConstraints()
    }
    
    private func configurateConstraints() {
        createYellowViewAnchor()
        createRedViewAnchor()
        createGreenViewAnchor()
        createBlackViewAnchor()
    }
    
    private func createYellowViewAnchor() {
        yellowView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        yellowView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        yellowView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.23).isActive = true
        yellowView.heightAnchor.constraint(equalTo: yellowView.widthAnchor).isActive = true
    }
    
    private func createRedViewAnchor() {
        redView.centerYAnchor.anchorWithOffset(
            to: yellowView.centerYAnchor).constraint(
                equalTo: yellowView.heightAnchor,
                multiplier: 1.1).isActive = true
        redView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        redView.widthAnchor.constraint(equalTo: yellowView.widthAnchor).isActive = true
        redView.heightAnchor.constraint(equalTo: redView.widthAnchor).isActive = true
    }
    
    private func createGreenViewAnchor() {
        greenView.centerYAnchor.anchorWithOffset(
            to: yellowView.centerYAnchor).constraint(
                equalTo: yellowView.heightAnchor,
                multiplier: -1.1).isActive = true
        greenView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        greenView.widthAnchor.constraint(equalTo: yellowView.widthAnchor).isActive = true
        greenView.heightAnchor.constraint(equalTo: redView.widthAnchor).isActive = true
    }
    
    private func createBlackViewAnchor() {
        blackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        blackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        blackView.widthAnchor.constraint(equalTo: yellowView.heightAnchor, multiplier: 1.13333).isActive = true
        blackView.heightAnchor.constraint(equalTo: blackView.widthAnchor, multiplier: 2.9).isActive = true
    }
}
