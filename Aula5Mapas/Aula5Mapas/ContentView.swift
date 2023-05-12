//
//  ContentView.swift
//  Aula5Mapas
//
//  Created by Student18 on 13/04/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State public var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: -34.6224357,
            longitude: -58.5072884
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 1, longitudeDelta: 1
        )
    )
    
    @State private var showingSheet = false

    
    @State private var regioes = [
        Region(nome: "Argentina", descricao: "paisLindo", imageSource: "https://www.ufpb.br/pf-ufpb/icons/country-mega-pack/argentina.png/@@images/image.png", latLot: CLLocationCoordinate2D(latitude: -34.6224357, longitude: -58.5072884)),
        
        Region(nome: "Uruguai", descricao: "paisLindo", imageSource: "https://www.ufpb.br/pf-ufpb/icons/country-mega-pack/argentina.png/@@images/image.png", latLot: CLLocationCoordinate2D(latitude: -32.5928689, longitude: -58.4255914)),
        
        Region(nome: "Chile", descricao: "paisLindo", imageSource: "https://www.ufpb.br/pf-ufpb/icons/country-mega-pack/argentina.png/@@images/image.png", latLot: CLLocationCoordinate2D(latitude: -34.892107, longitude: -109.5109857)),
        
        Region(nome: "Brasil", descricao: "paisLindo", imageSource: "https://www.ufpb.br/pf-ufpb/icons/country-mega-pack/argentina.png/@@images/image.png", latLot: CLLocationCoordinate2D(latitude: -13.4132403, longitude: -73.1654936))
    ]
    
    @State var auxiliar = Region(nome: "", descricao: "", imageSource: "", latLot: CLLocationCoordinate2D(latitude: -13.4132403, longitude: -73.1654936))
    
    
    
    var body: some View {
        VStack{
            Map(coordinateRegion: $region,
                        annotationItems: regioes
                    ) { regiao in
                MapAnnotation(coordinate: regiao.latLot) {
                    Image(systemName: "pin.fill").foregroundColor(.blue).onTapGesture {
                            self.showingSheet = true
                        }
                }
            }// map view
                    .sheet(isPresented: $showingSheet){
                        VStack{
                            Text("\(auxiliar.nome)").font(.title).bold().padding(.top,10).padding(.bottom, 20)
                            
                            AsyncImage(url: URL(string: auxiliar.imageSource)){
                                image in image
                                    .resizable()
                                    .scaledToFit()
                            }placeholder: {
                                ProgressView()
                            }.padding(.bottom, 20)
                            ScrollView{
                                Text("\(auxiliar.descricao)")
                            }
                        }
                        
                    }
            HStack{
                ForEach(regioes) { regiao in
                    Button {
                        region.center = regiao.latLot;
                        auxiliar.descricao = regiao.descricao
                        auxiliar.nome = regiao.nome
                        auxiliar.imageSource = regiao.imageSource
                        auxiliar.latLot = regiao.latLot
                    } label: {
                        Text(regiao.nome)
                            .padding(10)
                        
                        
                    }
                    .contentShape(Rectangle())
                }
            }
        }
        
    }
}

func addition(a: Int, b: Int) -> Int {
    return a + b
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
