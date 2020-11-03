//
//  CalendarCalc.swift
//  暦の計算
//
//  Created by 柴田優河 on 2020/11/01.
//  Copyright © 2020 Makoto Shibata. All rights reserved.
//

import Foundation

class CalendarCalc {
 
    var calendar = Calendar(identifier: .gregorian) // グレゴリオ暦
    var baseDate = DateComponents()
    var dateArray = [[Date()], [String()]]
    
    func get2year() -> Array<Array<Any>> {
        
        calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "Asia/Tokyo")! // タイムゾーンを設定
        calendar.locale = Locale(identifier: "ja") // ロケール（地域）を設定        calendar.locale = Locale(identifier: "ja_JP")
        calendar.timeZone = TimeZone(identifier: "Asia/Tokyo")!
        let now = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second, .weekday], from: Date()) // 現在時刻を取得
        var date = calendar.date(from: DateComponents(year: now.year, month: now.month, day: now.day, hour: now.hour, weekday: now.weekday))! // calendarに時刻をセット(9時間ずれる)
        var weekday = calendar.component(.weekday, from: date)
        var comps = DateComponents(hour: 9)
        date = calendar.date(byAdding: comps, to: date)! // 時間のずれを修正（９時間）
        
        // うるう年かの判定
        var roopDay = Int()
        if now.year! % 2 == 1 {
            roopDay = 365
        } else if now.year! % 2 == 0 {
            roopDay = 366
        }
        
        // weekdayの値が更新されてしまうので、weekdayの値を格納
        let buffer = weekday

        // 過去
        for i in 0...roopDay {
            comps = DateComponents(day: -i)
            let value = calendar.date(byAdding: comps, to: date)!
            dateArray[0].append(value)
            dateArray[1].append(calendar.standaloneWeekdaySymbols[weekday - 1])
            weekday -= 1
            if weekday < 1 {
                weekday = 7
            }
        }
        
        // ソート（現▶過去）⇛（過去▶現）
        dateArray[0].reverse()
        dateArray[1].reverse()
        // 空要素を削除
        dateArray[0].remove(at: roopDay + 1)
        dateArray[1].remove(at: roopDay + 1)
        // 重複する要素を削除
        dateArray[0].remove(at: roopDay)
        dateArray[1].remove(at: roopDay)
        
        // weekdayを初期値へ戻す
        weekday = buffer
        
        // 未来
        for i in 0...roopDay {
            comps = DateComponents(day: i)
            let value = calendar.date(byAdding: comps, to: date)!
            dateArray[0].append(value)
            dateArray[1].append(calendar.standaloneWeekdaySymbols[weekday - 1])
            weekday += 1
            if weekday > 7 {
                weekday = 1
            }
        }
        
        return dateArray
        
        // 値の取り出し
//        for i in 0...dateArray[0].count - 1 {
//            print(dateArray[0][i], dateArray[1][i])
//        }
    }
}
