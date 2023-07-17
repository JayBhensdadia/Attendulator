//
//  ScheduleView.swift
//  Attendulator
//
//  Created by Jay Bhensdadia on 16/07/23.
//

import SwiftUI

struct ScheduleView: View {
    
    @EnvironmentObject var sem : Semester
    @StateObject var vm = ViewModel()
    
    @State var showingConfirmationAlert = false
    
    var body: some View {
        NavigationStack{
            
            
            
            ZStack{
                ScrollView(.horizontal){
                    
                    
                    
                    LazyHStack{
                        
                        //MARK: Monday
                        VStack{
                            Text("Monday")
                                .foregroundColor(.cyan)
                                .font(.title)
                                .padding()
                            
                            ScrollView{
                                LazyVStack{
                                    ForEach($sem.schedule.monday){ $lecture in
                                        LectureItemView(lecture: $lecture)
                                    }
                                    
                                    Button{
                                        sem.schedule.monday.append(vm.addLecture(sem: sem))
                                    }label: {
                                        Image(systemName: "plus.circle")
                                            .font(.largeTitle)
                                    }
                                    .foregroundColor(.cyan)
                                    .padding()
                                }
                            }
                        }
                        .frame(maxWidth: 350)
                        .background(.cyan.gradient.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding()
                        
                        //MARK: Tuesday
                        VStack{
                            Text("Tuesday")
                                .foregroundColor(.cyan)
                                .font(.title)
                                .padding()
                            
                            ScrollView{
                                LazyVStack{
                                    ForEach($sem.schedule.tuesday){ $lecture in
                                        LectureItemView(lecture: $lecture)
                                    }
                                    
                                    Button{
                                        sem.schedule.tuesday.append(vm.addLecture(sem: sem))
                                    }label: {
                                        Image(systemName: "plus.circle")
                                            .font(.largeTitle)
                                    }
                                    .foregroundColor(.cyan)
                                    .padding()
                                }
                            }
                        }
                        .frame(maxWidth: 350)
                        .background(.cyan.gradient.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding()
                        
                        
                        //MARK: Wednesday
                        VStack{
                            Text("Wednesday")
                                .foregroundColor(.cyan)
                                .font(.title)
                                .padding()
                            
                            ScrollView{
                                LazyVStack{
                                    ForEach($sem.schedule.wednesday){ $lecture in
                                        LectureItemView(lecture: $lecture)
                                    }
                                    
                                    Button{
                                        sem.schedule.wednesday.append(vm.addLecture(sem: sem))
                                    }label: {
                                        Image(systemName: "plus.circle")
                                            .font(.largeTitle)
                                    }
                                    .foregroundColor(.cyan)
                                    .padding()
                                }
                            }
                        }
                        .frame(maxWidth: 350)
                        .background(.cyan.gradient.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding()
                        
                        
                        //MARK: Thursday
                        VStack{
                            Text("Thursday")
                                .foregroundColor(.cyan)
                                .font(.title)
                                .padding()
                            
                            ScrollView{
                                LazyVStack{
                                    ForEach($sem.schedule.thursday){ $lecture in
                                        LectureItemView(lecture: $lecture)
                                    }
                                    
                                    Button{
                                        sem.schedule.thursday.append(vm.addLecture(sem: sem))
                                    }label: {
                                        Image(systemName: "plus.circle")
                                            .font(.largeTitle)
                                    }
                                    .foregroundColor(.cyan)
                                    .padding()
                                }
                            }
                        }
                        .frame(maxWidth: 350)
                        .background(.cyan.gradient.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding()
                        
                        
                        //MARK: Friday
                        VStack{
                            Text("Friday")
                                .foregroundColor(.cyan)
                                .font(.title)
                                .padding()
                            
                            ScrollView{
                                LazyVStack{
                                    ForEach($sem.schedule.friday){ $lecture in
                                        LectureItemView(lecture: $lecture)
                                    }
                                    
                                    Button{
                                        sem.schedule.friday.append(vm.addLecture(sem: sem))
                                    }label: {
                                        Image(systemName: "plus.circle")
                                            .font(.largeTitle)
                                    }
                                    .foregroundColor(.cyan)
                                    .padding()
                                }
                            }
                        }
                        .frame(maxWidth: 350)
                        .background(.cyan.gradient.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding()
                        
                        
                        //MARK: Saturday
                        VStack{
                            Text("Saturday")
                                .foregroundColor(.cyan)
                                .font(.title)
                                .padding()
                            
                            ScrollView{
                                LazyVStack{
                                    ForEach($sem.schedule.saturday){ $lecture in
                                        LectureItemView(lecture: $lecture)
                                    }
                                    
                                    Button{
                                        sem.schedule.saturday.append(vm.addLecture(sem: sem))
                                    }label: {
                                        Image(systemName: "plus.circle")
                                            .font(.largeTitle)
                                            
                                    }
                                    .foregroundColor(.cyan)
                                    .padding()
                                    
                                }
                            }
                        }
                        .frame(maxWidth: 350)
                        .background(.cyan.gradient.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding()
                        
                    }
                }
                
                if sem.subjects.count == 0{
                    Text("⚠️ Add Subjects first!")
                        .font(.title2.bold())
                        .foregroundColor(.red)
                        .padding()
                        .background(.red.gradient.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                }
                
            }
            .navigationTitle("Semester \(sem.id)")
            .disabled(sem.subjects.count == 0)
            .toolbar{
                Button("Save"){
                    showingConfirmationAlert = true
                    vm.generateLectures(semester: sem)
                }
            }
            .alert("Are you sure?", isPresented: $showingConfirmationAlert) {
                Button("Ok"){}
            }message: {
                Text("Make sure you have added the schedule correctly, because changing it will result in loosing your attended data")
            }
            
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
            .environmentObject(Semester())
    }
}

