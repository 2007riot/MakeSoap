//
//  EssentialOilRow.swift
//  Make Soap!
//
//  Created by Galina Aleksandrova on 05/05/22.
//

import PartialSheet
import SwiftUI


struct EssentialOilRow: View {
    
    @EnvironmentObject var esOil: EssentialOil
    @EnvironmentObject var oilVM: OilViewModel
    @State private var showInfoSheet = false
    
    var body: some View {
        
        VStack {
        HStack {
            Text(esOil.name)
            if UIDevice.current.userInterfaceIdiom == .phone {
            Button {
                showInfoSheet.toggle()
            } label: {
                GreenQuestionButtonView()
            }
            .partialSheet(isPresented: $showInfoSheet,
                          type: .scrollView(height: 250, showsIndicators: false),
                          iPhoneStyle: UIConstants.iPhoneStyle,
                          content: {
                EsOilDescriptionView(esOil: esOil)
                    .padding()
            })
            } else {
                Button {
                    showInfoSheet.toggle()
                } label: {
                    GreenQuestionButtonView()
                }
                .popover(isPresented: $showInfoSheet) {
                    EsOilDescriptionView(esOil: esOil)
                        .padding()
                }
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
        Divider()
        }
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
