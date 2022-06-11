//
//  ProcessViewInfo.swift
//  Make Soap
//
//  Created by Galina Aleksandrova on 06/06/22.
//

import SwiftUI

struct ProcessViewInfo: View {
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment: .leading, spacing: 10) {
                Text("Soap making process")
                    .modifier(Title2Modifier())
                Spacer()
                    .frame(maxHeight: 0)
                Text("Soap is made by combing oils and lye, which cause a chemical reaction - saponification. Soap is ready the moment all the lye has been chemically transformed. The result of the reaction - is metallic salt of a fatty acid, known as ") + Text("soap.").italic().bold() + Text(" The soap is ready the moment all the lye has reacted with oil. ")
                
                    //.font(.footnote)
                Text("Cold process:")
                    .font(.headline)
                Text("Soponification reaction occuring natyrally A cold processed soap is ready the moment all the lye has been chemically transformed and there is none of it left. This processed called soap curing and usually takes 4-6 weeks.")
                Text("Hot process:")
                    .font(.headline)
                Text("but instead of stick blending until it hits trace (a thick batter) and being poured into a mold, it is mixed and heated in the slow cooker, somewhere between 140 degrees F and 176 degrees F.   That slow cooker helps that batter go through saponification until the soap reaches gel phase (1-2 hours).The hot procedure involves heating the soap using an external heat source until it reaches the gel phase, after which it is poured into the mould.")
//
            }
        }
        
    }
}

struct ProcessViewInfo_Previews: PreviewProvider {
    static var previews: some View {
        ProcessViewInfo()
    }
}
