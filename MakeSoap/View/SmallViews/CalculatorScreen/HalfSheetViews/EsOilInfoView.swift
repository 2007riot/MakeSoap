//
//  EsOilInfoView.swift
//  Make Soap
//
//  Created by Galina Aleksandrova on 13/06/22.
//

import SwiftUI

struct EsOilInfoView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
        VStack (alignment: .leading, spacing: 10) {
        Text("The IFRA Standards (The International Fragrance Association) recommend adding up to 5 % of essential oils in rinse-off products like soap.")
                .multilineTextAlignment(.leading)
        Text("The amount of essential oil is calculated based on the total amount of oils used in the recipe, not the soap weight.")
        
        }
    }
    }
}

struct EsOilInfoView_Previews: PreviewProvider {
    static var previews: some View {
        EsOilInfoView()
    }
}
