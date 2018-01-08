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

    @IBOutlet var greetingButtons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

