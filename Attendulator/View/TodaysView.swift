//
//  TodaysView.swift
//  Attendulator
//
//  Created by Jay Bhensdadia on 16/07/23.
//

import SwiftUI

struct TodaysView: View {
    
    @EnvironmentObject var sem: Semester
    @StateObject var vm = ViewModel()
    
    
    var todaysLectures: [Lecture]{
        var lecs = [Lecture]()
        for lecture in sem.allLectures{
            if lecture.date == Date(){
                lecs.append(lecture)
            }
        }
        return lecs
    }
    
    var body: some View {
        NavigationStack{
            List{
                
                ForEach(todaysLectures){ lecture in
                    HStack{
                        Button{
                            vm.markAttended(semester: sem, lecId: lecture.id)
                        }label: {
                            Image(systemName:  lecture.attended ? "checkmark.circle.fill": "circle")
                        }
                        VStack(alignment: .leading){
                            Text( lecture.subject.shortName)
                            Text( lecture.date!.formatted(date: .abbreviated, time: .omitted))
                        }
                        
                        Text("\(lecture.startHour):\(lecture.startMinute) to \(lecture.endHour):\(lecture.endMinute)")
                    }
                }
                
            }
            .navigationTitle(vm.todayTitle)
        }
    }
}

struct TodaysView_Previews: PreviewProvider {
    static var previews: some View {
        TodaysView()
            .environmentObject(Semester())
    }
}
