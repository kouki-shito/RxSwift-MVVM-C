//
//  SceneDelegate.swift
//  RxSwift-MVVM-C
//
//  Created by 市東 on 2024/12/08.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    private var coordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        let appCoordinator = AppCoordinator(window: window)
        appCoordinator.start()
        self.coordinator = appCoordinator

    }

}
