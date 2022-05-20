//
//  SheetWithDetentsModifier.swift
//  Make Soap!
//
//  Created by Galina Aleksandrova on 05/05/22.
//

import Foundation
import SwiftUI

struct halfSheetViewModifier<SwiftUIContent>: ViewModifier where SwiftUIContent: View {
    
    @Binding var isPresented: Bool
    let onDismiss: (() -> Void)?
    let swiftUIContent: SwiftUIContent
    
    init(isPresented: Binding<Bool>, onDismiss: (() -> Void)? = nil, content: () -> SwiftUIContent) {
        self._isPresented = isPresented
        self.onDismiss = onDismiss
        self.swiftUIContent = content()
       
    }
    
    func body(content: Content) -> some View {
        ZStack {
            SheetPresentationForSwiftUI($isPresented,onDismiss: onDismiss) {
                swiftUIContent
            }.fixedSize()
            content
        }
    }
}
