//
//  EnvironmentObject_SwiftUIApp.swift
//  EnvironmentObject_SwiftUI
//
//  Created by Josh R on 5/6/21.
//

import SwiftUI

@main
struct EnvironmentObject_SwiftUIApp: App {
    @StateObject var todos = TodoStorage()

    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(todos)
        }
    }
}
