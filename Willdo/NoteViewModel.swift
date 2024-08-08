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
        self.insertData(_id:"aa",_rev:"rrr",doc:"dddd")
        
    }
    
    func insertData(_id:String,_rev:String,doc:String) {
        let query = "INSERT INTO willdo (_id, _rev) VALUES (?,?);"
        
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{
               
                    sqlite3_bind_text(statement, 1, (_id as NSString).utf8String, -1, nil)
                    sqlite3_bind_text(statement, 2, (_rev as NSString).utf8String, -1, nil)
                     sqlite3_bind_text(statement, 3, (doc as NSString).utf8String, -1, nil)

                    if sqlite3_step(statement) == SQLITE_DONE {
                        print("Data inserted success")
                    }else {
                        print("Data is not inserted in table")
                    }
                } else {
                  print("Query is not as per requirement")
                }
        
    }
    //https://www.wepstech.com/sqlite-in-ios-with-swift-5/
    func createDB() -> OpaquePointer? {

            let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathExtension(path)
            
            var db : OpaquePointer? = nil
            
            if sqlite3_open(filePath.path, &db) != SQLITE_OK {
                print("There is error in creating DB")
                return nil
            }else {
                print("Database has been created with path \(path)")
                print(filePath.path)
                return db
            }
        }
    
    func createTable()  {
            let query = "CREATE TABLE IF NOT EXISTS willdo(id INTEGER PRIMARY KEY AUTOINCREMENT,_id TEXT, _rev TEXT, doc TEXT);"
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

