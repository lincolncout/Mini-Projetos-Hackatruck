//
//  SecondView.swift
//  Aula3Parte2
//
//  Created by Student18 on 11/04/23.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        NavigationStack{
            NavigationView {
                NavigationLink(destination: ThirdView()) {
                    Text("Clica aqui")
                }
            }
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
