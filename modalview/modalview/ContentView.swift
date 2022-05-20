//
//  ContentView.swift
//  modalview
//
//  Created by Galina Aleksandrova on 27/04/22.
//

import SwiftUI

struct ContentView: View {
    @State private var bottomSheetShown = false
    @State var showSheet = false

    var body: some View {
        
        GeometryReader { geometry in
            Color.green
            //if showSheet {
            BottomSheetView(
                isOpen: self.$bottomSheetShown,
                maxHeight: geometry.size.height * 0.9
            ) {
                Color.blue
            }
            
        }.edgesIgnoringSafeArea(.all)
        
    }
}
