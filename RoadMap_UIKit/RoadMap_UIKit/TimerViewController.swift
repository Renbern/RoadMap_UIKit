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
    @IBOutlet weak var timerPicker: UIPickerView!
    
    // MARK: - Public properties
    var hour = 0
    var minutes = 0
    var seconds = 0

    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private methods
    private func setupUI() {
        setUnderlines()
        timerPicker.delegate = self
        timerPicker.dataSource = self
    }
    
    private func setUnderlines() {
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
        return timerPicker.frame.size.width / 4
    }
}
