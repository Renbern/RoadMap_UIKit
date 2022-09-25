//
//  ViewController.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 21.09.2022.
//

import UIKit

/// Начальный экран приложения
class MainScreenViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //  кнопка переносит на экран деталей заказа
    @IBAction func signInAction(_ sender: Any) {
        let buttonSignIn = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = buttonSignIn.instantiateViewController(
            withIdentifier: "OrderDetailsView") as? OrderDetailsViewController
        else {
            return
        }
        self.show(vc, sender: nil)
    }
}
