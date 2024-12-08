//
//  SecondViewCoordinator.swift
//  RxSwift-MVVM-C
//
//  Created by 市東 on 2024/12/09.
//

import Foundation
import UIKit

final class SecondViewCoordinator: Coordinator {

    private let navigator: UINavigationController
    private var secondViewController: SecondViewController?

    init(navigator: UINavigationController) {
        self.navigator = navigator
    }

    func start() {
        let vc = SecondViewController.instantiate(name: "SecondView")
        navigator.pushViewController(vc, animated: true)
        secondViewController = vc
    }

}
