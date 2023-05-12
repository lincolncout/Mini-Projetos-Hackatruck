//
//  ContentView.swift
//  aula3noite
//
//  Created by Student18 on 11/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomeView()
                .badge(2)
                .tabItem{
                    Label("1",
                    systemImage: "figure.stand.line.dotted.figure.stand")
                }
            ItemView()
                .badge("!")
                .tabItem{
                    Label("2",
                    systemImage: "folder.fill")
                }
            SearchView()
                .badge(20)
                .tabItem{
                    Label("3",
                    systemImage: "link")
                }
            PhotoView()
                .badge(1)
                .tabItem{
                    Label("4",
                    systemImage: "figure.stand")
                }
            ProfileView()
                .badge(5)
                .tabItem{
                    Label("Tes",
                    systemImage: "trash.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
