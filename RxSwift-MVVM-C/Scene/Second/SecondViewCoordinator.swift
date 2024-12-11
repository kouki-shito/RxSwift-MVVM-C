//
//  SecondViewCoordinator.swift
//  RxSwift-MVVM-C
//
//  Created by 市東 on 2024/12/11.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

final class SecondViewCoordinator: Coordinator {

    private let navigator: UINavigationController
    private var secondViewController: SecondViewController?
    private var secondViewModel: SecondViewModelType?
    private var disposeBag = DisposeBag()

    init(navigator: UINavigationController) {
        self.navigator = navigator
    }

    func start() {
        let vc = SecondViewController.instantiate(name: "Second")
        let vm = SecondViewModel()
        vc.inject(viewModelInj: vm)
        self.navigator.pushViewController(vc, animated: true)
        self.secondViewController = vc
        self.secondViewModel = vm
        bind()
        send()
    }

    func bind() {
        // next(toC: ##ViewCoordinator(navigator: self.navigator))
    }

    func send() {
    }

    func next(toC: Coordinator) {
        let nextCoordinator = toC
        nextCoordinator.start()
    }

    func cancel() {
    }

}
