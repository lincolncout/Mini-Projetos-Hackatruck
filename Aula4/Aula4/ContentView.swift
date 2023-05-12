//
//  ContentView.swift
//  Aula4
//
//  Created by Student18 on 12/04/23.
//

import SwiftUI

struct ContentView: View {
    
    var musicas = [
        Musica(titulo: "Titulo 0", descricao: "Decricao 0", imageSource: "https://randomwordgenerator.com/img/picture-generator/action-3810699_640.jpg"),
        Musica(titulo: "Titulo 1", descricao: "Decricao 1", imageSource: "https://randomwordgenerator.com/img/picture-generator/action-3810699_640.jpg"),
        Musica(titulo: "Titulo 2", descricao: "Decricao 2", imageSource: "https://randomwordgenerator.com/img/picture-generator/action-3810699_640.jpg"),
        Musica(titulo: "Titulo 3", descricao: "Decricao 3", imageSource: "https://randomwordgenerator.com/img/picture-generator/action-3810699_640.jpg"),
        Musica(titulo: "Titulo 4", descricao: "Decricao 4", imageSource: "https://randomwordgenerator.com/img/picture-generator/action-3810699_640.jpg")
    ]
    
    var body: some View {
        NavigationStack{
            // ZStack for background color
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.blue, .black, .black]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all)
                    .frame(width: .infinity, height: .infinity)
                VStack {
                    ScrollView{
                        AsyncImage(url: URL(string: "https://randomwordgenerator.com/img/picture-generator/action-3810699_640.jpg"),
                                   content: { image in
                                       image.resizable()
                                            .frame(maxWidth: 200, maxHeight: 200)
                                   },
                                   placeholder: {
                                       ProgressView()
                                   })
                        Text("HackaFM").foregroundColor(.white).font(.title).frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack{
                            AsyncImage(url: URL(string: "https://randomwordgenerator.com/img/picture-generator/action-3810699_640.jpg"),
                                       content: { image in
                                           image.resizable()
                                                .frame(maxWidth: 20, maxHeight: 20)
                                       },
                                       placeholder: {
                                           ProgressView()
                                       })
                            Text("HackaFM").foregroundColor(.white).font(.subheadline).frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        ForEach(musicas) { musica in
                            NavigationStack{
                                NavigationLink(destination: MusicaView(musicaDestino: musica)){
                                    HStack{
                                        AsyncImage(url: URL(string: musica.imageSource),
                                                   content: { image in
                                                       image.resizable()
                                                            .frame(maxWidth: 60, maxHeight: 60)
                                                   },
                                                   placeholder: {
                                                       ProgressView()
                                                   })
                                        VStack{
                                            Text(musica.titulo).foregroundColor(.white).font(.headline).frame(maxWidth: .infinity, alignment: .leading)
                                            Text(musica.descricao).foregroundColor(.white).font(.headline).frame(maxWidth: .infinity, alignment: .leading)
                                        }
                                        Spacer()
                                        
                                        Image(systemName: "ellipsis").foregroundColor(.white)
                                        
                                    }// HStack
                                }
                            }// NavigationStack
                        } // forEach
                        
                        Text("Sugeridos").foregroundColor(.white).font(.title).padding(.top, 50.0).frame(maxWidth: .infinity, alignment: .leading)
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                VStack{
                                    AsyncImage(url: URL(string: "https://randomwordgenerator.com/img/picture-generator/action-3810699_640.jpg"),
                                               content: { image in
                                                   image.resizable()
                                                        .frame(maxWidth: 180, maxHeight: 180)
                                               },
                                               placeholder: {
                                                   ProgressView()
                                               })
                                    Text("1 - One").foregroundColor(.white).font(.callout).frame(maxWidth: .infinity, alignment: .leading)
                                }
                                VStack{
                                    AsyncImage(url: URL(string: "https://randomwordgenerator.com/img/picture-generator/action-3810699_640.jpg"),
                                               content: { image in
                                                   image.resizable()
                                                        .frame(maxWidth: 180, maxHeight: 180)
                                               },
                                               placeholder: {
                                                   ProgressView()
                                               })
                                    Text("2 - Two").foregroundColor(.white).font(.callout).frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }// HStack sugeridos
                            
                        } // ScrollView sugeridos
                    }// scrollView
                }// VStack
                .padding()
            }// ZStack
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
