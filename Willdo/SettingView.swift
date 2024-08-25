//
//  ContentView.swift
//  Willdo
//
//  Created by veto on 29/1/2567 BE.
//

import Setting
import SwiftUI


struct SettingView: View {
    @ObservedObject var vm = NoteViewModel()
    @State private var title = ""
    @State private var content = ""
    @State private var isActive = false

    @AppStorage("host") var host = ""
    @AppStorage("password") var password = ""
    @AppStorage("isOn") var isOn = false
    
    
    //@State private var username = ""
    //@State private var password = ""
    var body: some View {
        NavigationView {
       
            
            
            
            
            SettingStack {
                /// This is the main settings page.
                SettingPage(title: "Settings") {
      
                    /// Use groups to group components together.
                    SettingGroup(header: "Online Storage") {
                        SettingToggle(title: "This value is persisted!", isOn: $isOn)
                        SettingText(id: "Welcome to Setting!", title: "CouchDB Host")
                        SettingTextField( placeholder: "Enter couchdb here", text: $host)
                        
                        SettingText(id: "Password", title: "Password")
                        SettingTextField( placeholder: "Enter Password", text: $password)
                    }
                }
                
                
            }
            
            
            
            
            
        }
    }
    
    
}

