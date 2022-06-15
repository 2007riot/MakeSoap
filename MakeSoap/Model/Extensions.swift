//
//  Extensions.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 14/03/22.
//

import Foundation
import SwiftUI
import PartialSheet


//to hide search menu
public extension View {
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
    
    
    func endTextEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }
}

//extension View {
//    
//    func halfSheet<Content>(
//        isPresented: Binding<Bool>,
//        onDismiss: (() -> Void)?,
//        content: @escaping () -> Content) -> some View where Content : View {
//            modifier(
//                halfSheetViewModifier(
//                    isPresented: isPresented,
//                    onDismiss: onDismiss,
//                    content: content)
//            )
//        }
//}

