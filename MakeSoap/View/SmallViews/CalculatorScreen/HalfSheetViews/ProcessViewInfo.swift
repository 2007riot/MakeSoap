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
                Text("Soap is made by combing oils and lye, which cause a chemical reaction - saponification. Soap is ready the moment all the lye has been chemically transformed. The result of the reaction - is glycerin and metallic salt of a fatty acid, known as ") + Text("soap.").italic().bold() + Text(" The soap is ready the moment all the lye has reacted with oil.")
                
                //.font(.footnote)
                Text("Cold process:")
                    .font(.headline)
                Text("Cold saponification uses the heat generated from saponification reaction itself and the process called soap curing and takes 4-8 weeks, depending on the oil.")
                Text("Hot process:")
                    .font(.headline)
                Text("The hot process soap procedure involves heating using an external heat source like an oven, a slow cooker, etc. The process allows you to choose superfat oil. The fragrance is added to the soap once it's ready and doesn't affect the chemical reaction. Hot process soaps are fully saponified before going into the mold and take time only to harden up, which takes up to two weeks.")
            }
        }
        
    }
}

struct ProcessViewInfo_Previews: PreviewProvider {
    static var previews: some View {
        ProcessViewInfo()
    }
}
