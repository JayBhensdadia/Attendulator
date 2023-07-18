//
//  ViewModel-TodaysView.swift
//  Attendulator
//
//  Created by Jay Bhensdadia on 16/07/23.
//

import Foundation

extension TodaysView{
    @MainActor class ViewModel: ObservableObject{
        
        var todayTitle: String{
            Date().formatted(date: .abbreviated, time: .omitted)
        }

        
        func markAttended(semester: Semester, lecId: String){
            for i in 0..<semester.allLectures.count{
                if semester.allLectures[i].id == lecId{
                    semester.allLectures[i].attended = true
                    semester.lecturesBuffer.append(semester.allLectures[i])
                }
            }
        }
        
    }
}
