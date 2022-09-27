//
//  PlayerViewController.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 25.09.2022.
//

import UIKit

/// Модуль для работы проигрывателя
import AVFoundation

/// Проигрыватель
class PlayerViewController: UIViewController {
    var songTitle = String()
    var artist = String()
    var album = String()
    var player = AVAudioPlayer()
    var track = String()
    var albumImage = UIImageView()
    
    @IBOutlet weak var songTitleLabel: UILabel!
    
    @IBOutlet weak var artistLabel: UILabel!
    
    @IBOutlet weak var albumLabel: UILabel!
    
    @IBOutlet weak var albumPicture: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        songTitleLabel.text = songTitle
        artistLabel.text = artist
        albumLabel.text = album
        albumPicture.image = albumImage.image
        configurePlayer()
    }
    
    func configurePlayer() {
        do {
            if let audioPath = Bundle.main.path(forResource: track, ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(filePath: audioPath))
            }
        } catch {
            print("Error")
        }
        player.play()
    }
    
    // скрывает плеер
    @IBAction func dismissButtonAction(_ sender: UIButton) {
        
        dismiss(animated: true)
    }
    
    @IBAction func playPauseButtonAction(_ sender: UIButton) {
        guard player.isPlaying else {
            sender.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
            player.play()
            return
        }
        sender.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
        player.stop()
    }
}
