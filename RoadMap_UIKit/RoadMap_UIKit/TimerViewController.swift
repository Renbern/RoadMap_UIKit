//
//  TimerViewController.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 01.10.2022.
//

import UIKit

/// Экран выбора времени таймера
final class TimerViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var timerPicker: UIPickerView!
    
    // MARK: - Public properties
    private var hour = 0
    private var minutes = 0
    private var seconds = 0

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private methods
    private func setupUI() {
        timerPicker.delegate = self
        timerPicker.dataSource = self
    }
}

// MARK: - UIPickerViewDelegate
extension TimerViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(row)"
        case 1:
            return "\(row)"
        case 2:
            return "\(row)"
        default:
            return ""
        }
    }
}

// MARK: - UIPickerViewDataSource
extension TimerViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 24
        case 1, 2:
            return 60
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        timerPicker.frame.size.width / 4
    }
}
