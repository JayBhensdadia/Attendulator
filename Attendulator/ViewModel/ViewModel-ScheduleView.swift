//
//  ViewModel-ScheduleView.swift
//  Attendulator
//
//  Created by Jay Bhensdadia on 16/07/23.
//

import Foundation

extension ScheduleView{
    @MainActor class ViewModel: ObservableObject{
        
        
        
        func addLecture(sem: Semester) -> Lecture{
            let lecture = Lecture(subject: sem.subjects.randomElement() ?? sem.subjects[0],startHour: 10, startMinute: 0, endHour: 11, endMinute: 0, date: Date())
            return lecture
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
        
        func markAttended(semester: Semester, lecId: String){
            for i in 0..<semester.allLectures.count{
                if semester.allLectures[i].id == lecId{
                    semester.allLectures[i].attended = true
                }
            }
        }
    }
}
