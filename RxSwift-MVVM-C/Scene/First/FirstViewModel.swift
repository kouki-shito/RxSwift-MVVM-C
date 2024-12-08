//
//  FirstViewModel.swift
//  RxSwift-MVVM-C
//
//  Created by 市東 on 2024/12/08.
//

import Foundation
import RxSwift
import RxCocoa

protocol FirstViewModelInputs {
    var buttonTapped: PublishRelay<Void> { get }
}

protocol FirstViewModelOutputs {
    var toSecondView: Signal<Void> { get }
}

protocol FirstViewModelType {
    var inputs: FirstViewModelInputs { get }
    var outputs: FirstViewModelOutputs { get }
}

class FirstViewModel: FirstViewModelInputs, FirstViewModelOutputs, FirstViewModelType  {

    //MARK: -Inject Properties

    //MARK: -Input Streams
    // Behavior or Publish (Behavior→過去の値も流れる,Publish→過去を保持しない)(Subject→エラーも取れる,Relay→値だけ)
    var buttonTapped = PublishRelay<Void>()

    //MARK: -Output Streams
    // Driver or Signal (Driver→過去の値も流れる,Signal→過去を保持しない)(エラーがない)
    var toSecondView: Signal<Void>

    //MARK: -Relays
    var toSecondViewRelay = PublishRelay<Void>()

    //MARK: -Types
    var inputs: FirstViewModelInputs { return self } //こうすることでinputs.〇〇,outputs.〇〇のようにできる
    var outputs: FirstViewModelOutputs { return self }

    //MARK: -Private Properties
    private let disposeBag = DisposeBag()

    init(){
        //◯◯.asDriver() ....
        
        toSecondView = toSecondViewRelay.asSignal()

        buttonTapped
            .subscribe({ [weak self] _ in
                self?.toSecondViewRelay.accept(())
            }).disposed(by: disposeBag)


    }
}
