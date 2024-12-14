//
//  FirstViewTest.swift
//  RxSwift-MVVM-CTests
//
//  Created by 市東 on 2024/12/11.
//

import XCTest
import RxSwift
import RxCocoa
import RxBlocking
import RxTest

@testable import RxSwift_MVVM_C

final class FirstViewTests: XCTestCase {
    
    var scheduler: TestScheduler!
    var disposeBag: DisposeBag!
    var vm: FirstViewModelType!
    var vc: FirstViewController!

    override func setUp() {
        super.setUp()
        vm = FirstViewModel()
        vc = FirstViewController()
        scheduler = TestScheduler(initialClock: 0)
        disposeBag = DisposeBag()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testButtonTapLogic() {
        let toSecondView = scheduler.createObserver(Bool.self)
        // Event<Void> は Not Equaltablなのでtrueに変換
        // vcのprivate methods は必要でなければTestしなくてOK
        vm.outputs.toSecondView
            .map({ true })
            .emit(to: toSecondView)
            .disposed(by: disposeBag)
        scheduler.createColdObservable([.next(10, ()),.next(20, ()),.next(30, ())])
            .bind(to: vm.inputs.buttonTapped)
            .disposed(by: disposeBag)
        scheduler.start()
        XCTAssertEqual(toSecondView.events, [.next(10, true), .next(20, true), .next(30, true)])
    }
}
