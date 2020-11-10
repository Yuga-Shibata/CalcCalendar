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
        let calendar = CalendarCalc()
        let now     =  calendar.getNowDate()
        print(now)
        print(type(of: now.date))
        let days    = calendar.getMonthOfDays(year: now.year!, month: now.month!)
        print(days)
        let weekDay = ["日", "月", "火", "水", "木", "金", "土"]
        let week = weekDay[calendar.getWeekday(year: now.year!, month: now.month!)]
        print(week)
        let later = calendar.getMonthLater(DateComponent: now, Later: 13)
        print(later)
    }
}
