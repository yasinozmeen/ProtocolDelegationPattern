//
//  SceneDelegate.swift
//  ProtocolDelegationPattern-MVVM
//
//  Created by Kadir Yasin Özmen on 13.06.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {return}
        let window = UIWindow(windowScene: windowScene)
        let FirstVC = FirstVc()
        let navController = UINavigationController(rootViewController: FirstVC)
        window.rootViewController = navController
        self.window = window
        self.window?.makeKeyAndVisible()
    }
}

