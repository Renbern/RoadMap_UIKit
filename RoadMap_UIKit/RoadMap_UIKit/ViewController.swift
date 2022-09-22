//
//  ViewController.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 21.09.2022.
//

import UIKit

/// Задаёт кнопку начала приложения
class HelloVC: UIViewController {
    
    let resultLabel: UILabel = {
        let text = UILabel()
        text.frame = CGRect(x: 100, y: 200, width: 100, height: 50)
        return text
    }()
    
    lazy var startButton: UIButton = {
        let start = UIButton()
        start.setTitle("Start", for: .normal)
        start.backgroundColor = .magenta
        start.setTitleColor(.white, for: .normal)
        start.frame = CGRect(x: 100, y: 100, width: 200, height: 60)
        start.addTarget(self, action: #selector(showHelloAlert), for: .touchUpInside)
        return start
    }()
    
    var hello = HelloStruct()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc func showHelloAlert() {
        let helloAlertController = UIAlertController(
            title: "leohl это судьба",
            message: "введите слово",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            guard let inputText = helloAlertController.textFields?.first?.text else {
                return
            }
            self.resultLabel.text = self.hello.fromLeohlToHello(input: inputText)
        }
        helloAlertController.addTextField()
        helloAlertController.addAction(okAction)
        self.present(helloAlertController, animated: true)
    }
    
    func setupUI() {
        view.addSubview(resultLabel)
        view.addSubview(startButton)
    }
    
}
