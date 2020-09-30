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
//        getFutureDate()
        getPastDate()
    }
    
    func DateInit() {
        calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "Asia/Tokyo")! // タイムゾーンを設定
        calendar.locale = Locale(identifier: "ja") // ロケール（地域）を設定
        // 基準となる現在の日時を取得する
        baseDate = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date())
        print("現在時刻                 ：" + String(baseDate.year!) + "年" + String(baseDate.month!) + "月" + String(baseDate.day!) + "日")
    }
    
    // 基準日時から、1年後までの日時を取得して、リストに格納する
    func getFutureDate() {
        var roopDay = Int()
        // うるう年の場合
        if baseDate.year! % 2 == 0 {
            roopDay = 366
        } else if baseDate.year! % 2 == 1 {
            roopDay = 365
        }
        
        for i in 1...roopDay {
            // 基準日時から算出（加算）
            var futureDate = baseDate
            futureDate.day = futureDate.day! + i
            // 繰り上げ処理
            while true{
                // 31日: 1, 3, 5, 7, 8, 10, 12月
                if (futureDate.month == 1 && futureDate.day! > 31) ||  (futureDate.month == 3 && futureDate.day! > 31) || (futureDate.month == 5 && futureDate.day! > 31) || (futureDate.month == 7 && futureDate.day! > 31) || (futureDate.month == 8 && futureDate.day! > 31) || (futureDate.month == 10 && futureDate.day! > 31) || (futureDate.month == 12 && futureDate.day! > 31) {
                    futureDate.day = futureDate.day! - 31 // 日数を減算
                    futureDate.month = futureDate.month! + 1 // 月に繰り上げ
                    // 月の繰り上げ処理
                    if (futureDate.month! > 12) {
                        futureDate.month = 1 // 月をリセット
                        futureDate.year = futureDate.year! + 1 // 年に繰り上げ
                    }
                }
                // 日数が31日以下になったら無限ループを抜ける
                if (futureDate.month == 1 && futureDate.day! <= 31) ||  (futureDate.month == 3 && futureDate.day! <= 31) || (futureDate.month == 5 && futureDate.day! <= 31) || (futureDate.month == 7 && futureDate.day! <= 31) || (futureDate.month == 8 && futureDate.day! <= 31) || (futureDate.month == 10 && futureDate.day! <= 31) || (futureDate.month == 12 && futureDate.day! <= 31) {
                    break
                }
                // 30日: 4, 6, 9, 11
                if (futureDate.month == 4 && futureDate.day! > 30) || (futureDate.month == 6 && futureDate.day! > 30) || (futureDate.month == 9 && futureDate.day! > 30) || (futureDate.month == 11 && futureDate.day! > 30) {
                    futureDate.day = futureDate.day! - 30 // 日数を減算
                    futureDate.month = futureDate.month! + 1 // 月に繰り上げ
                    // 月の繰り上げ処理
                    if (futureDate.month! > 12) {
                        futureDate.month = 1 // 月をリセット
                        futureDate.year = futureDate.year! + 1 // 年に繰り上げ
                    }
                }
                // 日数が30日以下になったら無限ループを抜ける
                if (futureDate.month == 4 && futureDate.day! <= 30) || (futureDate.month == 6 && futureDate.day! <= 30) || (futureDate.month == 9 && futureDate.day! <= 30) || (futureDate.month == 11 && futureDate.day! <= 30)  {
                    break
                }
                // 29日(うるう年): 2月
                if (futureDate.year! % 4 == 0) && (futureDate.month == 2) && (futureDate.day! > 29) {
                    futureDate.day = futureDate.day! - 29 // 日数を減算
                    futureDate.month = futureDate.month! + 1 // 月に繰り上げ
                    // 月の繰り上げ処理
                    if (futureDate.month! > 12) {
                        futureDate.month = 1 // 月をリセット
                        futureDate.year = futureDate.year! + 1 // 年に繰り上げ
                    }
                }
                // 日数が29日以下になったら無限ループを抜ける
                if (futureDate.year! % 4 == 0) && (futureDate.month == 2) && (futureDate.day! <= 29) {
                    break
                }
                // 28日（非うるう年): 2月
                if  (futureDate.year! % 4 == 1) && (futureDate.month == 2) && (futureDate.day! > 28) {
                    futureDate.day = futureDate.day! - 28 // 日数を減算
                    futureDate.month = futureDate.month! + 1 // 月に繰り上げ
                    // 月の繰り上げ処理
                    if (futureDate.month! > 12) {
                        futureDate.month = 1 // 月をリセット
                        futureDate.year = futureDate.year! + 1 // 年に繰り上げ
                    }
                }
                // 日数が28日以下になったら無限ループを抜ける
                if (futureDate.year! % 4 == 1) && (futureDate.month == 2) && (futureDate.day! <= 28) {
                    break
                }
            }
            print("基準日時の\(i)日後を算出（加算）：" + String(futureDate.year!) + "年" + String(futureDate.month!) + "月" + String(futureDate.day!) + "日")
        }
    }
    // 基準日時から、1年前までの日時を取得して、リストに格納する
    func getPastDate() {
        var roopDay = Int()
        var pastDate = DateComponents()
        var returnday = Int()
        if baseDate.year! % 2 == 1 {
            roopDay = 365
        } else if baseDate.year! % 2 == 0 {
            roopDay = 366
        }
        for i in 1...roopDay {
            pastDate = baseDate
            returnday = pastDate.day! - i
            while true {
                if returnday <= 0 {
                    // 月を繰り下げる
                    pastDate.month = pastDate.month! - 1
                    if pastDate.month == 0 {
                        // 年を繰り下げる
                        pastDate.year = pastDate.year! - 1
                        // 月を最終月にセット
                        pastDate.month = 12
                    }
                    // 日をその月の最終日に更新
                    pastDate.day = getDayOfMonth(year: pastDate.year!, month: pastDate.month!)
                    if returnday < 0 {
                        // returndayを更新
                        returnday = pastDate.day! + returnday
                        if returnday > 0 && returnday <= pastDate.day! {
                            pastDate.day = returnday
                            returnday = 0
                        } else if returnday == 0 {
                            pastDate.month! -= 1
                            if pastDate.month == 0 {
                                // 年を繰り下げる
                                pastDate.year = pastDate.year! - 1
                                // 月を最終月にセット
                                pastDate.month = 12
                            }
                            // 日をその月の最終日に更新
                            pastDate.day = getDayOfMonth(year: pastDate.year!, month: pastDate.month!)
                        }
                    }
                }
                if returnday > 0 {
                    pastDate.day = returnday
                    returnday = 0
                }
                if returnday == 0 {
                    print("基準日時の\(i)日前を算出（減算）：" + String(pastDate.year!) + "年" + String(pastDate.month!) + "月" + String(pastDate.day!) + "日")
                    break
                }
            }
        }
    }
    // 関数定義
    // 月に応じて、その月の日数を返却する関数
    func getDayOfMonth(year:Int, month:Int) -> Int {
        let Judgemonth = month % 2
        switch month {
        case 1:
            return 31
        case 2:
            switch Judgemonth {
            case 1: // 非うるう年
                return 28
            case 0: // うるう年
                return 29
            default: // エラーコード
                print("値を検出できませんでした。")
                return 100
            }
            
        case 3:
            return 31
        case 4:
            return 30
        case 5:
            return 31
        case 6:
            return 30
        case 7:
            return 31
        case 8:
            return 31
        case 9:
            return 30
        case 10:
            return 31
        case 11:
            return 30
        case 12:
            return 31
        default: // エラーコード
            print("値を検出できませんでした。")
            return 101
        }
    }
}
