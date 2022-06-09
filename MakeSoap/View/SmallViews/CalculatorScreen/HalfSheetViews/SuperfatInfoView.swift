//
//  SuperfatInfoView.swift
//  Make Soap
//
//  Created by Galina Aleksandrova on 04/06/22.
//

import SwiftUI

struct SuperfatInfoView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Superfat")
                    .modifier(Title2Modifier())
                Text("Superfat in the soap means having a little bit more oils in the batch. It creates a more moisturized, soft soap bar. If you use 0 % superfat you have a big chance to have lye leftovers in the soap, because individual plants and oils can vary with their saponification values. Adding too much superfat can leave a greasy feel on the skin.")
                Text("General recomended superfat: ") + Text("from 5% to 20%").bold().italic()
                Text("In hot process soap ")
            }
        }
    }
}

struct SuperfatInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SuperfatInfoView()
            .padding()
    }
}
