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
    
    @State var showingResetAlert = false
    
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
                        Text("All Lectures")
                    }
                    
                    NavigationLink{
                        AttendedLecturesView()
                    }label: {
                        Text("Attended Lectures")
                    }
                }
                
               
                
                Section("Renew semester"){
                    
                    Button(role: .destructive){
                        showingResetAlert = true
                        
                    }label: {
                        Text("Renew Semester")
                    }
                    
                }
                
            }
            .navigationTitle("User Details")
            .sheet(isPresented: $showingAddSubjectView) {
                AddSubjectView()
            }
            .onDisappear(perform: user.saveData)
            .scrollIndicators(.hidden)
            .alert("Are you sure?", isPresented: $showingResetAlert) {
                Button("Yes"){ user.currentSemester = Semester() }
                Button("Cancel",role: .cancel){}
            }message: {
                Text("renewal of semester will erase all data of previous semester!")
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
