//
//  ContentView.swift
//  Aula5Noite
//
//  Created by Student18 on 14/04/23.
//

import SwiftUI


struct ContentView: View {
    @StateObject var estacionamentoModel = EstacionamentoModel()
    var body: some View {
        VStack{
            ForEach(estacionamentoModel.estacionamento, id: \._id){ estacionamento in
                Text(estacionamento.endereco!)
                
                ForEach(estacionamento.carros, id: \.modelo){ carro in
                    Text(carro.modelo!)
                    Text(String(carro.preco!))
                }
            }
        }.onAppear(){
            estacionamentoModel.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
