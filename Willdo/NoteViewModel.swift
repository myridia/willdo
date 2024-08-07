//
//  NoteViewModel.swift
//  Willdo
//
//  Created by veto on 29/1/2567 BE.
//

import Foundation
import SwiftUI

class NoteViewModel: ObservableObject {
    @Published var notes: [Note] = []
    
    init(){
        //   addNotes()
    }
   func addNotes() {
       // notes = noteData
       for i in 1...2{
           notes.append(Note(title: "foo\(i)", content:"bar\(i)"))
       }
       
       
    }
    
    func tapNote(_ sender: UUID) {
        print(sender)
        
    }
    
    
    func add_note(_ title:String,_ content:String) {
        if content != "" {
            var title = title
            if title == "" {
                let a = content.components(separatedBy: "\n")
                if a[0].count > 25 {
                    //let slice = content[0..<50]
                    let indexFrom = a[0].startIndex
                    let indexTo = a[0].index(a[0].startIndex, offsetBy:25)
                    let substring = a[0][indexFrom..<indexTo]
                    title = String(substring) + "..."

                }
                else {
                    title = a[0]
                    
                }
                
                
            }
            notes.append(Note(title: title, content:content))
            print("...add note")
        }
        
    }
}

let noteData = [
    Note(title: "foo1", content:"bar1"),
    Note(title: "foo2", content:"bar2"),
    Note(title: "foo3", content:"bar3"),
        ]

