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
        VStack(spacing: 20) {
            
            HStack  {
        Text("Ingredients")
                    .modifier(TitleModifier())
                Spacer()
            }
            Spacer()
            Group {
            ForEach(oilVM.chosenOils, id: \.id) { o in
            
                CalculatedOilRow(oil: o, unit: oilVM.si)
            }
            ForEach(oilVM.chosenEsOils, id: \.id) { esOil in
                CalculatedEsOilRow(esOil: esOil)
            }
            
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
                    .font(.title3)
                    .fontWeight(.medium)
                Spacer()
                    Text("\(oilVM.totalAmountKOH, specifier: "%.2f") \(oilVM.si)")
                        .modifier(TextStyleModifier())
                        
                }
            }
            HStack(alignment: .top) {
                Text("Total soap weight")
                    .font(.title3)
                    .fontWeight(.medium)
                Spacer()
                Text("\(oilVM.totalSoapWeight, specifier: "%.2f") \(oilVM.si)")
                    .font(.title3)
                    .frame(maxWidth: 100, alignment: .trailing)
                    .multilineTextAlignment(.trailing)
            }
           
            HStack(alignment: .top) {
                Text("Water")
                    .font(.title3)
                    .fontWeight(.medium)
                Spacer()
                Text("\(oilVM.totalWaterAmount, specifier: "%.2f") \(oilVM.si)")
                    .font(.title3)
                    .frame(maxWidth: 100, alignment: .leading)
                    .multilineTextAlignment(.trailing)
                Text("\(oilVM.waterPercent ?? 0, specifier: "%.1f") %")
                    .modifier(TextStyleModifier())
            }
            if oilVM.isHotProcess {
            HStack(alignment: .top) {
                Text("Extra water")
                    .font(.title3)
                    .fontWeight(.medium)
                Spacer()
                Text("\(oilVM.extraWaterAmount, specifier: "%.2f") \(oilVM.si)")
                    .font(.title3)
                    .frame(maxWidth: 100, alignment: .leading)
                    .multilineTextAlignment(.trailing)
                Text("\(oilVM.extraWaterPercent, specifier: "%.1f") %")
                    .modifier(TextStyleModifier())
            }
            }
            HStack(alignment: .top) {
                Text("Superfat")
                    .font(.title3)
                    .fontWeight(.medium)
                Spacer()
                Text("\(oilVM.sfValue, specifier: "%.2f") \(oilVM.si)")
                    .font(.title3)
                    .frame(maxWidth: 100, alignment: .leading)
                    .multilineTextAlignment(.trailing)
                Text("\(oilVM.sfPercent, specifier: "%.1f") %")
                    .modifier(TextStyleModifier())
            }
            if oilVM.isHotProcess {
            HStack(alignment: .top) {
                Text("Extra superfat")
                    .font(.title3)
                    .fontWeight(.medium)
                Spacer()
                Text("\(oilVM.extraSFValue, specifier: "%.2f") \(oilVM.si)")
                    .font(.title3)
                    .frame(maxWidth: 100, alignment: .leading)
                    .multilineTextAlignment(.trailing)
                Text("\(oilVM.extraSFPercent ?? 0, specifier: "%.1f") %")
                    .font(.title3)
                    .frame(maxWidth: 100, alignment: .trailing)
                    .multilineTextAlignment(.trailing)
            }
            }
        
            
            
//
//            HStack {
//                Text("Total oil weight")
//                    .font(.title3)
//                    .fontWeight(.medium)
//                Spacer()
//                Text("\(oilVM.totalOilAmount, specifier: "%.2f")")
//                    .font(.title3)
//            }
            
//                HStack {
//                    Text("Water")
//                        .font(.title3)
//                        .fontWeight(.medium)
//                    Spacer()
//                    Text("\(oilVM.totalWaterAmount, specifier: "%.2f")")
//                        .font(.title3)
//
//                    Spacer()
//                    Text("\(oilVM.waterUserPercent, specifier: "%.0f")")
//                        .font(.title3)
//                }
//            Group {
//                HStack {
//                    Text("Extra Water")
//                        .font(.title3)
//                        .fontWeight(.medium)
//                    Spacer()
//                    Text("\(oilVM.extraWaterAmount, specifier: "%.2f")")
//                        .font(.title3)
//
//                    Spacer()
//                    Text("\(oilVM.extraWaterPercent, specifier: "%.0f")")
//                        .font(.title3)
//                }
//                HStack {
//                    Text("Superfat")
//                        .font(.title3)
//                        .fontWeight(.medium)
//                    Spacer()
//                    Text("\(oilVM.sfPercent, specifier: "%.0f")")
//                        .font(.title3)
//                }
//
//                    HStack {
//                        Text("Extra Superfat")
//                            .font(.title3)
//                            .fontWeight(.medium)
//                        Spacer()
//                        Text("\(oilVM.extraSFValue, specifier: "%.2f")")
//                            .font(.title3)
//
//                        Spacer()
//                        Text("\(oilVM.extraSFValue, specifier: "%.0f")")
//                            .font(.title3)
//                    }
//
//
//               // Group {
//                    HStack {
//                        Text("Water")
//                            .font(.title3)
//                            .fontWeight(.medium)
//                        Spacer()
//                        Text("\(oilVM.totalWaterAmount, specifier: "%.2f")")
//                            .font(.title3)
//
//                        Spacer()
//                        Text("\(oilVM.waterUserPercent, specifier: "%.0f")")
//                            .font(.title3)
//                    }
//                    HStack {
//                        Text("Superfat")
//                            .font(.title3)
//                            .fontWeight(.medium)
//                        Spacer()
//                        Text("\(oilVM.sfPercent, specifier: "%.0f")")
//                            .font(.title3)
//                    }
//            }
                
            
        }
    }
}


