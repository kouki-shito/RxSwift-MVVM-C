//
//  FirstViewCoordinator.swift
//  RxSwift-MVVM-C
//
//  Created by 市東 on 2024/12/08.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

final class FirstViewCoordinator: Coordinator {

    private let navigator: UINavigationController
    private var firstViewController: FirstViewController?
    private var viewModel: FirstViewModelType?
    private var disposeBag = DisposeBag()

    init(navigator: UINavigationController) {
        self.navigator = navigator
    }

    func start() {
        let vc = FirstViewController.instantiate(name: "FirstView")
        let vm = FirstViewModel()
        vc.inject(viewModelInj: vm)
        self.navigator.viewControllers = [vc] // RootVC only
        self.firstViewController = vc
        self.viewModel = vm
        bind()
    }

    func next() {
        let nextCoordinator = SecondViewCoordinator(navigator: self.navigator)
        nextCoordinator.start()
    }

    func bind() {
        viewModel?.outputs.toSecondView
            .emit(onNext: {
                self.next()
            }).disposed(by: disposeBag)
    }

}
