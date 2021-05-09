//
//  Todo.swift
//  EnvironmentObject_SwiftUI
//
//  Created by Josh R on 5/7/21.
//

import Foundation

struct Todo: Hashable, Identifiable {
    var dataCreated = Date()
    var id = UUID().uuidString
    var isCompleted: Bool = false
    var name: String
}
