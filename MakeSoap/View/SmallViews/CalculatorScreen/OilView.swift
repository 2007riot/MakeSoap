//
//  AnotherOilView.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 17/03/22.
//

import SwiftUI

struct OilView: View {
    @EnvironmentObject var oilVM: OilViewModel
    @State var editing: Bool = false
    
    var body: some View {
//        VStack(spacing: 1) {
            GroupBox(label:
                        Text("Oils")) {
                Picker("Choose unit", selection: $oilVM.unit) {
                    ForEach(oilVM.units, id: \.self) {
                                Text($0)
                }
                }
                .pickerStyle(.segmented)
                .onChange(of: oilVM.unit) { _ in
                    oilVM.changeUnits()
                }
                TextField("Find oil", text: $oilVM.inputTextOil, onEditingChanged: { edit in
                    
                    self.editing = edit
                    
                })
               
                    .disableAutocorrection(true)
                    .textFieldStyle(.roundedBorder)
                
                    SearchView(editing: $editing, inputText: $oilVM.inputTextOil, searchFor: oilSearch)
             
                    Toggle(isOn: $oilVM.isPerc) {
                        Text("Use percentages")
                            .modifier(BodyTextSemiboldModifier())
                        Spacer()
                    }
                    .onChange(of: oilVM.isPerc) { _ in
                        oilVM.check100perc()
                    }
                if oilVM.isPerc && oilVM.percLeft != 0  {
                    
                    HStack {
                        Text ("\(oilVM.percText)")
                        Spacer()
                        Text ("\(oilVM.percLeft, specifier: "%.2f") %")
                    }
                }
               
                    HStack {
                        Text("Total weight")
                            .modifier(BodyTextSemiboldModifier())
                            
                        Spacer()
                        if oilVM.isPerc {
                            TextField("Value", value: $oilVM.totalOilAmount, format: .number)
                                .modifier(TextFieldStyle())
                            Text(oilVM.si)
                        } else {
                        Text("\(oilVM.totalOilAmount, specifier: "%.2f") \(oilVM.si)")
                            .modifier(BodyTextModifier())
                        }
                    }
                
                    ForEach(oilVM.chosenOils, id: \.id) { o in
                       
                        OilRow().environmentObject(o)
                    }
                    
            }.groupBoxStyle(CalculatorGroupBoxStyle())
        
    }
}

struct OilView_Previews: PreviewProvider {
    static var previews: some View {
        OilView()
    }
}