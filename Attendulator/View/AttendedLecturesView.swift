//
//  AttendedLecturesView.swift
//  Attendulator
//
//  Created by Jay Bhensdadia on 16/07/23.
//

import SwiftUI

struct AttendedLecturesView: View {
    @EnvironmentObject var sem: Semester
    var body: some View {
        NavigationStack{
            List{
                
                ForEach(sem.lecturesBuffer){ lecture in
                    HStack{
                        Image(systemName:  lecture.attended ? "checkmark.circle.fill": "circle")
                        VStack(alignment: .leading){
                            Text( lecture.subject.shortName)
                            Text( lecture.date!.formatted(date: .abbreviated, time: .omitted))
                        }
                        
                    }
                }
                
            }
            .navigationTitle("Attended")
        }
        
    }
}

struct AttendedLecturesView_Previews: PreviewProvider {
    static var previews: some View {
        AttendedLecturesView()
            .environmentObject(Semester())
    }
}
