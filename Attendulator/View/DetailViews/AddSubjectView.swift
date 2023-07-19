//
//  AddSubjectView.swift
//  Attendulator
//
//  Created by Jay Bhensdadia on 16/07/23.
//

import SwiftUI

import SwiftUI

struct AddSubjectView: View {
    @EnvironmentObject var sem: Semester
    @EnvironmentObject var user: User
    @State var shortName = ""
    @State var longName = ""
    @Environment(\.dismiss) var dismiss
    @State var showingAlert = false
    
    var newSubject: Subject{
        Subject(shortName: shortName, fullName: longName)
    }
    
    var subjectAlreadyExist: Bool{
        
        for subject in sem.subjects{
            if subject.shortName == shortName && subject.fullName == longName{
                return true
            }
        }
        
        return false
    }
    
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("short name", text: $shortName)
                TextField("long name", text: $longName)
            }
            .navigationTitle("Add Subject")
            .toolbar{
                Button("Save"){
                    //let newSubject = Subject(shortName: shortName, fullName: longName)
                    
                    if subjectAlreadyExist{
                        showingAlert = true
                    }else{
                        sem.subjects.append(newSubject)
                        user.saveData()
                        user.objectWillChange.send()
                        dismiss()
                    }
                    
                }
                .disabled(shortName.isEmpty || longName.isEmpty)
            }
            .alert("Subject already exist",isPresented: $showingAlert) {
                Button("Ok"){
                    shortName = ""
                    longName = ""
                }
                
            }
        }
    }
}

struct AddSubjectView_Previews: PreviewProvider {
    static var previews: some View {
        AddSubjectView()
            .environmentObject(Semester())
            .environmentObject(User())
    }
}
