//
//  GroupBoxView.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 16/03/22.
//

import Foundation
import SwiftUI

struct CalculatorGroupBoxStyle: GroupBoxStyle {
    @Environment(\.colorScheme) var colorScheme
//    var lightColor: Color = .
//    var darkColor: Color = .white
    
    func makeBody(configuration: Configuration) -> some View {
       
        VStack(alignment: .leading) {
            configuration.label
                .modifier(TitleModifier())
            //VStack(spacing: 10) {
            Spacer(minLength: 15)
                configuration.content
            
            }
        
        .padding()
        .background(colorScheme == .dark ? .ultraThinMaterial : .bar)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}
