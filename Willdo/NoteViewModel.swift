//
//  NoteViewModel.swift
//  Willdo
//
//  Created by veto on 29/1/2567 BE.
//

import Foundation
import SwiftUI
import SQLite3

class NoteViewModel: ObservableObject {
    @Published var notes: [Note] = []
    var db : OpaquePointer?
    var path : String = "willdo.sqlite"
    init(){
        self.db = createDB()
        self.createTable()
        
    }
    
    //https://www.wepstech.com/sqlite-in-ios-with-swift-5/
    func createDB() -> OpaquePointer? {
        /*
         ./Library/Developer/Xcode/UserData/Previews/Simulator Devices/8D0993A7-0652-4385-8E9B-5C40D729DC6E/data/Containers/Data/Application/900DD540-BD83-4546-BA45-D1929D61BDE8/Library/Application Support/willdo.sqlite
         ./Library/Developer/CoreSimulator/Devices/806AAF35-FA64-4C48-BBB5-52BF91B112FE/data/Containers/Data/Application/250B7C60-EF4B-49A4-B033-ED70F1829AFF/Library/Application Support/willdo.sqlite
         */
            let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathExtension(path)
            
            var db : OpaquePointer? = nil
            
            if sqlite3_open(filePath.path, &db) != SQLITE_OK {
                print("There is error in creating DB")
                return nil
            }else {
                print("Database has been created with path \(path)")
                return db
            }
        }
    
    func createTable()  {
            let query = "CREATE TABLE IF NOT EXISTS your_table_name(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT, result TEXT, avg INTEGER, list TEXT);"
            var statement : OpaquePointer? = nil
            
            if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
                if sqlite3_step(statement) == SQLITE_DONE {
                    print("Table creation success")
                    
                }else {
                    print("Table creation fail")
                }
            } else {
                print("Prepration fail")
            }
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
                //https://www.zerotoappstore.com/how-to-split-a-string-in-swift-with-examples.html
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

