//
//  SoapPropertyRow.swift
//  Make Soap!
//
//  Created by Galina Aleksandrova on 10/05/22.
//

import SwiftUI
import PartialSheet

struct SoapPropertyRow: View {
    
    @Binding var showInfoSheet: Bool
    
    let name: String
    let recomendedValue: String
    let value: Double
    let color: Color
    let recomendationText: String
    let propertyExplained : String
    
    var body: some View {
        // MARK: think about localized string key and string interpolation, because HStack is not a solution!!!
        HStack {
            Text(NSLocalizedString(name, comment: "name of property row"))
                .modifier(Title2Modifier())
            if UIDevice.current.userInterfaceIdiom == .phone {
                
                if #available(iOS 16, *) {
                    GreenQuestionButtonView(isToggled: $showInfoSheet)
                        .sheet(isPresented: $showInfoSheet) {
                            propertyInfoView
                                .presentationDetents([.height(UIScreen.main.bounds.height * 0.2 )])
                        }
                } else {
                    GreenQuestionButtonView(isToggled: $showInfoSheet)
                        .partialSheet(isPresented: $showInfoSheet,
                                      type: .scrollView(height: (UIScreen.main.bounds.height * 0.2 ), showsIndicators: false),
                                      iPhoneStyle: UIConstants.iPhoneStyle,
                                      content: {
                            propertyInfoView
                        })
                }
            } else {
                GreenQuestionButtonView(isToggled: $showInfoSheet)
                    .popover(isPresented: $showInfoSheet, arrowEdge: .trailing) {
                        propertyInfoView
                    }
            }
            Spacer()
            Text("\(value, specifier: "%.0f") %")
                .modifier(TextStyleModifier())
        }
    }
    
    var propertyInfoView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("\(NSLocalizedString(name.capitalized, comment: "soap property name")) soap property")
            
                .modifier(Title2Modifier())
            
            Text("Responsible for \(NSLocalizedString(propertyExplained, comment: "explanation of soap property"))")
            
            VStack {
                HStack {
                    Text("Recommended value")
                        .bold()
                    Spacer()
                    Text("\(recomendedValue) %")
                        .bold()
                }
                HStack {
                    Text("Your value")
                    Spacer()
                    Text("\(value, specifier: "%.0f") %")
                        .foregroundColor(color)
                }
            }
        }
        
        .padding()
    }
    
}

struct SoapPropertyRow_Previews: PreviewProvider {
    
    static let oilVM = OilViewModel()
    
    static var previews: some View {
        SoapPropertyRow(showInfoSheet: .constant(false), name: "Hardness", recomendedValue: "35-45", value: oilVM.hardnessInd, color: oilVM.hardnessColor, recomendationText: oilVM.hardnessSuggestion, propertyExplained: "Hardness")
            .padding()
        
    }
}


