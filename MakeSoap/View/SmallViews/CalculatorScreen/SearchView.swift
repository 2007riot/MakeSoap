//
//  SearchOilMenu.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 15/03/22.
//

import SwiftUI

struct SearchView: View {
    
    @EnvironmentObject var oilVM: OilViewModel
    @Binding var editing: Bool
    @Binding var inputText: String
    @State var verticalOffset: CGFloat
    @State var horizontalOffset: CGFloat
    
    @StateObject var oilStoreDefaultData = OilStore(isDefaultData: true)
    @StateObject var essentialOilStore = EssentialOilStore()
    
    var searchFor: String
    
    public init(editing: Binding<Bool>, inputText: Binding<String>, searchFor: String) {
        self._editing = editing
        self._inputText = inputText
        self.verticalOffset = 0
        self.horizontalOffset = 0
        self.searchFor = searchFor
    }
    
    public init(editing: Binding<Bool>, text: Binding<String>, verticalOffset: CGFloat, horizontalOffset: CGFloat, searchFor: String) {
        self._editing = editing
        self._inputText = text
        self.verticalOffset = verticalOffset
        self.horizontalOffset = horizontalOffset
        self.searchFor = searchFor
        
    }
    
    
    var body: some View {
        
        ScrollView {
            
            LazyVStack(spacing: 0) {
                //                 switch searchFor {
                //                 case oilSearch:
                //                     oilSearchView
                //                 case essentialOilSearch:
                //                     essentialOilsearchView
                //                 default:
                //                     Text("Nothing to search")
                //                 }
                //  searchFor == oilSearch ? oilSearchView : essentialOilsearchView
                if searchFor == oilSearch {
                    oilSearchView
                } else {
                    essentialOilsearchView
                }
                
            }
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .isHidden(!editing, remove: !editing)
        }
    }
    
    var oilSearchView: some View {
        ForEach(oilVM.searchedOils, id: \.id) { oil in
            
            //            oilVM.searchedOils.isEmpty ? Text("No oils found") : Text(oil.name)
            HStack {
                oil.isChosen ? Text(oil.name).foregroundColor(.accentColor) : Text(oil.name)
                Spacer()
                oil.isChosen ? Image(systemName: "checkmark").foregroundColor(.accentColor) : nil
                
            }
            .padding()
            .padding(.vertical, 25)
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: 50,
                   alignment: .leading)
            .contentShape(Rectangle())
            .onTapGesture(perform:  {
                withAnimation(.easeIn) {
                    editing = false
                    self.endTextEditing()
                    oilVM.changeFavorite(oil: oil)
                    oilVM.isPerc ? oilVM.check100perc() : oilVM.calculateTotalOilWeight()
                    
                }
                
                
            }
            )
            Divider()
            
        }
    }
    var essentialOilsearchView: some View {
        ForEach(oilVM.searchedEsOils, id: \.name) { esOil in
            HStack {
                esOil.isChosen ? Text(esOil.name).foregroundColor(.accentColor) : Text(esOil.name)
                Spacer()
                esOil.isChosen ? Image(systemName: "checkmark").foregroundColor(.accentColor) : nil
                
            }
            
            .padding()
            .padding(.vertical, 25)
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: 50,
                   alignment: .leading)
            .contentShape(Rectangle())
            .onTapGesture(perform:  {
                withAnimation(.easeIn) {
                    editing = false
                    self.endTextEditing()
                    oilVM.changeFavorite(esOil: esOil)
                    oilVM.calculateEsOilWeight()
                }
            }
            )
            Divider()
        }
        
    }
}

