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
        print("現在時刻                   ：" + String(baseDate.year!) + "年" + String(baseDate.month!) + "月" + String(baseDate.day!) + "日" + String(baseDate.hour!) + "時" + String(baseDate.minute!) + "分" + String(baseDate.second!) + "秒")
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
            print("基準日時の\(i)日後を算出（加算）：" + String(futureDate.year!) + "年" + String(futureDate.month!) + "月" + String(futureDate.day!) + "日" + String(futureDate.hour!) + "時" + String(futureDate.minute!) + "分" + String(futureDate.second!) + "秒")
        }
    }
    // 基準日時から、1年前までの日時を取得して、リストに格納する
    func getPastDate() {
        var roopDay = Int()
        // うるう年の場合
        if baseDate.year! % 2 == 0 {
            roopDay = 366
        } else if baseDate.year! % 2 == 1 {
            roopDay = 365
        }
        for i in 1...roopDay {
            // 基準日時から（減算）
            var pastDate = baseDate
            pastDate.day = baseDate.day! - i
            print(roopDay)
            print(i)
            // 繰り下げ処理
            while true {
                // 31日: 1, 3, 5, 7, 8, 10, 12月
                if (pastDate.month == 1 && 0 > pastDate.day! && pastDate.day! < 31) || (pastDate.month == 3 && 0 > pastDate.day! && pastDate.day! < 31) || (pastDate.month == 5 && 0 > pastDate.day! && pastDate.day! < 31) || (pastDate.month == 7 && 0 > pastDate.day! && pastDate.day! < 31) || (pastDate.month == 8 && 0 > pastDate.day! && pastDate.day! < 31) || (pastDate.month == 10 && 0 > pastDate.day! && pastDate.day! < 31) || (pastDate.month == 12 && 0 > pastDate.day! && pastDate.day! < 31) {
                    pastDate.day = pastDate.day! + 31 // 日数を加算
                    pastDate.month = pastDate.month! - 1 // 一ヶ月さかのぼる
                    // 月の繰り下げ処理
                    if (pastDate.month! < 1) {
                        pastDate.month = 12 // 月をリセット
                        pastDate.year = pastDate.year! - 1 // 年に繰り下げ
                    }
                }
                // 日数が1日以上になったら無限ループを抜ける
                if (pastDate.month == 1 && 31 >= pastDate.day! && pastDate.day! > 0) || (pastDate.month == 3 && 31 >= pastDate.day! && pastDate.day! > 0) || (pastDate.month == 5 && 31 >= pastDate.day! && pastDate.day! > 0) || (pastDate.month == 7 && 31 >= pastDate.day! && pastDate.day! > 0) || (pastDate.month == 8 && 31 >= pastDate.day! && pastDate.day! > 0) || (pastDate.month == 10 && 31 >= pastDate.day! && pastDate.day! > 0) || (pastDate.month == 12 && 31 >= pastDate.day! && pastDate.day! > 0){
                    print("31日")
                    break
                }
                // 30日: 4, 6, 9, 11
                if (pastDate.month == 4 && 0 > pastDate.day! && pastDate.day! < 30) || (pastDate.month == 6 && 0 > pastDate.day! && pastDate.day! < 30) || (pastDate.month == 9 && 0 > pastDate.day! && pastDate.day! < 30) || (pastDate.month == 11 && 0 > pastDate.day! && pastDate.day! < 30) {
                    pastDate.day = pastDate.day! + 30 // 日数を加算
                    pastDate.month = pastDate.month! - 1 // 一ヶ月さかのぼる
                    // 月の繰り下げ処理
                    if (pastDate.month! < 1) {
                        pastDate.month = 12 // 月をリセット
                        pastDate.year = pastDate.year! - 1 // 年に繰り下げ
                    }
                }
                // 日数が1日以上になったら無限ループを抜ける
                if (pastDate.month == 4 && 30 >= pastDate.day! && pastDate.day! > 0) || (pastDate.month == 6 && 30 >= pastDate.day! && pastDate.day! > 0) || (pastDate.month == 9 && 30 >= pastDate.day! && pastDate.day! > 0) || (pastDate.month == 11 && 30 >= pastDate.day! && pastDate.day! > 0) {
                    print("30日")
                    break
                }
                // 29日(うるう年): 2月
                if (pastDate.year! % 2 == 0) && (pastDate.month == 2) && (0 > pastDate.day! && pastDate.day! < 29){
                    pastDate.day = pastDate.day! + 29 // 日数を加算
                    pastDate.month = pastDate.month! - 1 // 一ヶ月さかのぼる
                    // 月の繰り下げ処理
                    if (pastDate.month! < 1) {
                        pastDate.month = 12 // 月をリセット
                        pastDate.year = pastDate.year! - 1 // 年に繰り下げ
                    }
                }
                // 日数が1日以上になったら無限ループを抜ける
                if (pastDate.year! % 2 == 0) && (pastDate.month == 2) && (29 >= pastDate.day! && pastDate.day! > 0) {
                    print("29日")
                    break
                }
                // 28日（非うるう年): 2月
                if (pastDate.year! % 2 == 1) && (pastDate.month == 2) && (0 > pastDate.day! && pastDate.day! < 28) {
                    pastDate.day = pastDate.day! + 28 // 日数を加算
                    pastDate.month = pastDate.month! - 1 // 一ヶ月さかのぼる
                    // 月の繰り下げ処理
                    if (pastDate.month! < 1) {
                        pastDate.month = 12 // 月をリセット
                        pastDate.year = pastDate.year! - 1 // 年に繰り下げ
                    }
                }
                // 日数が1日以上になったら無限ループを抜ける
                if (pastDate.year! % 2 == 1) && (pastDate.month == 2) && (28 >= pastDate.day! && pastDate.day! > 0) {
                    print("28日")
                    break
                }
            }
            print("基準日時の\(i)日前を算出（減算）：" + String(pastDate.year!) + "年" + String(pastDate.month!) + "月" + String(pastDate.day!) + "日" + String(pastDate.hour!) + "時" + String(pastDate.minute!) + "分" + String(pastDate.second!) + "秒")
        }
    }
}
