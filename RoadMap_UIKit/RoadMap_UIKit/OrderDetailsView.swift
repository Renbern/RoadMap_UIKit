//
//  OrderDetailsView.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 23.09.2022.
//

import UIKit

/// Второй экран приложения
class OrderDetailsView: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Cafe Bistro"
    }
    
    // Переносит на экран чека
    @IBAction func getCheckButtonAction(_ sender: Any) {
        let alertController = UIAlertController(title: "Выставить чек?", message: "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            let getCheck = UIStoryboard(name: "Main", bundle: nil)
            guard let vc = getCheck.instantiateViewController(
                withIdentifier: "CheckViewController"
            ) as? CheckViewController else {
                return
            }
            self.show(vc, sender: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // Доп функция, переводит на экран заказа доставки
    @IBAction func deliveryButtonAction(_ sender: Any) {
        let delivery = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = delivery.instantiateViewController(withIdentifier: "OrderDelivery") as? OrderDelivery
        else {
            return
        }
        self.show(vc, sender: nil)
    }
}
