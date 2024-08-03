//
//  Notes.swift
//  Willdo
//
//  Created by veto on 29/1/2567 BE.
//

import Foundation
import SwiftUI

struct Note: Identifiable {
    var id  = UUID()
    var title : String
    var content: String
}
