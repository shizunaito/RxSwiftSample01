//
//  ViewController.swift
//  RxSwiftSample01
//
//  Created by 伊藤静那(Ito Shizuna) on 2018/01/04.
//  Copyright © 2018年 ShizunaIto. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    let disposeBag = DisposeBag()

    enum State: Int {
        case useButtons
        case useTextField
    }

    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var stateSegmentedControl: UISegmentedControl!
    @IBOutlet weak var greetingsTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet var greetingButtons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()

        let nameObservable: Observable<String?> = nameTextField.rx.text.asObservable()
        let customGreetingObservable: Observable<String?> = greetingsTextField.rx.text.asObservable()

        let greetingWithNameObservable: Observable<String> = Observable.combineLatest(nameObservable, customGreetingObservable) { (string1: String?, string2: String?) in
            return string1! + "," + string2!
        }

        greetingWithNameObservable.bind(to: greetingLabel.rx.text).disposed(by: disposeBag)

        let segmentedControlObservable: Observable<Int> = stateSegmentedControl.rx.value.asObservable()
        let stateObservable: Observable<State> = segmentedControlObservable.map { (selectedIndex: Int) -> State in
            return State(rawValue: selectedIndex)!
        }
        let greetingTextFieldEnabledObservable: Observable<Bool> = stateObservable.map { (state: State) -> Bool in
            return state == .useTextField
        }

        greetingTextFieldEnabledObservable.bind(to: greetingsTextField.rx.isEnabled).disposed(by: disposeBag)

        let greetingButtonsEnabledObservable: Observable<Bool> = greetingTextFieldEnabledObservable.map { (greetingEnabled: Bool) -> Bool in
            return !greetingEnabled
        }

        greetingButtons.forEach { button in
            greetingButtonsEnabledObservable.bind(to: button.rx.isEnabled).disposed(by: disposeBag)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

