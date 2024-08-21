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
    @AppStorage("isOn") var isOn = true
    //@State private var username = ""
    //@State private var password = ""
    var body: some View {
        NavigationView {
            
            SettingStack {
                /// This is the main settings page.
                SettingPage(title: "Playground") {
                    /// Use groups to group components together.
                    SettingGroup(header: "Main Group") {
                        /// Use any of the pre-made components...
                        SettingToggle(title: "This value is persisted!", isOn: $isOn)
                        
                        /// ...or define your own ones!
                        SettingCustomView {
                            Image(systemName: "tortoise.fill")
                            
                                .foregroundStyle(.tint)
                            
                                .symbolRenderingMode(.hierarchical)
                            
                            /// Nest `SettingPage` inside other `SettingPage`s!
                            // SettingPage(title: "Advanced Settings") {
                            //     SettingText(title: "I show up on the next page!")
                            // }
                        }
                    }
                }
                
                
            }
            
            
            
            
            
        }
    }
    
    
}

