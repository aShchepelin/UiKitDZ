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
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectOptions: UIScene.ConnectionOptions) {
        let loginViewController = StartPageViewController()
        window?.rootViewController = loginViewController
        window?.backgroundColor = UIColor.white
    }
}
