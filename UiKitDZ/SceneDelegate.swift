//
//  SceneDelegate.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 21.09.2022.
//

import UIKit
/// SceneDelegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
var window: UIWindow?
    
    @objc func scene(_ scene: UIScene,
                     willConnectTo session: UISceneSession, options connectionOption: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
           window?.windowScene = windowScene
           window?.makeKeyAndVisible()
           let viewController = ViewController()
           let navViewController = UINavigationController(rootViewController: viewController)
           self.window?.rootViewController = navViewController
           
    }
}
