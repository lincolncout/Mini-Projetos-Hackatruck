//
//  ContentView.swift
//  Aula3Parte2
//
//  Created by Student18 on 11/04/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSheet = false
    
    var aluno = Aluno (
        nome: "Lincoln",
        surname: "Coutinho",
        website: "hackatruck.com.br",
        nickname: "linkin"
    )
    
    var body: some View {
        NavigationStack{
            NavigationLink(destination: FirstView(alunoLincoln:aluno)) {
                Text("Modo 1")
            }
            NavigationLink(destination: SecondView()) {
                Text("Modo 2")
            }
            
            Button("Modo 3") {
                showingSheet.toggle()
            }.sheet(isPresented: $showingSheet) {
                ThirdView()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
