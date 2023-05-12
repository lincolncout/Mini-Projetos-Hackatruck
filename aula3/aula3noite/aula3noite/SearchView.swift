//
//  SearchView.swift
//  aula3noite
//
//  Created by Student18 on 11/04/23.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: PhotoView()) {
                Text("Navigation")
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
