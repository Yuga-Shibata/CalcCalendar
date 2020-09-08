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
        calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "Asia/Tokyo")! // タイムゾーンを設定
        calendar.locale = Locale(identifier: "ja") // ロケール（地域）を設定
    }
    
    // 基準日時から、1年後までの日時を取得して、リストに格納する
    func getFutureDate() {
        // 基準となる現在の日時を取得する
        var baseDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date())
      // 基準日時の5時間30分後を算出（加算）
        var resultDate1 = baseDate
        resultDate1.hour = baseDate.hour! + 5
        resultDate1.minute = baseDate.minute! + 30
        // 基準日時の1ヶ月前を算出（減算）
        var resultDate2 = baseDate
        resultDate2.month = baseDate.month! - 1
        print("現在時刻                    　 ：" + String(baseDate.year!) + "年" + String(baseDate.month!) + "月" + String(baseDate.day!) + "日" + String(baseDate.hour!) + "時" + String(baseDate.minute!) + "分" + String(baseDate.second!) + "秒")
        print("基準日時の5時間30分後を算出（加算）：" + String(resultDate1.year!) + "年" + String(resultDate1.month!) + "月" + String(resultDate1.day!) + "日" + String(resultDate1.hour!) + "時" + String(resultDate1.minute!) + "分" + String(resultDate1.second!) + "秒")
        print("基準日時の1ヶ月前を算出（減算）    ：" + String(resultDate2.year!) + "年" + String(resultDate2.month!) + "月" + String(resultDate2.day!) + "日" + String(resultDate2.hour!) + "時" + String(resultDate2.minute!) + "分" + String(resultDate2.second!) + "秒")
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
