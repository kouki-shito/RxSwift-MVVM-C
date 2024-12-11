//
//  SecondViewController.swift
//  RxSwift-MVVM-C
//
//  Created by 市東 on 2024/12/11.
//

import UIKit
import RxSwift
import RxCocoa

class SecondViewController: UIViewController, Storyboarded {

    // MARK: - Injection Properties
    private var viewModel: SecondViewModelType!

    // MARK: - Private Properties
    private let disposeBag = DisposeBag()

    func inject(viewModelInj: SecondViewModelType) {
        viewModel = viewModelInj
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        send()
    }

    func bind() {
    }

    func send() {
    }

}
