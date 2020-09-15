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
    var baseDate = DateComponents()

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
        // 基準となる現在の日時を取得する
        baseDate = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date())
        print("現在時刻                    　 ：" + String(baseDate.year!) + "年" + String(baseDate.month!) + "月" + String(baseDate.day!) + "日" + String(baseDate.hour!) + "時" + String(baseDate.minute!) + "分" + String(baseDate.second!) + "秒")
    }
    
    // 基準日時から、1年後までの日時を取得して、リストに格納する
    func getFutureDate() {
      // 基準日時の5時間30分後を算出（加算）
        var futureDate = baseDate
        futureDate.day = futureDate.day! + 153
        // 繰り上げ処理
        while true{
            // 31日: 1, 3, 5, 7, 8, 10, 12月
            if (futureDate.month == 1 && futureDate.day! > 31) ||  (futureDate.month == 3 && futureDate.day! > 31) || (futureDate.month == 5 && futureDate.day! > 31) || (futureDate.month == 7 && futureDate.day! > 31) || (futureDate.month == 8 && futureDate.day! > 31) || (futureDate.month == 10 && futureDate.day! > 31) || (futureDate.month == 12 && futureDate.day! > 31) {
                futureDate.day = 1 // 日数をリセット
                futureDate.month = futureDate.month! + 1 // 月に繰り上げ
                // 月の繰り上げ処理
                if (futureDate.month! > 12) {
                    futureDate.month = 1 // 月をリセット
                    futureDate.year = futureDate.year! + 1 // 年に繰り上げ
                }
                // 日数が31日以下になったら無限ループを抜ける
                if (futureDate.month == 1 && futureDate.day! <= 31) ||  (futureDate.month == 3 && futureDate.day! <= 31) || (futureDate.month == 5 && futureDate.day! <= 31) || (futureDate.month == 7 && futureDate.day! <= 31) || (futureDate.month == 8 && futureDate.day! <= 31) || (futureDate.month == 10 && futureDate.day! <= 31) || (futureDate.month == 12 && futureDate.day! <= 31) {
                    break
                }
            }
            // 30日: 4, 6, 9, 11
            if (futureDate.month == 4 && futureDate.day! > 30) || (futureDate.month == 6 && futureDate.day! > 30) || (futureDate.month == 9 && futureDate.day! > 30) || (futureDate.month == 11 && futureDate.day! > 30) {
                futureDate.day = 1 // 日数をリセット
                futureDate.month = futureDate.month! + 1 // 月に繰り上げ
                // 月の繰り上げ処理
                if (futureDate.month! > 12) {
                    futureDate.month = 1 // 月をリセット
                    futureDate.year = futureDate.year! + 1 // 年に繰り上げ
                }
                // 日数が30日以下になったら無限ループを抜ける
                if (futureDate.month == 4 && futureDate.day! <= 30) || (futureDate.month == 6 && futureDate.day! <= 30) || (futureDate.month == 9 && futureDate.day! <= 30) || (futureDate.month == 11 && futureDate.day! <= 30)  {
                    break
                }
            }
            // 29日(うるう年): 2月
            if (futureDate.year! % 4 == 0) || (futureDate.month == 2) || (futureDate.day! > 29) {
                futureDate.day = 1 // 日数をリセット
                futureDate.month = futureDate.month! + 1 // 月に繰り上げ
                // 月の繰り上げ処理
                if (futureDate.month! > 12) {
                    futureDate.month = 1 // 月をリセット
                    futureDate.year = futureDate.year! + 1 // 年に繰り上げ
                }
                // 日数が29日以下になったら無限ループを抜ける
                if (futureDate.year! % 4 == 0) || (futureDate.month == 2) || (futureDate.day! <= 29) {
                    break
                }
            }
            // 28日（非うるう年): 2月
            if  (futureDate.year! % 4 == 1) || (futureDate.month == 2) || (futureDate.day! > 28) {
                futureDate.day = 1 // 日数をリセット
                futureDate.month = futureDate.month! + 1 // 月に繰り上げ
                // 月の繰り上げ処理
                if (futureDate.month! > 12) {
                    futureDate.month = 1 // 月をリセット
                    futureDate.year = futureDate.year! + 1 // 年に繰り上げ
                }
                // 日数が28日以下になったら無限ループを抜ける
                if (futureDate.year! % 4 == 1) || (futureDate.month == 2) || (futureDate.day! <= 28) {
                    break
                }
            }
            
        }
        futureDate.minute = baseDate.minute! + 30
        print("基準日時の153日後を算出（加算）：" + String(futureDate.year!) + "年" + String(futureDate.month!) + "月" + String(futureDate.day!) + "日" + String(futureDate.hour!) + "時" + String(futureDate.minute!) + "分" + String(futureDate.second!) + "秒")
    }
    // 基準日時から、1年前までの日時を取得して、リストに格納する
    func getPastDate() {
        // 基準日時の5時間30分前を算出（減算）
        var pastDate = baseDate
        pastDate.hour = baseDate.hour! - 5
        pastDate.minute = baseDate.minute! - 30
        print("基準日時の5時間30分後を算出（加算）：" + String(pastDate.year!) + "年" + String(pastDate.month!) + "月" + String(pastDate.day!) + "日" + String(pastDate.hour!) + "時" + String(pastDate.minute!) + "分" + String(pastDate.second!) + "秒")
    }
}
