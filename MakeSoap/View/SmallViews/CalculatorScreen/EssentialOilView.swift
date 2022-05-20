//
//  EssentialOilView.swift
//  Make Soap!
//
//  Created by Galina Aleksandrova on 04/05/22.
//

import SwiftUI

struct EssentialOilView: View {
    @EnvironmentObject var oilVM: OilViewModel
    @State var editing: Bool = false
    var body: some View {
        GroupBox(label:
                    Text("Essential Oils")) {
            VStack {
                            TextField("Find Essential Oil", text: $oilVM.inputTextEsOil, onEditingChanged: { edit in
                                
                                self.editing = edit
                                
                            })
                            .disableAutocorrection(true)
                            .textFieldStyle(.roundedBorder)
                            
                            SearchView(editing: $editing, inputText: $oilVM.inputTextEsOil, searchFor: essentialOilSearch)
                            
                            ForEach(oilVM.chosenEsOils, id: \.id) { esOil in
                               
                                EssentialOilRow().environmentObject(esOil)
                                
                        }
            }
        } .groupBoxStyle(CalculatorGroupBoxStyle())
    }
}


