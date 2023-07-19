//
//  Lecture.swift
//  Attendulator
//
//  Created by Jay Bhensdadia on 16/07/23.
//

import Foundation

struct Lecture: Hashable, Identifiable,Codable{
    let id = UUID().uuidString
    var subject: Subject
    var startHour: Int
    var startMinute: Int
    var endHour: Int
    var endMinute: Int
    var date: Date?
    var attended: Bool = false
    
    var newId: String{
        var date = date?.formatted(date: .abbreviated, time: .omitted) ?? Date().formatted(date: .abbreviated, time: .omitted)
        var startTime = "\(startHour)\(startMinute)"
        var endTime = "\(endHour)\(endMinute)"
        
        var sub = subject.fullName
        
        return "\(sub)\(date)\(startTime)\(endTime)"
    }
}
