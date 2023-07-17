//
//  AllLecturesView.swift
//  Attendulator
//
//  Created by Jay Bhensdadia on 16/07/23.
//

import SwiftUI

struct AllLecturesView: View {
    
    @StateObject var vm = ViewModel()
    @EnvironmentObject var sem: Semester
    
    var body: some View {
        NavigationStack{
            Form{
                ForEach(sem.allLectures){ lecture in
                    HStack{
                        Button{
                            //vm.markAttended(semester: sem, lecId: lecture.id)
                        }label: {
                            Image(systemName:  lecture.attended ? "checkmark.circle.fill": "circle")
                        }
                        VStack(alignment: .leading){
                            Text( lecture.subject.shortName)
                            Text( lecture.date!.formatted(date: .abbreviated, time: .omitted))
                        }
                        
                        Spacer()
                        
                        Text("\(lecture.startHour+1):\(lecture.startMinute) to \(lecture.endHour+1):\(lecture.endMinute)")
                    }
                }
            }
            .navigationTitle("All Lectures")
//            .toolbar{
//                Button("Add"){
//                    vm.generateLectures(semester: sem)
//                }
//            }
            
        }
    }
}

struct AllLecturesView_Previews: PreviewProvider {
    static var previews: some View {
        AllLecturesView()
            .environmentObject(Semester())
    }
}
