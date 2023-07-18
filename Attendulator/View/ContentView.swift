//
//  ContentView.swift
//  Attendulator
//
//  Created by Jay Bhensdadia on 16/07/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ViewModel()
    @StateObject var user = User()
    
    var body: some View {
        TabView{
            
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
//            TodaysView()
//                .tabItem {
//                    Label("Today",systemImage: "clock.fill")
//                }
            
            ScheduleView()
                .tabItem {
                    Label("Schedule", systemImage: "calendar")
                }
            
//            AllLecturesView()
//                .tabItem {
//                    Label("All Lectures", systemImage: "list.bullet")
//                }
//            
//            AttendedLecturesView()
//                .tabItem{
//                    Label("Attended", systemImage: "checkmark.circle.fill")
//                }
            
//            SettingsView()
//                .tabItem {
//                    Label("Settings", systemImage: "person.fill")
//                }
            
            UserDetailsView()
                .tabItem {
                    Label("User Details", systemImage: "person.fill")
                }
        }
        .environmentObject(user.currentSemester)
        .environmentObject(user)
        .tint(.cyan)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
