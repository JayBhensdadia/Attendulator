//
//  User.swift
//  Attendulator
//
//  Created by Jay Bhensdadia on 17/07/23.
//

import Foundation


class User: ObservableObject{
    @Published var currentSemester: Semester
    @Published var name: String
    @Published var semesters: [Semester]
    init(){
        name = "User"
        currentSemester = Semester()
        semesters = [Semester(), Semester(), Semester()]
    }
}
