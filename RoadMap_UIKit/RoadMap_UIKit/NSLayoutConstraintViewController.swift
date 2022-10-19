//
//  NSLayoutConstraintViewController.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 15.10.2022.
//

import UIKit

// Экран светофора с констрейнтами NSLayoutConstraint
final class NSLayoutConstraintViewController: UIViewController {
    
    // MARK: - Constants
    private enum Constants {
        static let titleName = "NSLayoutConstraint"
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
        createYellowViewConstraint()
        createRedViewConstraint()
        createGreenViewConstraint()
        createBlackViewConstraint()
    }
    
    private func createYellowViewConstraint() {
        NSLayoutConstraint(item: yellowView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: yellowView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerY,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: yellowView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .height,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: yellowView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .height,
                           multiplier: 0.23,
                           constant: 0).isActive = true
    }
    
    private func createRedViewConstraint() {
        NSLayoutConstraint(item: redView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: redView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .centerY,
                           multiplier: 0.5,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: redView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: redView,
                           attribute: .height,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: redView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .height,
                           multiplier: 1,
                           constant: 0).isActive = true
    }
    
    private func createGreenViewConstraint() {
        NSLayoutConstraint(item: greenView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: greenView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .centerY,
                           multiplier: 1.5,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: greenView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: greenView,
                           attribute: .height,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: greenView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .height,
                           multiplier: 1,
                           constant: 0).isActive = true
    }
    
    private func createBlackViewConstraint() {
        NSLayoutConstraint(item: blackView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: blackView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .centerY,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: blackView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .width,
                           multiplier: 1.13333,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: blackView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: blackView,
                           attribute: .width,
                           multiplier: 2.9,
                           constant: 0).isActive = true
    }
    
}
