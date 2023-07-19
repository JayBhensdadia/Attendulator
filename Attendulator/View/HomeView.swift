//
//  HomeView.swift
//  Attendulator
//
//  Created by Jay Bhensdadia on 16/07/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var vm = ViewModel()
    @EnvironmentObject var sem: Semester
    @EnvironmentObject var user: User
    
    
    
    var todaysLectures: [Lecture]{
        
        
        
        var lecs = [Lecture]()
        for lecture in sem.allLectures{
            if lecture.date! > Date().dayBefore && lecture.date! < Date().dayAfter{
                lecs.append(lecture)
            }
        }
        return lecs
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading){
                    
                    HStack{
                        ZStack{
                            CircularProgressView(progress: vm.semesterCompletionPercentage(sem: sem))
                                .frame(width: 100, height: 100)
                                .padding(.horizontal)
                            
                            Text("Sem \(user.currentSemester.id)")
                                .font(.title3.bold())
                        }
                        VStack{
                            Text(vm.percentCompleted(sem: sem))
                            Text("Completed")
                                .font(.headline.bold())
                        }
                    }
                    .font(.largeTitle.bold())
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .background(.cyan.gradient.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding()
                    
                    HStack{
                        Text(sem.subjects.count == 0 ? "Add Subjects!" : "Subjects")
                            .font(.title2.bold())
                            //.padding()
                        
//                        Spacer()
//
//                        Button{
//                            vm.showingAddSubjectView = true
//                        }label: {
//                            Image(systemName: "plus.circle")
//                                .foregroundColor(.cyan)
//                                .font(.largeTitle)
//                                //.padding()
//                        }
                        
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal){
                        
                        
                        HStack{
                            ForEach(sem.subjects){ subject in
                                Button{
                                    vm.selectedSubject = subject
                                    vm.showingSubjectDetailVIew = true
                                }label: {
                                    ZStack{
                                        CircularProgressView(progress: vm.subjectCompletionPercentage(sem: sem, sub: subject))
                                            .frame(width: 100,height: 100)
                                            .padding()
                                        
                                        Text(subject.shortName)
                                            .font(.title3.bold())
                                    }
                                }
                                .foregroundColor(.primary)
                                .contextMenu{
                                    Button("Edit"){}
                                    Button("Delete"){}
                                }
                            }
                        }
                        
                        
                    }
                    .padding(.horizontal)
                    
                    Text(vm.todayTitle)
                        .font(.title2.bold())
                        .padding()
                    
                    ScrollView{
                        LazyVStack{
                            ForEach(todaysLectures){ lecture in
                                
                                
                                Button{
                                    vm.lectureAttendedToggle(semester: sem, lecId: lecture.id, markAttended: lecture.attended ? false : true)
                                }label: {
                                    
                                    HStack{
                                        
                                        
                                        //Spacer()
                                        
                                        Image(systemName:  lecture.attended ? "checkmark.circle.fill": "circle")
                                        
                                        VStack(alignment: .leading){
                                            Text( lecture.subject.shortName)
                                            Text( lecture.date!.formatted(date: .abbreviated, time: .omitted))
                                        }
                                        
                                        Spacer()
                                        
                                        Text("\(String(format: "%02d",lecture.startHour+1)):\(String(format: "%02d",lecture.startMinute)) to \(String(format: "%02d",lecture.endHour+1)):\(String(format: "%02d",lecture.endMinute))")
                                        

                                    }
                                    .padding()
                                    .foregroundColor(.primary)
                                    .frame(maxWidth: .infinity)
                                    .background(.cyan.gradient.opacity(0.2))
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                    .padding(.horizontal)
                                    
                                }
                                
                                
                            }
                        }
                    }
                    
                    Spacer()
                    
                    
                }
                
            }
            .navigationTitle("Home")
            .sheet(isPresented: $vm.showingAddSubjectView) {
                AddSubjectView()
            }
            .sheet(isPresented: $vm.showingSubjectDetailVIew) {
                SubjectDetailView(subject: vm.selectedSubject ?? sem.subjects[0])
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Semester())
            .environmentObject(User())
    }
}
