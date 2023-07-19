//
//  User.swift
//  Attendulator
//
//  Created by Jay Bhensdadia on 17/07/23.
//

import Foundation


class User: ObservableObject,Codable{
    
    @Published var currentSemester: Semester
    @Published var name: String
       
    enum CodingKeys: CodingKey{
        case currentSemester
        case name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        currentSemester = try container.decode(Semester.self, forKey: .currentSemester)
    }
   
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(currentSemester, forKey: .currentSemester)
    }
    
    init(){
        

        name = "User"
        currentSemester = Semester()
        
        loadData()
        
    }
    
    // Function to save data to the documents directory
        func saveData() {
          
           let fileURL = FileManager.documentsDirectory.appendingPathComponent("userData.json")

           do {
               let encoder = JSONEncoder()
               let data = try encoder.encode(self)
               try data.write(to: fileURL)
           } catch {
               print("Error saving data: \(error.localizedDescription)")
           }
       }

       // Function to load data from the documents directory
        func loadData() {
           
           let fileURL = FileManager.documentsDirectory.appendingPathComponent("userData.json")

           do {
               let data = try Data(contentsOf: fileURL)
               let decoder = JSONDecoder()
               let user = try decoder.decode(User.self, from: data)
               self.name = user.name
               self.currentSemester = user.currentSemester
           } catch {
               print("Error loading data: \(error.localizedDescription)")
           }
       }
}
