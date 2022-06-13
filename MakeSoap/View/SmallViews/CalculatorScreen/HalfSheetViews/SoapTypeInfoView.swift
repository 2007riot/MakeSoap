//
//  SoapTypeInfoView.swift
//  Make Soap
//
//  Created by Galina Aleksandrova on 04/06/22.
//

import SwiftUI

struct SoapTypeInfoView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
        VStack (alignment: .leading, spacing: 10) {
            Text("Solid soap")
                .italic()
                .bold()
            Text("Solid soap (also bar soap) is made by combing oils with sodium hydroxide (NaOH), which is also known as lye.")
            Text("Liquid soap")
                .italic()
                .bold()
            Text("Liquid  soap is made by combining oils with potassium hydroxide (KOH), also known as potash. It's not very liquid soap, it looks more like gel or paste.")
            Text("Hybrid soap")
                .italic()
                .bold()
            Text("Hybrid  soap is made by combining both NaOH and KOH.")
        }
        }
    }
}

struct SoapTypeInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SoapTypeInfoView()
    }
}
