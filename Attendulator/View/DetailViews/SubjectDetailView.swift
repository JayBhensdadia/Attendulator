//
//  SubjectDetailView.swift
//  Attendulator
//
//  Created by Jay Bhensdadia on 16/07/23.
//

import SwiftUI

struct SubjectDetailView: View {
    @EnvironmentObject var sem : Semester
    @Environment(\.dismiss) var dismiss
    var subject: Subject
    
    var totalLectures: [Lecture]{
        var arr = [Lecture]()
        for lec in sem.allLectures{
            if lec.subject == subject{
                arr.append(lec)
            }
        }
        
        return arr
    }
    
    var upcomingLectures: [Lecture]{
        var arr = [Lecture]()
        var count = 0
        for lec in sem.allLectures{
            if lec.subject == subject && !lec.attended{
                arr.append(lec)
                count+=1
                
                if count == 3{
                    return arr
                }
            }
        }
        
        return arr
    }
    
    
    var attendedLectures: [Lecture]{
        var arr = [Lecture]()
        for lec in sem.allLectures{
            if lec.subject == subject && lec.attended{
                arr.append(lec)
            }
        }
        
        return arr
    }
    
    
    var subjectCompletionPercentage: Double{
        let total = Double(totalLectures.count)
        let attended = Double(attendedLectures.count)
        
        return attended / total
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack(alignment: .leading){
                    VStack(alignment: .leading){
                        Text(subject.shortName)
                            .font(.title.bold())
                        Text("(\(subject.fullName))")
                            .font(.title3.bold())
                    }
                
                    HStack{
                        Text(subjectCompletionPercentage, format: .percent)
                            .font(.largeTitle.bold())
                        Text(" Completed")
                    }
                    .font(.title3)
                    .padding()
                    .background(.cyan.gradient.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                    
                    Text("Upcoming Lectures")
                        .font(.headline)
                        .padding(.top)
                    
                    
                    
                    LazyVStack(alignment: .leading){
                        ForEach(upcomingLectures) { lecture in
                            LazyVStack(alignment: .leading){
                                Text(lecture.date!.formatted(date: .abbreviated, time: .omitted))
                            }
                            .padding()
                            .background(.cyan.gradient.opacity(0.3))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            
                        }
                    }
                    
                }
                .padding()
            }
            .toolbar{
                Button("Back"){
                    dismiss()
                }
            }
        }
    }
}

struct SubjectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectDetailView(subject: Subject(shortName: "ADA", fullName: "Analysis and Design of Algorithm"))
            .environmentObject(Semester())
    }
}
