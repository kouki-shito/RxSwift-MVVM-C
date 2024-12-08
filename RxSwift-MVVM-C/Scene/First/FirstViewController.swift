//
//  FirstViewController.swift
//  RxSwift-MVVM-C
//
//  Created by 市東 on 2024/12/08.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class FirstViewController: UIViewController,Storyboarded {
    
    @IBOutlet weak var nextButton: UIButton!
    
    //MARK: -Injection Properties
    private var viewModel: FirstViewModelType!

    //MARK: -Private Properties
    private let disposeBag = DisposeBag()

    func inject(viewModelInj: FirstViewModelType) {
        viewModel = viewModelInj
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }

    func bind(){
        nextButton.rx.tap
            .subscribe({ [weak self] _ in
                self?.viewModel.inputs.buttonTapped.accept(())
            }).disposed(by: disposeBag)
    }

}
