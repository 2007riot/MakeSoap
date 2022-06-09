//
//  WaterInfoView.swift
//  Make Soap
//
//  Created by Galina Aleksandrova on 06/06/22.
//

import SwiftUI

struct WaterInfoView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Water")
                    .modifier(Title2Modifier())
                Text("")
                
            }
        }
    }
}

struct WaterInfoView_Previews: PreviewProvider {
    static var previews: some View {
        WaterInfoView()
    }
}
