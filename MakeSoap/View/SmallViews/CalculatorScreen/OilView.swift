//
//  AnotherOilView.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 17/03/22.
//

import SwiftUI

struct OilView: View {
    
    @EnvironmentObject var oilVM: OilViewModel
    @Environment(\.colorScheme) var colorScheme
    @State var editing: Bool = false
    
    var body: some View {
        
        GroupBox(label:
                    Text("Oils")
            .modifier(TitleModifier())
                 ) {
            Picker("Choose unit", selection: $oilVM.unit) {
                ForEach(oilVM.units, id: \.self) {
                    Text(LocalizedStringKey($0))
                        .fixedSize()
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
            
            SearchView(editing: $editing, inputText: $oilVM.inputTextOil, searchFor: .oil)
            
            HStack {
                Text("Total weight")
                    .modifier(Title2ModifierSemibold())
                
                Spacer()
                if oilVM.isPerc {
                    TextField("Value", value: $oilVM.totalOilAmount, format: .number)
                        .modifier(TextFieldStyle())
                    Text(LocalizedStringKey(oilVM.si))
                } else {
                    Text("\(oilVM.totalOilAmount, specifier: "%.2f") \(NSLocalizedString(oilVM.si, comment: ""))")
                        .modifier(BodyTextModifier())
                }
            }
            
            Toggle(isOn: $oilVM.isPerc) {
                Text("Use percentages")
                    .modifier(Title2Modifier())
                Spacer()
            }
            .onChange(of: oilVM.isPerc) { _ in
                oilVM.check100perc()
            }
            if oilVM.isPerc && oilVM.percLeft != 0  {
                
                HStack {
                    Text(NSLocalizedString(oilVM.percText, comment: "comment on exceeding/remaining perc"))
                        .foregroundColor(colorScheme == .dark ? oilVM.percColorWhite : oilVM.percColorBlack)
                    Spacer()
                    Text ("\(oilVM.percLeft, specifier: "%.2f") %")
                        .foregroundColor(colorScheme == .dark ? oilVM.percColorWhite : oilVM.percColorBlack)
                }
            }
            
            
            
            ForEach(oilVM.chosenOils, id: \.id) { o in
                
                OilRow().environmentObject(o)
            }
            
        }.groupBoxStyle(CalculatorGroupBoxStyle())
        
    }
}

struct OilView_Previews: PreviewProvider {
    
    static let oilVM = OilViewModel()
    
    static var previews: some View {
        OilView()
            .environmentObject(oilVM)
    }
}
