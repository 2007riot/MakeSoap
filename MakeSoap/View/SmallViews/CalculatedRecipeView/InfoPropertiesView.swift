//
//  InfoPropertiesView.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 30/03/22.
//

import SwiftUI

struct InfoPropertiesView: View {
    var info: String
    var body: some View {
        HStack {
            Text(info)
            
        }
            .padding()//.horizontal, 25
            .padding(.vertical, 25)
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: 50,
                   alignment: .leading)
            .contentShape(Rectangle())
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct InfoPropertiesView_Previews: PreviewProvider {
    static var previews: some View {
        InfoPropertiesView(info: "Galina")
    }
}
