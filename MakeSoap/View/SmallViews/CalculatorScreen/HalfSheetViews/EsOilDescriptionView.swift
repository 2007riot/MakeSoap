//
//  EsOilInfoView.swift
//  Make Soap
//
//  Created by Galina Aleksandrova on 04/06/22.
//

import SwiftUI

struct EsOilDescriptionView: View {
    
    var esOil: EssentialOil
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text(esOil.latinName)
                .italic()
            Text("Recommended value:")
                .italic()
                .bold()
            Text("\(esOil.rate, specifier: "%.1f") %")
            Text("Scent:")
                .italic()
                .bold()
            Text(esOil.scent)
            Text("Blends well with essential oils:")
                .italic()
                .bold()
            Text(esOil.blendsWith.capitalized)
            
        }
                Spacer()
            }
        }
        
    }
}

struct EsOilDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        EsOilDescriptionView(esOil: EssentialOil.example())
            .padding()
    }
}
