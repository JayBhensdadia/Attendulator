//
//  DateExtension.swift
//  Attendulator
//
//  Created by Jay Bhensdadia on 19/07/23.
//

import Foundation

extension Date {
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }

    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
    
    
    var todayStart: Date{
        var components = Calendar.current.dateComponents([.year, .month,.day],from: Date())
        components.hour = 5
        components.minute = 0
        var date = Calendar.current.date(from: components) ?? Date()
        return date
    }
    
    
    var todayEnd: Date{
        var components = Calendar.current.dateComponents([.year, .month,.day],from: Date())
        components.hour = 23
        components.minute = 0
        var date = Calendar.current.date(from: components) ?? Date()
        return date
    }
}
