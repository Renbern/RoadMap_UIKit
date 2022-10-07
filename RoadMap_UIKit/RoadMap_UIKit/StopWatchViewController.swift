//
//  ViewController.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 21.09.2022.

import UIKit

// StopWatch
final class StopWatchViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var startButton: UIButton!
    @IBOutlet private weak var stopButton: UIButton!

    // MARK: - Private properties
    private var timer = Timer()
    private var isTimerRunning = false
    private var counter = 0.0

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - IBActions
    @IBAction private func startButtonAction(_ sender: Any) {
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
    
    @IBAction private func stopButtonAction(_ sender: Any) {
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
}
