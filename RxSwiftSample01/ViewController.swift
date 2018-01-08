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

    enum State: Int {
        case useButtons
        case useTextField
    }

    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var stateSegmentedControl: UISegmentedControl!
    @IBOutlet weak var greetingsTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        let nameObservable: Observable<String?> = nameTextField.rx.text.asObservable()

        nameObservable.subscribe({ (event: Event<String?>) in
            switch event {
            case .completed: print("completed")
            case .error(_): print("error")
            case .next(let string): print(string)
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

