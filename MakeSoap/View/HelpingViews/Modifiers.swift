//
//  Modifiers.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 18/03/22.
//

import Foundation
import SwiftUI

struct TitleModifier: ViewModifier {
    @ScaledMetric var size: CGFloat = 1
    func body(content: Content) -> some View {
        content
            .font(.system(size: 24 * size, weight: .semibold, design: .rounded))
            .foregroundColor(.accentColor)
    }
}

struct Title2Modifier: ViewModifier {
    @ScaledMetric var size: CGFloat = 1
    func body(content: Content) -> some View {
        content
            .font(.title3)
            //.font(.system(size: size * 20, weight: .medium, design: .rounded))
//            .font(.system(.title3, design: .rounded))
////            .font(.title3)
//            .medium()
    }
}

struct Title2ModifierSemibold: ViewModifier {
    @ScaledMetric var size: CGFloat = 1
    func body(content: Content) -> some View {
        content
          //  .font(.system(Font.title3.weight(.semibold)))
            .font(.title3.weight(.semibold))
            //.font(.system(size: size * 20, weight: .medium, design: .rounded))
//            .font(.system(.title3, design: .rounded))
////            .font(.title3)
//            .medium()
    }
}

struct TextStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .multilineTextAlignment(.trailing)
            
    }
}

struct BodyTextModifier: ViewModifier {
    @ScaledMetric var size: CGFloat = 1
    func body(content: Content) -> some View {
        content
            .font(.system(size: 22 * size, weight: .regular, design: .rounded))
    }
}

struct BodyTextSemiboldModifier: ViewModifier {
    @ScaledMetric var size: CGFloat = 1
    func body(content: Content) -> some View {
        content
            .font(.system(size: 22 * size, weight: .semibold, design: .rounded))
    }
}

struct TextFieldStyle: ViewModifier {
    @FocusState var isInputActive: Bool
    func body(content: Content) -> some View {
        content
            .textFieldStyle(.roundedBorder)
            .keyboardType(.numbersAndPunctuation)
            .multilineTextAlignment(.trailing)
            .frame(maxWidth: 100)
            .disableAutocorrection(true)
    }
}
