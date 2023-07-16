//
//  Lecture.swift
//  Attendulator
//
//  Created by Jay Bhensdadia on 16/07/23.
//

import Foundation

struct Lecture: Hashable, Identifiable{
    let id = UUID().uuidString
    var subject: Subject
    var startHour: Int
    var startMinute: Int
    var endHour: Int
    var endMinute: Int
    var date: Date?
    var attended: Bool = false
}
