//
//  GreenButton.swift
//  Make Soap!
//
//  Created by Galina Aleksandrova on 27/04/22.
//

import SwiftUI

struct GreenButton: View {
    let title: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.accentColor)
                .frame(minWidth: 150, idealWidth: .infinity, maxWidth: .infinity, minHeight: 55, idealHeight: 55, maxHeight: 55, alignment: .center)
                .padding()
            
            Text(title)
                .foregroundColor(.white)
                .font(.title3)
                .bold()
        }
    }
}

struct GreenButton_Previews: PreviewProvider {
    static var previews: some View {
        GreenButton(title: "Tap me")
    }
}
