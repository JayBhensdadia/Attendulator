//
//  ViewModel-HomeView.swift
//  Attendulator
//
//  Created by Jay Bhensdadia on 16/07/23.
//

import Foundation


extension HomeView{
    @MainActor class ViewModel: ObservableObject{
        
        @Published var showingAddSubjectView = false
        @Published var showingSubjectDetailVIew = false
        @Published var selectedSubject: Subject?
        @Published var progress: Float = 0.15
        
        func percentCompleted(sem: Semester) -> String{
            let total = Double(sem.totalLectures)
            let attended = Double(sem.attendedLectures)
            let percent = attended/total
            return "\(String(format: "%.2f",percent * 100))%"
        }
        
        func semesterCompletionPercentage(sem: Semester) -> Float{
            let total = Float(sem.totalLectures)
            let attended = Float(sem.attendedLectures)
            return attended/total
        }
        
        func subjectCompletionPercentage(sem: Semester, sub: Subject) -> Float{
            var total = 0
            var attended = 0
            
            for lecture in sem.allLectures{
                if lecture.subject == sub{
                    total += 1
                    if lecture.attended {
                        attended += 1
                    }
                }
            }
            
            return Float(attended) / Float(total)
        }
        
        
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
