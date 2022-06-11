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
    let iPhoneStyle = PSIphoneStyle(
        background: .solid(Color(uiColor: .systemBackground)),
        handleBarStyle: .none,
        cover: .enabled(Color.black.opacity(0.2)),
        cornerRadius: 10
    )
    var body: some View {
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            
            rowView
                .popover(isPresented: $showInfoSheet, arrowEdge: .trailing) {
                    propertyInfoView
                }
        } else {
            
            rowView
                .partialSheet(isPresented: $showInfoSheet,
                              type: .scrollView(height: 170, showsIndicators: false),
                              iPhoneStyle: iPhoneStyle,
                              content: {
                    propertyInfoView
                })
        }
    }
    var propertyInfoView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("\(name.capitalized) soap property")
                .modifier(Title2Modifier())
            Text("Responsible for \(propertyExplained)")
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
    
    var rowView: some View {
        HStack {
            Text(name)
                .modifier(Title2Modifier())
            Button {
                showInfoSheet.toggle()
            } label: {
                Image(systemName: "questionmark.circle.fill")
                    .foregroundColor(.accentColor)
                    .font(.caption2)
            }
            Spacer()
            Text("\(value, specifier: "%.0f") %")
                .modifier(TextStyleModifier())
        }
    }
}

struct SoapPropertyRow_Previews: PreviewProvider {
    
    static let oilVM = OilViewModel()
    
    static var previews: some View {
        SoapPropertyRow(showInfoSheet: .constant(false), name: "Hardness", recomendedValue: "35-45", value: oilVM.hardnessInd, color: oilVM.hardnessColor, recomendationText: oilVM.hardnessSuggestion, propertyExplained: "Hardness")
            .padding()
        
    }
}


