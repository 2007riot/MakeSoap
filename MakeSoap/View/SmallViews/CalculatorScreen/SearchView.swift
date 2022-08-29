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
    
    
    var searchFor: SearchFor
    
    public init(editing: Binding<Bool>, inputText: Binding<String>, searchFor: SearchFor) {
        self._editing = editing
        self._inputText = inputText
        self.verticalOffset = 0
        self.horizontalOffset = 0
        self.searchFor = searchFor
    }
    
    public init(editing: Binding<Bool>, text: Binding<String>, verticalOffset: CGFloat, horizontalOffset: CGFloat, searchFor: SearchFor) {
        self._editing = editing
        self._inputText = text
        self.verticalOffset = verticalOffset
        self.horizontalOffset = horizontalOffset
        self.searchFor = searchFor
        
    }
    
    
    var body: some View {
        
        ScrollView {
            
            LazyVStack(spacing: 0) {
                
                switch searchFor {
                    case .oil:
                        oilSearchView
                    case .essentialOil:
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
            
            HStack {
                //MARK: Think how to capitalize with localization
                
                oil.isInRecipe ? Text(NSLocalizedString(oil.name, comment: "oil name").capitalized).foregroundColor(.accentColor) : Text(NSLocalizedString(oil.name, comment: "oil name").capitalized)
                Spacer()
                oil.isInRecipe ? Image(systemName: "checkmark").foregroundColor(.accentColor) : nil
                
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
                    oilVM.choose(oil: oil)
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
                esOil.isInRecipe ? Text(NSLocalizedString(esOil.name, comment: "es oil").capitalized).foregroundColor(.accentColor) : Text(NSLocalizedString(esOil.name, comment: "es oil").capitalized)
                Spacer()
                esOil.isInRecipe ? Image(systemName: "checkmark").foregroundColor(.accentColor) : nil
                
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
                    oilVM.choose(esOil: esOil)
                    oilVM.calculateEsOilWeight()
                }
            }
            )
            Divider()
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    
    static let oilVM = OilViewModel()
    
    static var previews: some View {
        SearchView(editing: .constant(false), inputText: .constant("o"), searchFor: .oil)
            .environmentObject(oilVM)
            .padding()
            
    }
}
