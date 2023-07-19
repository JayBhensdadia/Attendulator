//
//  UserDetailsView.swift
//  Attendulator
//
//  Created by Jay Bhensdadia on 17/07/23.
//

import SwiftUI

struct UserDetailsView: View {
    
    @EnvironmentObject var user: User
    @State var changeSemester = false
    @State var showingAddSubjectView = false
    
    var body: some View {
        NavigationStack{
            Form{
                
                Section("Name"){
                    TextField("Name", text: $user.name)
                }
                
                Section("Current Semester"){
                    TextField("sem", value: $user.currentSemester.id, format: .number)
                    DatePicker("Start Date", selection: $user.currentSemester.startDate, displayedComponents: .date)
                    DatePicker("End Date", selection: $user.currentSemester.endDate, displayedComponents: .date)
                    
                        
                }
                
                Section("Subjects"){
                    ForEach(user.currentSemester.subjects){ subject in
                        NavigationLink{
                            SubjectDetailView(subject: subject)
                        }label: {
                            Text(subject.shortName)
                        }
                    }
                    
                    
                    Button{
                        
                        showingAddSubjectView = true
                        
                    }label: {
                        Text("Add Subject")
                    }
                }
                
                
                Section{
                    NavigationLink{
                        AllLecturesView()
                    }label: {
                        Text("All Lectures : \(user.currentSemester.allLectures.count)")
                    }
                    
                    NavigationLink{
                        AttendedLecturesView()
                    }label: {
                        Text("Attended Lectures: \(user.currentSemester.lecturesBuffer.count)")
                    }
                }
                
               
                
                Section("Renew semester"){
                    
                    Button{
                        user.currentSemester = Semester()
                    }label: {
                        Text("Renew Semester")
                    }
                    
                }
                
            }
            .navigationTitle("User Details")
            .sheet(isPresented: $showingAddSubjectView) {
                AddSubjectView()
            }
            
        }
        
    }
}


struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsView()
            .environmentObject(User())
    }
}
