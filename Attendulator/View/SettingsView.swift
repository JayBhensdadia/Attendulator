//
//  SettingsView.swift
//  Attendulator
//
//  Created by Jay Bhensdadia on 16/07/23.
//

import SwiftUI

struct SettingsView: View {
    
    @State var userName = "Your Name"
    @State var currentSem = 6
    
    var body: some View {
        NavigationStack{
            List{
                HStack{
                    Image(systemName: "person.fill")
                    TextField(userName, text: $userName)
                }
                
                HStack{
                    Image(systemName: "building.columns.fill")
                    TextField("current semester", value: $currentSem, format: .number)
                }
            }
            .navigationTitle(userName)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            
    }
}
