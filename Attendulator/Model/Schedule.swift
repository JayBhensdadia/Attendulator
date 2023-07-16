//
//  Schedule.swift
//  Attendulator
//
//  Created by Jay Bhensdadia on 16/07/23.
//

import Foundation

struct Schedule{
    var monday: [Lecture]
    var tuesday: [Lecture]
    var wednesday: [Lecture]
    var thursday: [Lecture]
    var friday: [Lecture]
    var saturday: [Lecture]
    
    init() {
        monday = []
        tuesday = []
        wednesday = []
        thursday = []
        friday = []
        saturday = []
    }
}
