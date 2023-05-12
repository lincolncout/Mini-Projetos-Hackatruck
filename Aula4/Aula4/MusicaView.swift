//
//  MusicaView.swift
//  Aula4
//
//  Created by Student18 on 12/04/23.
//

import SwiftUI

struct MusicaView: View {
    
    var musicaDestino: Musica
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, .black, .black]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all)
                .frame(width: .infinity, height: .infinity)
            VStack{
                Spacer()
                AsyncImage(url: URL(string: musicaDestino.imageSource),
                           content: { image in
                    image.resizable()
                        .frame(maxWidth: 300, maxHeight: 300)
                },
                           placeholder: {
                    ProgressView()
                })
                Text(musicaDestino.titulo).foregroundColor(.white).font(.title)
                Text(musicaDestino.descricao).foregroundColor(.white).font(.subheadline)
                
                Spacer()
                HStack{
                    Label("", systemImage: "shuffle").font(.title2).foregroundColor(.white)
                    Label("", systemImage: "backward.end.fill").font(.title2).foregroundColor(.white)
                    Label("", systemImage: "play.fill").font(.title2).foregroundColor(.white)
                    Label("", systemImage: "forward.end.fill").font(.title2).foregroundColor(.white)
                    Label("", systemImage: "repeat").font(.title2).foregroundColor(.white)

                }
                Spacer()
            }
        }
    }
}

struct MusicaView_Previews: PreviewProvider {
    static var previews: some View {
        var musicaView = Musica(titulo: "dasg", descricao: "hdsh", imageSource: "https://randomwordgenerator.com/img/picture-generator/action-3810699_640.jpg")
        MusicaView(musicaDestino: musicaView)
    }
}
