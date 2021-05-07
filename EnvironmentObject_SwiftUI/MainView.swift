//
//  MainView.swift
//  EnvironmentObject_SwiftUI
//
//  Created by Josh R on 5/6/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            //1st tab
            NavigationView {
                TodosAtoZ().navigationTitle("Todos A to Z")
            }.tabItem {
                Label("A to Z", systemImage: "list.dash")
            }

            NavigationView {
                TodosZtoA().navigationTitle("Todos A to A")
            }.tabItem {
                Label("Z to A", systemImage: "list.triangle")
            }

            NavigationView {
                TodosByDateCreated().navigationTitle("by Date Created")
            }.tabItem {
                Label("By Date", systemImage: "calendar.circle.fill")
            }
        }.accentColor(.orange)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
