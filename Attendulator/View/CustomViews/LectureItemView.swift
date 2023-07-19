//
//  LectureItemView.swift
//  Attendulator
//
//  Created by Jay Bhensdadia on 16/07/23.
//

import SwiftUI

import SwiftUI

struct LectureItemView: View {
    
    @Binding var lecture: Lecture
    @EnvironmentObject var sem: Semester
    
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Sub:")
                    .fontWeight(.bold)
                Picker("Subject:", selection: $lecture.subject){
                    ForEach(sem.subjects){ subject in
                        Text(subject.shortName)
                            .tag(subject)
                            
                    }
                }
                .labelsHidden()
                .tint(.primary)
            }
            
            HStack{
                
                Text("Start Time")
                    .fontWeight(.bold)
                
                
                HStack{
                    Picker("Start Hour", selection: $lecture.startHour) {
                        ForEach(1..<13){
                            Text("\($0)")
                        }
                    }
                    .labelsHidden()
                    .tint(.primary)
                    
                    Text(":")
                        .fontWeight(.bold)
                    
                    Picker("Start Minute", selection: $lecture.startMinute) {
                        ForEach(0..<60){
                            Text("\($0)")
                        }
                    }
                    .labelsHidden()
                    .tint(.primary)
                }
            }
            
            HStack{
                
                Text("End TIme")
                    .fontWeight(.bold)
                
                HStack{
                    Picker("End Hour", selection: $lecture.endHour) {
                        ForEach(1..<13){
                            Text("\($0)")
                        }
                    }
                    .labelsHidden()
                    .tint(.primary)
                    
                    
                    Text(":")
                        .fontWeight(.bold)
                    
                    Picker("End Minute", selection: $lecture.endMinute) {
                        ForEach(0..<60){
                            Text("\($0)")
                        }
                    }
                    .labelsHidden()
                    .tint(.primary)
                }
            }
            
            
        }
        .padding()
        .background(.cyan.gradient.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .padding(.horizontal)
    }
    
    
    
}

//struct LectureItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        LectureItemView()
//    }
//}
