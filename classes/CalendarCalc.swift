//
//  CalendarCalc.swift
//  暦の計算
//
//  Created by 柴田優河 on 2020/11/10.
//  Copyright © 2020 Makoto Shibata. All rights reserved.
//
import Foundation

class CalendarCalc {
 
    var calendar  = Calendar(identifier: .gregorian) // グレゴリオ暦
    var nowDate   = DateComponents()                 // 基準日時を格納する
    var dateArray = [[Date()], [String()]]
    
    init() {
        calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "Asia/Tokyo")! // タイムゾーンを設定
        calendar.locale = Locale(identifier: "ja")              // ロケール（地域）を設定
        calendar.timeZone = TimeZone(identifier: "Asia/Tokyo")!
        nowDate = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date())
        nowDate.calendar = Calendar(identifier: .gregorian)
    }
    
    func getNowDate() -> DateComponents {
        return nowDate
    }
    
    func getMonthOfDays(year: Int, month: Int) -> Int {
        switch month {
        case 1:
            return 31
        case 2:
            if year % 4 == 0 || year % 400 == 0 {
                return 29
            } else {
                return 28
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
        default:
            print(Error.self)
            return 0
        }
    }
    
    func getWeekday(year: Int, month: Int) -> Int {
//        let weekDaay = ["日", "月", "火", "水", "木", "金", "土"]
        let day = 1
        return (year + year / 4 - year / 100 + year / 400 + (13 * month + 8) / 5 + day) % 7
    }
    
    // nヶ月後の日付を取得する
    func getMonthLater(DateComponent: DateComponents, Later: Int) -> Date{
        let value = DateComponent
        let comps = DateComponents(month: Later)
        let later =  value.calendar?.date(byAdding: comps, to: nowDate.date!)
        return later!
    }
}
