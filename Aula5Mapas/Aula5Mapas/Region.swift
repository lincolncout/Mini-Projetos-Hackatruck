//
//  Region.swift
//  Aula5Mapas
//
//  Created by Student18 on 13/04/23.
//

import Foundation
import MapKit

struct Region: Identifiable{
    var id = UUID()
    var nome: String
    var descricao: String
    var imageSource: String
    var latLot : CLLocationCoordinate2D
}
