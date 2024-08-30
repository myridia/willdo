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
    @AppStorage("user") var user = ""
    @AppStorage("password") var password = ""
    @AppStorage("couchdb") var couchdb = false
    @AppStorage("iscouchdb") var iscouchdb = false

    @AppStorage("languageIndex") var languageIndex = 0
    //@State private var username = ""
    //@State private var password = ""
    @AppStorage("index") var index = 0
    var body: some View {
        NavigationView {
       
            
            Form {
                        Section(header: Text("Notifications")) {
                  
                            Toggle("Play notification sounds", isOn: $iscouchdb)
                        }
                        
                    }
            
            
            SettingStack {
                /// This is the main settings page.
                SettingPage(title: "Settings") {
      
                    /// Use groups to group components together.
                    SettingGroup(header: "Online Storage") {
                        SettingToggle(title: "Save Data to Couchdb", isOn: $couchdb)
                        if couchdb  {
                            SettingTextField( placeholder: "Enter couchdb host", text: $host)
                      
                            SettingTextField( placeholder: "Enter User", text: $user)
                            
                            SettingTextField( placeholder: "Enter Password", text: $password)
                        }
                    }
                    
                    SettingGroup {
                                     
                                        SettingPicker(
                                            title: "Picker with menu",
                                            choices: ["A", "B", "C", "D"],
                                            selectedIndex: $index,
                                            choicesConfiguration: .init(
                                                pickerDisplayMode: .menu
                                            )
                                        )
                                    }
                    
                    
                   
                    
                    
                    
                    
                    
                    SettingGroup {
                                               SettingButton(title: "View on GitHub") {
                                                 
                                                   
                                                   
                                               }

                                               
                                           }
                    
                    
                    
                }
                
                
            }
            
            
            
            
            
        }
    }
    
    
}

