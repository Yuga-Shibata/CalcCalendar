//
//  ViewController.swift
//  暦の計算
//
//  Created by 柴田優河 on 2020/09/02.
//  Copyright © 2020 Makoto Shibata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var calendar = Calendar(identifier: .gregorian) // グレゴリオ暦
    var futureDateArray:Array = [String]() // 未来の日付
    var pastDateArray:Array = [String]() // 過去の日付
    var baseDate = Date()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DateInit() // Date設定の初期化
        getFutureDate()
        getPastDate()
    }
    
    func DateInit() {
        // 現在の日時を取得する
        let dateformatter = DateFormatter()
        // 書式とロケールを設定
        dateformatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yMMMd", options: 0, locale: Locale(identifier: "ja_JP"))
        // 文字列型に変換
        let baseDateText = dateformatter.string(from: Date())
        
    }
    
    // 基準日時から、1年後までの日時を取得して、リストに格納する
    func getFutureDate() {
        // 基準の日時を生成（2020年4月10日 21:00:00）
        let baseDate = calendar.date(from: DateComponents(year: 2020, month: 4, day: 10, hour: 21, minute: 0, second: 0))!
        // 基準日時の5時間30分後を算出（加算）
        let resultDate1 = calendar.date(byAdding: DateComponents(hour: 5, minute: 30), to: baseDate)
        // 基準日時の20日前を算出（減算）
        let resultDate2 = calendar.date(byAdding: DateComponents(day: -20), to: baseDate)
    }
    // 基準日時から、1年前までの日時を取得して、リストに格納する
    func getPastDate() {
        for i in 1...365 {
            // 現在の日時を取得する
            let dateformatter = DateFormatter()
            // 書式とロケールを設定
            dateformatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yMMMd", options: 0, locale: Locale(identifier: "ja_JP"))
            // 基準日時の1日後、2日後、3日後...を算出（加算）
            let pastDates = dateformatter.string(from: Date())
//            print()
            pastDateArray.append(pastDates) // 0~364までの要素（365個）
        }

    }
}
