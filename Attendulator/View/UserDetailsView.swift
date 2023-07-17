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
    var body: some View {
        NavigationStack{
            Form{
                
                Section("Name"){
                    TextField("Name", text: $user.name)
                }
                
                Section("Semesters"){
                    ForEach(user.semesters){ sem in
                        VStack{
                            Text("Sem \(sem.id)")
                        }
                    }
                }
                
                Section("More on lectures..."){
                    
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
                
                Section("Change semester"){
                    Button{
                        
                        user.currentSemester = Semester()
                        
                    }label: {
                        Text("Change Semester")
                    }
                }
                
            }
            .navigationTitle("User Details")
            
        }
        
    }
}


struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsView()
            .environmentObject(User())
    }
}
