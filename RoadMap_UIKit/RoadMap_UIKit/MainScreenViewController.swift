//
//  ViewController.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 21.09.2022.
//

import UIKit

/// Модуль для работы проигрывателя
import AVFoundation

/// Контроллер основного экрана 
class MainScreenViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func radioheadSelectAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let playerViewController = storyboard.instantiateViewController(
            identifier: "PlayerViewController") as? PlayerViewController else { return }
        playerViewController.songTitle = "Where I end and you begin"
        playerViewController.artist = "Radiohead"
        playerViewController.album = "Heil to the thief"
        playerViewController.track = "Radiohead - Where I end and you begin"
        playerViewController.albumImage.image = UIImage(named: "Heil to the thief")
        
        show(playerViewController, sender: nil)
    }
    
    @IBAction func pornofilmySelectAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let playerViewController = storyboard.instantiateViewController(
            identifier: "PlayerViewController") as? PlayerViewController else { return }
        playerViewController.songTitle = "Остров в океане"
        playerViewController.artist = "Пророк Санбой"
        playerViewController.album = "Лучшее"
        playerViewController.track = "Пророк Санбой - Остров в океане"
        playerViewController.albumImage.image = UIImage(named: "Лучшее")
        
        show(playerViewController, sender: nil)
    }
}
