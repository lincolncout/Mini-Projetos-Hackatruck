//
//  ItemView.swift
//  aula3noite
//
//  Created by Student18 on 11/04/23.
//

import SwiftUI

struct ItemView: View {
    var body: some View {
        List(1...5, id: \.self) {
                Text("item \($0)")
            }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView()
    }
}
