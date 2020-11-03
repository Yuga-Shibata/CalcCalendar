//
//  ViewController.swift
//  暦の計算
//
//  Created by 柴田優河 on 2020/09/02.
//  Copyright © 2020 Makoto Shibata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dayLabel: UILabel!
    var calccalendar = CalendarCalc()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let array = calccalendar.get2year()
        // 値の取り出し
        for i in 0...array[0].count - 1 {
            print(array[0][i], array[1][i])
        }
    }
}
