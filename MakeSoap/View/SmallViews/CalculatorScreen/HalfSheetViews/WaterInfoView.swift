//
//  WaterInfoView.swift
//  Make Soap
//
//  Created by Galina Aleksandrova on 06/06/22.
//

import SwiftUI

struct WaterInfoView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10) {
                Text("Water is used to dissolve lye and create a lye solution. Making lye solution, always add the lye to the water, not otherwise, because you can get a caustic volcano. Dissolving lye into the water releases extra energy and the solution can get very hot (or even start boiling), so make sure that the water you are using is cold or even frozen.")
                Text("As the soap cures, some of the water evaporates, making a harder, longer-lasting bar of soap.")
                Text("In the hot process, you can add extra (discounted) water after the soap has cooked. The benefit of it is that instead of water you can add other liquids like milk, wine, beer, etc to enrich the soap.")
                Text("When mixing a lye solution with oils, you can use a sieve to avoid getting undissolved grains of lye into the soap.")
                Text("If your skin comes in contact with lye flush it immediately with water and seek help from a doctor.")
                
            }
        }
    }
}

struct WaterInfoView_Previews: PreviewProvider {
    static var previews: some View {
        WaterInfoView()
    }
}
