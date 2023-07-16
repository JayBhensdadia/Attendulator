//
//  ViewModel-ContentView.swift
//  Attendulator
//
//  Created by Jay Bhensdadia on 16/07/23.
//

import Foundation

extension ContentView{
    
    //ContentView ViewModel
    @MainActor class ViewModel: ObservableObject{
        @Published var semester = Semester()
    }
}
