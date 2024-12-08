//
//  Coordinator.swift
//  RxSwift-MVVM-C
//
//  Created by 市東 on 2024/12/08.
//

import Foundation
import UIKit

protocol Coordinator {
    func start()
}

final class AppCoordinator: Coordinator {

    private let window: UIWindow
    private let navigator: UINavigationController
    private var firstViewCoordinator: FirstViewCoordinator

    init(window: UIWindow) {
        self.window = window
        navigator = .init()
        firstViewCoordinator = FirstViewCoordinator(navigator: navigator)
    }

    func start() {
        firstViewCoordinator.start()
        window.rootViewController = navigator
        window.makeKeyAndVisible()
    }
}
