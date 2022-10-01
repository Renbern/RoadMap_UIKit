//
//  SceneDelegate.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 21.09.2022.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let applicationScene = (scene as? UIWindowScene) else { return }
        
        window?.windowScene = applicationScene
        window?.makeKeyAndVisible()
        
        let demonstrationViewController = MainViewController()
        let navigationController = UINavigationController(rootViewController: demonstrationViewController)
        demonstrationViewController.title = "Demostration Application"
        window?.rootViewController = navigationController
    }
}
