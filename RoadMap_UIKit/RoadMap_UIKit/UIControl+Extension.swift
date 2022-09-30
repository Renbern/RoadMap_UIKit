//
//  UIControl+Extension.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 30.09.2022.
//

import UIKit

// MARK: - устанавливает нижнюю линию под элементом
extension UIControl {
    func setUnderLine() {
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor.gray.cgColor
        border.frame = CGRect(
            x: 0, y: self.frame.size.height - width,
            width: self.frame.size.width - 10,
            height: self.frame.size.height
        )
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
