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
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                
                Group{
                    Text(vm.percentCompleted(sem: sem), format: .percent) + Text("Completed")
                }
                .font(.largeTitle.bold())
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .background(.cyan.gradient.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding()
                
                HStack{
                    Text("Subjects:")
                        .font(.title.bold())
                        //.padding()
                    
                    Spacer()
                    
                    Button{
                        vm.showingAddSubjectView = true
                    }label: {
                        Image(systemName: "plus.circle")
                            .foregroundColor(.cyan)
                            .font(.largeTitle)
                            //.padding()
                    }
                    
                }
                .padding(.horizontal)
                
                ScrollView{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]){
                        ForEach(sem.subjects){ subject in
                            Button{
                                vm.selectedSubject = subject
                                vm.showingSubjectDetailVIew = true
                            }label: {
                                ZStack{
                                    CircularProgressView(progress: $vm.progress)
                                        .frame(width: 100,height: 100)
                                        .padding()
                                    
                                    Text(subject.shortName)
                                        .font(.title3.bold())
                                }
                            }
                            .foregroundColor(.primary)
                        }
                    }
                    
                    
                }
                .padding()
                
                
            }
            .navigationTitle("Home")
            .sheet(isPresented: $vm.showingAddSubjectView) {
                //AddSubjectView()
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
    }
}
