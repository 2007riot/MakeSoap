//
//  OilRow.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 07/03/22.
//

import PartialSheet
import SwiftUI

struct OilRow: View {
    
    @EnvironmentObject var oil: Oil
    @EnvironmentObject var oilVM: OilViewModel
    @State var showInfoSheet = false
    
    var body: some View {
        VStack {
            HStack {
                Text(NSLocalizedString(oil.name, comment: "oil").capitalized)
                if UIDevice.current.userInterfaceIdiom == .phone {
                    Button {
                        showInfoSheet.toggle()
                    } label: {
                        Image(systemName: "questionmark.circle.fill")
                            .foregroundColor(.accentColor)
                            .font(.caption2)
                    }
                    .partialSheet(isPresented: $showInfoSheet,
                                  type: .scrollView(height: UIScreen.main.bounds.height * 0.5, showsIndicators: false),
                                  iPhoneStyle: UIConstants.iPhoneStyle,
                                  content: {
                        OilPropertyView(oil: oil)
                            .padding()
                    })
                } else {
                    Button {
                        showInfoSheet.toggle()
                    } label: {
                        Image(systemName: "questionmark.circle.fill")
                            .foregroundColor(.accentColor)
                            .font(.caption2)
                    }
                    .popover(isPresented: $showInfoSheet) {
                        OilPropertyView(oil: oil)
                            .padding()
                    }
                }
                Spacer()
                
                TextField("Value", value: oilVM.isPerc ? $oil.userPercent : $oil.userWeightValue, format: .number)
                    .modifier(TextFieldStyle())
                    .onChange(of: oilVM.isPerc ? oil.userPercent : oil.userWeightValue, perform: { _ in
                        oilVM.isPerc ? oilVM.check100perc() : oilVM.calculateTotalOilWeight()
                        
                    })
                
                    .onSubmit {
                        oilVM.isPerc ? oilVM.check100perc() : oilVM.calculateTotalOilWeight()
                        
                    }
                
                Text(oilVM.isPerc ? "%" : (NSLocalizedString(oilVM.si, comment: "")))
                Button {
                    withAnimation(.easeOut) {
                        oilVM.remove(oil: oil)
                        oilVM.isPerc ? oilVM.check100perc() : oilVM.calculateTotalOilWeight()
                        
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



struct OilRow_Previews: PreviewProvider {
    
    static let oilVM = OilViewModel()
    static let oil = Oil.example()
    
    static var previews: some View {
        OilRow()
            .environmentObject(oilVM)
            .environmentObject(oil)
            .padding()
    }
}
