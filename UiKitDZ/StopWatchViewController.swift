//
//  ViewController.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 21.09.2022.
//

import UIKit

/// Экран таймера с всеми необходимыми функциями и с добавлением 0 к минутам и секундам
final class StopWatchViewController: UIViewController {
    // MARK: - Enum
    enum Constants {
        static let startLabel = "Start"
        static let pauseLabel = "Pause"
        static let stopButton = "Stop"
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var timerLabel: UILabel!
    @IBOutlet private weak var startButton: UIButton!
    @IBOutlet private weak var stopButton: UIButton!
    
    // MARK: - Private properties
    private var timer = Timer()
    private var isTimerRunning = false
    private var counter = 0
    // MARK: - Initializers
    // MARK: - Lifeсycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // MARK: - IBActions
    @IBAction private func startPauseAction(_ sender: Any) {
        if !isTimerRunning {
            timer = Timer.scheduledTimer(timeInterval: 1,
                                         target: self,
                                         selector: #selector(runTimer),
                                         userInfo: nil,
                                         repeats: true)
            isTimerRunning = true
            startButton.setTitle(Constants.pauseLabel, for: .normal)
        } else {
            timer.invalidate()
            startButton.setTitle(Constants.startLabel, for: .normal)
            isTimerRunning = false
        }
    }
    @IBAction private func stopButtonAction(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
        counter = 0
        timerLabel.text = "00:00:00"
        startButton.setTitle(Constants.startLabel, for: .normal)
    }
    
    // MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .white
        startButton.setTitle(Constants.startLabel, for: .normal)
        stopButton.setTitle(Constants.stopButton, for: .normal)
        
    }
    
    @objc private func runTimer() {
        counter += 1
        let hour = counter / 3600
        let minute = (counter % 3600) / 60
        var minutesString = "\(minute)"
        if minute < 10 {
            minutesString = "0\(minute)"
        }
        
        let second = (counter % 3600) % 60
        var secondsString = "\(second)"
        if second < 10 {
            secondsString = "0\(second)"
        }
        
        timerLabel.text = "\(hour):\(minutesString):\(secondsString)"
    }
}
