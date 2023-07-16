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
        
        func percentCompleted(sem: Semester) -> Double{
            let total = Double(sem.totalLectures)
            let attended = Double(sem.attendedLectures)
            return attended/total
        }
        
        
        
    }
}
