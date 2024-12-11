//
//  SecondViewModel.swift
//  RxSwift-MVVM-C
//
//  Created by 市東 on 2024/12/11.
//

import RxSwift
import RxCocoa

protocol SecondViewModelInputs {
}

protocol SecondViewModelOutputs {
}

protocol SecondViewModelType {
    var inputs: SecondViewModelInputs { get }
    var outputs: SecondViewModelOutputs { get }
}

class SecondViewModel: SecondViewModelInputs, SecondViewModelOutputs, SecondViewModelType {

    // MARK: - Inject Properties

    // MARK: - Input Streams
    // Behavior or Publish (Behavior→過去の値も流れる,Publish→過去を保持しない)(Subject→エラーも取れる,Relay→値だけ)

    // MARK: - Output Streams
    // Driver or Signal (Driver→過去の値も流れる,Signal→過去を保持しない)(エラーがない)

    // MARK: - Relays

    // MARK: - Types
    // こうすることでinputs.〇〇,outputs.〇〇のようにできる
    var inputs: SecondViewModelInputs { self }
    var outputs: SecondViewModelOutputs { self }

    // MARK: - Private Properties
    private let disposeBag = DisposeBag()

    init() {
        // Driver/Signal = Relay .asDriver() / .asSignal()
    }
}
