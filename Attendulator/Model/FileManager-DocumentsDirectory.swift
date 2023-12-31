//
//  FileManager-DocumentsDirectory.swift
//  Attendulator
//
//  Created by Jay Bhensdadia on 19/07/23.
//

import Foundation

extension FileManager{
    static var documentsDirectory : URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
