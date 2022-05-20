////
////  SoapPropertiesStore.swift
////  Make Soap!
////
////  Created by Galina Aleksandrova on 26/04/22.
////
//
//import Foundation
//
//class SoapPropertiesStore: ObservableObject {
//    
//    let oilVM = OilViewModel()
//    
//   var soapProperties: [SoapProperty] = []
//    
//    init () {
//        oilVM.calculate()
//        soapProperties =
//            [
//            //bubbly
//                SoapProperty(name: "Bubbly", recomendedValue: "15-30", value: oilVM.bubblyInd, color: oilVM.bubblyColor, recomendationText: oilVM.bubblySuggestion),
//                               // cleaning
//                                SoapProperty(name: "Cleaning", recomendedValue: "15-20", value: oilVM.cleaningInd, color: oilVM.cleaningColor, recomendationText: oilVM.cleaningSuggestion),
//                                //condition
//                                SoapProperty(name: "Condition", recomendedValue: "45-70", value: oilVM.conditionInd, color: oilVM.conditionColor, recomendationText: oilVM.conditionSuggestion),
//                                //hardness
//                                SoapProperty(name: "Hardness", recomendedValue: "35-45", value: oilVM.hardnessInd, color: oilVM.hardnessColor, recomendationText: oilVM.hardnessSuggestion),
//                                //longevity
//                                SoapProperty(name: "Longevity", recomendedValue: "25-50", value: oilVM.longevityInd, color: oilVM.longevityColor, recomendationText: oilVM.longevitySuggestion),
//                                //stability
//                                SoapProperty(name: "Stability", recomendedValue: "15-50", value: oilVM.stabilityInd, color: oilVM.stabilityColor, recomendationText: oilVM.stabilitySuggestion),
//                                //iodine, for now don't need
//                                //SoapProperties(name: "Iodine", recomendedValue: "up to 50", value: oilVM.iodineInd, color: oilVM.iodineColor, recomendationText: oilVM.iodineSuggestion)
//            ]
//    }
//}
