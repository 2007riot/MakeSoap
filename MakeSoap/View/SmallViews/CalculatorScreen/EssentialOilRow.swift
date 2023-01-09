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
            Text(NSLocalizedString(esOil.name, comment: "es oil").capitalized)
            if UIDevice.current.userInterfaceIdiom == .phone {
                
                if #available(iOS 16, *) {
                    GreenQuestionButtonView(isToggled: $showInfoSheet)
                        .sheet(isPresented: $showInfoSheet) {
                            EsOilDescriptionView(esOil: esOil)
                                .presentationDetents([.height(UIScreen.main.bounds.height * 0.3)])
                                .padding()
                        }
                } else {
                    GreenQuestionButtonView(isToggled: $showInfoSheet)
                        .partialSheet(isPresented: $showInfoSheet,
                                                  type: .scrollView(height: UIScreen.main.bounds.height * 0.3, showsIndicators: false),
                                                  iPhoneStyle: UIConstants.iPhoneStyle,
                                                  content: {
                                        EsOilDescriptionView(esOil: esOil)
                                            .padding()
                                    })
                }            } else {
                GreenQuestionButtonView(isToggled: $showInfoSheet)
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
                    oilVM.remove(esOil: esOil)
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
