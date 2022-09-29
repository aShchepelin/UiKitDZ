//
//  PlayerViewController.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 24.09.2022.
//
import AVFoundation
import UIKit
// Воспроизведение выбранной песни с рабочим слайдером и временем
class PlayerViewController: UIViewController {
 
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var playingFromAlbum: UILabel!
    @IBOutlet weak var songSlider: UISlider!
    @IBOutlet weak var currentPlayerValueLabel: UILabel!
    @IBOutlet weak var playerDurationLabel: UILabel!
    
    var song = Song(name: "", artist: "", albumImage: "", song: "")
    var player = AVAudioPlayer()
    var button = UIButton()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        artistLabel.text = song.artist
        songLabel.text = song.name
        albumImage.image = UIImage(named: song.albumImage)
        playingFromAlbum.text = song.artist
        configuratePlayer(trackName: song.song)
        songSlider.value = Float(player.currentTime)
        configuratePlayerDurationLabel()
        songSlider.maximumValue = Float(player.duration)
        createTimer()
    }
    
    func configuratePlayer(trackName: String) {
        do {
            if let audioPath = Bundle.main.path(forResource: song.song, ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                 player.play()
            }
            
        } catch {
            print("Error")
        }
        
    }
    
    @IBAction func closeAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func playButtonAction(_ sender: UIButton) {
            if player.isPlaying {
                sender.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
                player.pause()
            } else {
                sender.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
                player.play()
            }
            view.layoutIfNeeded()
        }
    
    func configuratePlayerDurationLabel() {
        var minutes = Int(player.duration / 60)
        let seconds = player.duration - Double(minutes * 60)
        var secondsString = seconds < 9.5 ? "0\(String(format: "%.0f", seconds))" : "\(String(format: "%.0f", seconds))"
        if secondsString == "60" {
            secondsString = "00"
            minutes += 1
        }
        playerDurationLabel.text = "\(minutes):\(secondsString)"
    }
    
}

/// Расширение для обозначения формата секунд и минут + таймер
extension PlayerViewController {
    @objc func updateTimer() {
        songSlider.value = Float(player.currentTime)
        var minutes = Int(player.currentTime / 60)
        let seconds = player.currentTime - Double(minutes * 60)
        var secondsString = seconds < 9.5 ? "0\(String(format: "%.0f", seconds))" : "\(String(format: "%.0f", seconds))"
        if secondsString == "60" {
            secondsString = "00"
            minutes += 1
        }
        currentPlayerValueLabel.text = "\(minutes):\(secondsString)"
    }
    
    func createTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 1/5, repeats: true) { [weak self]_ in
                self?.updateTimer()
            }
        }
    }
    
    }
