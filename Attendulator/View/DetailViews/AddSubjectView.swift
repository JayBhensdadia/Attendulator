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
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("short name", text: $shortName)
                TextField("long name", text: $longName)
            }
            .navigationTitle("Add Subject")
            .toolbar{
                Button("Save"){
                    let newSubject = Subject(shortName: shortName, fullName: longName)
                    
                    sem.subjects.append(newSubject)
                    user.objectWillChange.send()
                    dismiss()
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
