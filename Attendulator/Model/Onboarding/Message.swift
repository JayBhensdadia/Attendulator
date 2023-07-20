//
//  Message.swift
//  Attendulator
//
//  Created by Jay Bhensdadia on 20/07/23.
//

import Foundation

struct Message: Identifiable{
    var id = UUID()
    var title: String
    var headline: String
    var image: String
}
