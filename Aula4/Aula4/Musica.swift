//
//  Musicas.swift
//  Aula4
//
//  Created by Student18 on 12/04/23.
//

import Foundation

struct Musica: Identifiable, Hashable{
    var id = UUID()
    var titulo: String
    var descricao: String
    var imageSource: String
}
