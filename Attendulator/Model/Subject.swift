//
//  Subject.swift
//  Attendulator
//
//  Created by Jay Bhensdadia on 16/07/23.
//

import Foundation

struct Subject: Hashable, Identifiable{
    let id = UUID().uuidString
    var shortName: String
    var fullName: String

}