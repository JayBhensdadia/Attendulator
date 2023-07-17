//
//  Semester.swift
//  Attendulator
//
//  Created by Jay Bhensdadia on 16/07/23.
//

import Foundation

class Semester:   ObservableObject, Identifiable {
    
    
    
    
    let id: Int
    @Published var schedule: Schedule
    @Published var allLectures: [Lecture]
    @Published var subjects: [Subject]
    
    var startDate: Date
    var endDate: Date
    var lecturesBuffer = [Lecture]()
    
    init(){
        id = 6
        schedule = Schedule()
        startDate = Date()
        endDate = Date().addingTimeInterval(3600*24*7*4)
        allLectures = []
        subjects = [
            
            Subject(shortName: "ADA", fullName: "Analysis and Design of Algorithm"),
            Subject(shortName: "SE", fullName: "Software Engineering"),
            Subject(shortName: "CN", fullName: "Computer Networks")
        ]
    }
    
    
    var totalLectures: Int{
        allLectures.count
    }
    
    var attendedLectures: Int{
        var count = 0
        for lec in allLectures{
            if lec.attended{
                count += 1
            }
        }
        
        return count
    }
    
    
    
}
