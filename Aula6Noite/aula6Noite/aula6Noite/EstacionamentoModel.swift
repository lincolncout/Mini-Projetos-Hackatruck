//
//  ViewModel.swift
//  Aula5Noite
//
//  Created by Student18 on 14/04/23.
//

import Foundation

struct Carros: Decodable{
    var modelo: String?
    var ano: Int?
    var cor: String?
    var preco: Float?
}

struct Estacionamento: Decodable{
    var _id: String?
    var carros: [Carros]
    var nomeEstacionamento: String?
    var endereco: String?
    var vagas: Int?
}

class EstacionamentoModel: ObservableObject{
    @Published var estacionamento : [Estacionamento] = []
    
    func fetch(){
        guard let url = URL(string: "http://127.0.0.1:1880/getEstacionamento") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let parsed = try JSONDecoder().decode([Estacionamento].self, from: data)
                
                DispatchQueue.main.async {
                    self?.estacionamento = parsed
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
}
