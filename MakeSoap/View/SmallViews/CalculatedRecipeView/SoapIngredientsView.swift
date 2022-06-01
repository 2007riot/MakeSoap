//
//  SoapIngridientsView.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 14/03/22.
//

import SwiftUI


struct SoapIngredientsView: View {
    @EnvironmentObject var oilVM: OilViewModel
    
    var body: some View {
        VStack(spacing: 15) {
            
            HStack  {
                Text("Ingredients")
                    .modifier(TitleModifier())
                Spacer()
            }
            VStack(spacing: 10) {
                HStack(alignment: .top) {
                    Text("Total soap weight")
                        .modifier(Title2ModifierSemibold())
                    Spacer()
                    Text("\(oilVM.totalSoapWeight, specifier: "%.2f") \(oilVM.si)")
                        .modifier(Title2ModifierSemibold())
                       // .fontWeight(.bold)
                        
                }
                
                
                if oilVM.isSolid || oilVM.isHybrid {
                    HStack {
                        Text("NaOH")
                            .modifier(Title2Modifier())
                        Spacer()
                        Text("\(oilVM.totalAmountNaOH, specifier: "%.2f") \(oilVM.si)")
                            .modifier(TextStyleModifier())
                        
                    }
                    
                }
                if oilVM.isLiquid || oilVM.isHybrid {
                    HStack {
                        Text("KOH")
                            .modifier(Title2Modifier())
                        Spacer()
                        Text("\(oilVM.totalAmountKOH, specifier: "%.2f") \(oilVM.si)")
                            .modifier(TextStyleModifier())
                        
                    }
                }
                
                HStack(alignment: .top) {
                    Text("Water")
                        .modifier(Title2Modifier())
                    Spacer()
                    VStack (alignment: .trailing, spacing: 2) {
                        Text("\(oilVM.totalWaterAmount, specifier: "%.2f") \(oilVM.si)")
                            .modifier(TextStyleModifier())
                        Text("\(oilVM.waterPercent ?? 0, specifier: "%.1f") %")
                            .modifier(TextStyleModifier())
                            .foregroundColor(.gray)
                    }
                }
                if oilVM.isHotProcess {
                    HStack(alignment: .top) {
                        Text("Extra water")
                            .modifier(Title2Modifier())
                        Spacer()
                        VStack (alignment: .trailing, spacing: 2) {
                            Text("\(oilVM.extraWaterAmount, specifier: "%.2f") \(oilVM.si)")
                                .modifier(TextStyleModifier())
                            Text("\(oilVM.extraWaterPercent, specifier: "%.1f") %")
                                .modifier(TextStyleModifier())
                                .foregroundColor(.gray)
                        }
                    }
                }
                HStack(alignment: .top) {
                    Text("Superfat")
                        .modifier(Title2Modifier())
                    Spacer()
                    VStack (alignment: .trailing, spacing: 2) {
                        Text("\(oilVM.sfValue, specifier: "%.2f") \(oilVM.si)")
                            .modifier(TextStyleModifier())
                        Text("\(oilVM.sfPercent, specifier: "%.1f") %")
                            .modifier(TextStyleModifier())
                            .foregroundColor(.gray)
                    }
                }
                if oilVM.isHotProcess {
                    HStack(alignment: .top) {
                        Text("Extra superfat")
                            .modifier(Title2Modifier())
                        Spacer()
                        VStack (alignment: .trailing, spacing: 2) {
                            Text("\(oilVM.extraSFValue, specifier: "%.2f") \(oilVM.si)")
                                .modifier(TextStyleModifier())
                            Text("\(oilVM.extraSFPercent ?? 0, specifier: "%.1f") %")
                                .modifier(TextStyleModifier())
                                .foregroundColor(.gray)
                        }
                    }
                }
                ForEach(oilVM.chosenOils, id: \.id) { oil in
                    
                    HStack(alignment: .top) {
                        Text(oil.name)
                            .modifier(Title2Modifier())
                        Spacer()
                        
                        VStack (alignment: .trailing, spacing: 2) {
                            Text("\(oil.userWeightValue ?? 0, specifier: "%.2f") \(oilVM.si)")
                                .modifier(TextStyleModifier())
                            
                            
                            Text("\(oil.userPercent ?? 0, specifier: "%.2f") %")
                                .modifier(TextStyleModifier())
                                .foregroundColor(.gray)
                            
                        }
                    }
                }
                ForEach(oilVM.chosenEsOils, id: \.id) { esOil in
                    HStack(alignment: .top) {
                        Text(esOil.name)
                            .modifier(Title2Modifier())
                        Spacer()
                        VStack (alignment: .trailing, spacing: 2) {
                            Text("\(esOil.calculatedWeight ?? 0, specifier: "%.2f") \(oilVM.si)")
                                .modifier(TextStyleModifier())
                            
                            Text("\(esOil.userPercent ?? 0, specifier: "%.1f") %")
                                .modifier(TextStyleModifier())
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
        }
    }
    
}
