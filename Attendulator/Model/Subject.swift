//
//  Subject.swift
//  Attendulator
//
//  Created by Jay Bhensdadia on 16/07/23.
//

import Foundation


struct Subject: Hashable, Identifiable, Codable{
    
    var shortName: String
    var fullName: String
    
    var id: String{
        return "\(shortName)\(fullName)"
    }
    
    

}
