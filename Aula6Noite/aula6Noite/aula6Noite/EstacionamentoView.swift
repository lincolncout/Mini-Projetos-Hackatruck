//
//  ViewModel.swift
//  Aula5Noite
//
//  Created by Student18 on 14/04/23.
//

import Foundation

struct Data: Decodable{
    var films: [String]?
    var shortFilms: [String]?
    var tvShows: [String]?
    var videoGames: [String]?
    var parkAtracctions: [String]?
    var enemies: [String]?
    var _id: Int
    var name: String?
    var imageUrl: String?
    var url: String?
}

struct Info: Decodable{
    var totalPages: Int
    var nextPage: String
    var count: Int
}

struct DisneyCharacters: Decodable {
    var data: [Data]
//    var info: Info
}

class ViewModel: ObservableObject{
    var informacoes = Info(totalPages: 1, nextPage: "sa", count: 150)
    @Published var chars : DisneyCharacters = DisneyCharacters(data: [])
    
    func fetch(){
        guard let url = URL(string: "https://api.disneyapi.dev/character") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let parsed = try JSONDecoder().decode(DisneyCharacters.self, from: data)
                
                DispatchQueue.main.async {
                    self?.chars = parsed
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
}
