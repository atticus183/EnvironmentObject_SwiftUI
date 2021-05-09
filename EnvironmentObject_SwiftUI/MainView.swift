//
//  MainView.swift
//  EnvironmentObject_SwiftUI
//
//  Created by Josh R on 5/6/21.
//
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            TodosAtoZ().tabItem {
                Label("A to Z", systemImage: "list.dash")
            }

            TodosZtoA().tabItem {
                Label("Z to A", systemImage: "list.triangle")
            }

            TodosByDateCreated().tabItem {
                Label("By Date", systemImage: "calendar.circle.fill")
            }
        }.accentColor(.orange)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(TodoStorage())
    }
}
