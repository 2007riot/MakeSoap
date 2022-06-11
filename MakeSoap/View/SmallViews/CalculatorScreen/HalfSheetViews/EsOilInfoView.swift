//
//  EsOilInfoView.swift
//  Make Soap
//
//  Created by Galina Aleksandrova on 04/06/22.
//

import SwiftUI

struct EsOilInfoView: View {
    
    var esOil: EssentialOil
    
    var body: some View {
        ScrollView(showsIndicators: false) {
        VStack(alignment: .leading, spacing: 10) {
            Text("Info")
                .modifier(Title2Modifier())
            
            Text("The IFRA Standards (The International Fragrance Association) recommend adding up to 5 % of essential oils in rinse-off products like soap.")
            Text("The amount of essential oil is calculated based on the total amount of oils used in the recipe, not the soap weight.")
            Text(esOil.name)
                .modifier(Title2Modifier())
            
            Group {
            Text(esOil.latinName)
                .italic()
            Text("Scent:")
                .italic()
                .bold()
            Text(esOil.scent)
            }
            Text("Blends well with essential oils:")
                .italic()
                .bold()
            Text(esOil.blendsWith.capitalized)
            Text("Recommended value:")
                .italic()
                .bold()
            Text("\(esOil.rate, specifier: "%.1f") %")
            
        }
        }
        
    }
}

struct EsOilInfoView_Previews: PreviewProvider {
    static var previews: some View {
        EsOilInfoView(esOil: EssentialOil.example())
            .padding()
    }
}
