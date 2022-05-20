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

struct EsOilInfoView: View {
    var esOil: EssentialOil
    var body: some View {
        ScrollView {
        VStack(alignment: .leading, spacing: 10) {
            Text("Info")
                .modifier(Title2Modifier())
            
            Text("The IFRA Standards (The International Fragrance Association) recommend adding up to 5 % of essential oils in rinse-off products like soap.")
            Text("The amount of essential oil is calculated based on the total amount of oils used in the recipe, not the soap weight.")
            Text(esOil.name)
                .modifier(Title2Modifier())
            
            Group {
            Text(esOil.latinName)
                .italic()
            Text("Scent:")
                .italic()
                .bold()
            Text(esOil.scent)
            }
            Text("Blends well with essential oils:")
                .italic()
                .bold()
            Text(esOil.blendsWith.capitalized)
            Text("Recommended value:")
                .italic()
                .bold()
            Text("\(esOil.rate, specifier: "%.1f") %")
            
        }
        }
        
    }
}
