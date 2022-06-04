//
//  EssentialOilRow.swift
//  Make Soap!
//
//  Created by Galina Aleksandrova on 05/05/22.
//

import SwiftUI

struct EssentialOilRow: View {
    
    @EnvironmentObject var esOil: EssentialOil
    @EnvironmentObject var oilVM: OilViewModel
    @State var showInfoSheet = false
    
    var body: some View {
        HStack {
            Text(esOil.name)
            Button {
                showInfoSheet.toggle()
            } label: {
            GreenQuestionButtonView()
            }
                
            Spacer()
                
            TextField("Value", value: $esOil.userPercent, format: .number)
                .modifier(TextFieldStyle())
                    .onChange(of: esOil.userPercent, perform: { n in
                        print("\(String(describing: esOil.userPercent)): \(String(describing: n))")
                    })

                    .onSubmit {
                        oilVM.isPerc ? oilVM.check100perc() : oilVM.calculateTotalOilWeight()

                    }
            Text("%")
            Button {
                withAnimation(.easeOut) {
                    oilVM.changeFavorite(esOil: esOil)
                    oilVM.calculateEsOilWeight()
                }
                
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
                    .font(.caption2)
            }
            
       
    }
        .halfSheet(isPresented: $showInfoSheet) {
            //nothing
        } content: {
            EsOilInfoView(esOil: esOil)
                .padding()
        }

        Divider()
}
}


struct EssentialOilRow_Previews: PreviewProvider {
    
    static let oilVM = OilViewModel()
    static let esOil = EssentialOil.example()
    
    static var previews: some View {
        EssentialOilRow()
            .environmentObject(oilVM)
            .environmentObject(esOil)
            .padding()
    }
}
