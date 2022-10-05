//
//  ViewController.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 21.09.2022.

import UIKit

// Стартовый экран приложения
final class StopWatchViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    // MARK: - Visual Components
    // MARK: - Public properties
    // MARK: - Private properties
    var timer = Timer()
    var isTimerRunning = false
    var counter = 0.0
    // MARK: - Initializers
    // MARK: - Constants
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // MARK: - Public methods
    // MARK: - IBActions
    
    @IBAction func startButtonAction(_ sender: Any) {
        if !isTimerRunning {
            startButton.setTitle("Pause", for: .normal)
            timer = Timer.scheduledTimer(
                timeInterval: 0.1,
                target: self,
                selector: #selector(runTimerAction),
                userInfo: nil,
                repeats: true
            )
            startButton.tintColor = .red
            isTimerRunning = true
            stopButton.isEnabled = true
            startButton.isEnabled = true
        } else {
            startButton.setTitle("Start", for: .normal)
            startButton.tintColor = .systemGreen
            isTimerRunning = false
            timer.invalidate()
        }
    }
    
    @IBAction func stopButtonAction(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
        counter = 0.0
        
        timeLabel.text = "00:00:00.0"
        
        stopButton.isEnabled = false
        startButton.isEnabled = true
        startButton.setTitle("Start", for: .normal)
        startButton.tintColor = .systemGreen
    }
    
    // MARK: - Private methods
    
    @objc private func runTimerAction() {
        counter += 0.1
        let flooredCounter = Int(Float(counter))
        let hour = flooredCounter / 3600
        let minute = (flooredCounter % 3600) / 60
        var minuteString = "\(minute)"
        if minute < 10 {
            minuteString = "0\(minute)"
        }
        let second = (flooredCounter % 3600) % 60
        var secondString = "\(second)"
        if second < 10 {
            secondString = "0\(second)"
        }
        
        let decimalSecond = String(format: "%.1f", counter).components(separatedBy: ".").last
        timeLabel.text = "\(hour):\(minuteString):\(secondString).\(decimalSecond ?? "0")"
    }
    
    private func setupUI() {
        stopButton.isEnabled = false
        startButton.isEnabled = true
        
    }
    // MARK: - Types
}
