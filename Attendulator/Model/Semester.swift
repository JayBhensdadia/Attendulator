//
//  Semester.swift
//  Attendulator
//
//  Created by Jay Bhensdadia on 16/07/23.
//

import Foundation

class Semester:  ObservableObject, Identifiable, Hashable, Equatable, Codable{
    
    
    
    
    
    @Published var id: Int
    @Published var schedule: Schedule
    @Published var allLectures: [Lecture]
    @Published var subjects: [Subject]
    
    var startDate: Date{
        didSet{
            generateLectures(semester: self)
        }
    }
    var endDate: Date{
        didSet{
            generateLectures(semester: self)
        }
    }
    @Published var lecturesBuffer = [Lecture]()
    
    
    enum CodingKeys: CodingKey{
        
        case id
        case schedule
        case allLectures
        case subjects
        case lecturesBuffer
        case startDate
        case endDate

    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(schedule, forKey: .schedule)
        try container.encode(allLectures, forKey: .allLectures)
        try container.encode(subjects, forKey: .subjects)
        try container.encode(lecturesBuffer, forKey: .lecturesBuffer)
        try container.encode(startDate, forKey: .startDate)
                try container.encode(endDate, forKey: .endDate)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        schedule = try container.decode(Schedule.self, forKey: .schedule)
        allLectures = try container.decode([Lecture].self, forKey: .allLectures)
        subjects = try container.decode([Subject].self, forKey: .subjects)
        lecturesBuffer = try container.decode([Lecture].self, forKey: .lecturesBuffer)
        startDate = try container.decode(Date.self, forKey: .startDate)
        endDate = try container.decode(Date.self, forKey: .endDate)
    }
    
    init(){
        id = Int.random(in: 1...8)
        schedule = Schedule()
        startDate = Date()
        endDate = Date().addingTimeInterval(3600*24*7*4)
        allLectures = []
        subjects = [
            
            //            Subject(shortName: "Sub 1", fullName: "Subject 1"),
            //            Subject(shortName: "Sub 2", fullName: "Subject 2"),
            //            Subject(shortName: "Sub 3", fullName: "Subject 3"),
            //            Subject(shortName: "Sub 4", fullName: "Subject 4")
            
        ]
    }
    
    
    var totalLectures: Int{
        allLectures.count
    }
    
    var attendedLectures: Int{
        lecturesBuffer.count
//        var count = 0
//        for lec in allLectures{
//            if lec.attended{
//                count += 1
//            }
//        }
//
//        return count
    }
    
    static func == (lhs: Semester, rhs: Semester) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    
    func generateLectures(semester: Semester){
        
        
        semester.allLectures = [Lecture]()
        
        let start = Date()
        let end = semester.endDate
        
        for date in stride(from: start, to: end, by: (24*3600)){
            let weekday = Calendar.current.component(.weekday, from: date)
            
            let lecs = getLecturesOftheDay(semester: semester, weekday: weekday)
            
            for i in 0..<lecs.count{
                
                
                
                let newLecture = Lecture(subject: lecs[i].subject, startHour: lecs[i].startHour, startMinute: lecs[i].startMinute, endHour: lecs[i].endHour, endMinute: lecs[i].endMinute, date: date)
                
                
                
                semester.allLectures.append(newLecture)
            }
            
        }
        
        
        
    }
    
    func getLecturesOftheDay(semester: Semester, weekday: Int) -> [Lecture]{
        if weekday == 2{
            return semester.schedule.monday
        }else if weekday == 3{
            return semester.schedule.tuesday
        }else if weekday == 4{
            return semester.schedule.wednesday
        }else if weekday == 5{
            return semester.schedule.thursday
        }else if weekday == 6{
            return semester.schedule.friday
        }else{
            return semester.schedule.saturday
        }
    }
    
    
}
