//
//  Oil - ViewModel.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 03/03/22.
//

import SwiftUI
import Combine



class OilViewModel: ObservableObject {
    
    
    let oilStore = OilStore(isDefaultData: false)
    let essentialOilStore = EssentialOilStore()
    
    
    
    // process
    @AppStorage(Keys.isHotProcess) var isHotProcess: Bool = false
    @AppStorage(Keys.isColdProcess) var isColdProcess: Bool = false
    @Published var soapMakingProcess = ""
    
    // soap type
    @AppStorage(Keys.isHybrid) var isHybrid: Bool = false
    @AppStorage(Keys.isSolid) var isSolid: Bool = false
    @AppStorage(Keys.isLiquid) var isLiquid: Bool = false
    @AppStorage(Keys.naohHybridPercent) var hybridNaOHPercent: Double?
    @AppStorage(Keys.kohHybridPercent) var hybridKOHPercent: Double?
    @Published var soapType = ""
    var sumOfLyes: Double = 0
    var excessLye: Double = 0
    @AppStorage(Keys.sumOfLyeErrorMessage) var sumOfLyesErroMessage: String?
    
    //water
    @AppStorage(Keys.waterPercent) var waterPercent: Double?
    @AppStorage(Keys.extraWaterPercent) var extraWaterPercent: Double?
    
    //superfat
    @AppStorage(Keys.sf) var sfPercent: Double?
    @Published var sfValue = 0.0
    @AppStorage(Keys.extraSF) var extraSFPercent: Double?
    @Published var extraSFValue = 0.0
    @Published var sfValueIsEditing = false
    
    
    //calculation screen
    @Published var calculationSheetShow = false
    
    @Published var totalAmountNaOH = 0.0
    @Published var totalAmountKOH = 0.0
    @AppStorage(Keys.totalOilAmount) var totalOilAmount: Double = 0
    @Published var totalEsOilAmount = 0.0
    @Published var totalSoapWeight = 0.0
    @Published var totalWaterAmount = 0.0
    @Published var extraWaterAmount = 0.0
    
    //MARK: - soap properties
    var bubblyInd = 0.0
    var cleaningInd = 0.0
    var conditionInd = 0.0
    var hardnessInd = 0.0
    var longevityInd = 0.0
    var stabilityInd = 0.0
    var iodineInd = 0.0
    let bubblyExplained = "how bubbly, big and fluffy the soap lather is."
    let cleaningExplained = "how easily the soap dissolves in hard, cold, salty water and in other situations.ers. How well it will clean the skin."
    let conditionExplained = "how soft, moisturizing the soap is. Good condition skin doesn't dry the skin."
    let hardnessExplained = "the physical hardness of the soap bar."
    let longevityExplained = "how long the soap will last in the water."
    let stabilityExplained = "how long the lather will last and stay bubbly and fluffy."
    let iodineExplained = "soap shelf life."
    
    
    var bubblyColor: Color = .accentColor
    var cleaningColor: Color  = .accentColor
    var conditionColor: Color  = .accentColor
    var hardnessColor: Color  = .accentColor
    var longevityColor: Color  = .accentColor
    var stabilityColor: Color  = .accentColor
    var iodineColor: Color  = .accentColor
    
    var bubblySuggestion = "bubblySuggestion"
    var cleaningSuggestion = "cleaningSuggestion"
    var conditionSuggestion = "conditionSuggestion"
    var hardnessSuggestion = "hardnessSuggestion"
    var longevitySuggestion = "longevitySuggestion"
    var stabilitySuggestion = "stabilitySuggestion"
    var iodineSuggestion = "iodineSuggestion"
    
    //searching for oils
    @Published var inputTextOil: String = ""
    @Published var inputTextEsOil: String = ""
    //units
    @Published var units = ["Grams", "Kilograms", "Pounds", "Ounces"]
    @AppStorage(Keys.unit) var unit: String = "Grams"//need to think about initialization
    @AppStorage(Keys.si) var si: String = "Grams"//need to think about initialization
    
    //percentage
    @AppStorage(Keys.isPerc) var isPerc: Bool = false
    @Published var isNot100Perc: Bool = false
    @Published var percLeft: Double = 100
    @Published var percText = "Remains"
    var percSum: Double = 0
    
    @Published var recipeTitle = ""
    
    var searchedOils: [Oil] {
        oilStore.oils.filter({ $0.name.contains(inputTextOil) })
    }
    var searchedEsOils: [EssentialOil] {
        essentialOilStore.esOils.filter({
            $0.name.contains(inputTextEsOil)
        })
    }
    
    var chosenOils: [Oil] {
        oilStore.oils.filter { oil in
            oil.isChosen
        }
    }
    var chosenEsOils: [EssentialOil] {
        essentialOilStore.esOils.filter { esOil in
            esOil.isChosen
        }
    }
    
//    func saveData() {
//        if let encoded = try? JSONEncoder().encode(chosenOils) {
//            UserDefaults.standard.set(encoded, forKey: Keys.oilData)
//        }
//    }
    
    func changeUnits() {
        switch unit {
            case units[0]:
                si = "g"
            case units[1]:
                si = "kg"
            case units[2]:
                si = "lb"
            case units[3]:
                si = "oz"
            default:
                si = ""
        }
    }
    
    func calculateEsOilWeight () {
        var weights: [Double] = []
        for esOil in chosenEsOils {
            if let userPerc = esOil.userPercent  {
                esOil.calculatedWeight = totalOilAmount * userPerc / 100
                if let weight = esOil.calculatedWeight {
                    weights.append(weight)
                }
            }
        }
        totalEsOilAmount = weights.reduce(0, +)
    }
    
    func calculateTotalOilWeight() {
        var weights: [Double] = []
        for oil in chosenOils {
            if let userWeight = oil.userWeightValue {
                weights.append(userWeight)
            }
        }
        totalOilAmount = weights.reduce(0, +)
        
    }
    
    func calculateLyeSum () {
        guard let koh = hybridKOHPercent, let naoh =  hybridNaOHPercent else {
            return
        }
        
        sumOfLyes = koh + naoh
        
        switch sumOfLyes {
                
            case ...0:
                sumOfLyesErroMessage = "The sum of NaOH and KOH can't be a negative number."
            case 0..<100:
                excessLye = 100 - sumOfLyes
                sumOfLyesErroMessage = "The sum of NaOh and KOH should be 100 %, add \(excessLye) %."
            case 100:
                sumOfLyesErroMessage = nil
            case 100...:
                
                excessLye = sumOfLyes - 100
                sumOfLyesErroMessage = "The sum of NaOH and KOH can't exceed 100%, reduce the amount of lye by \(excessLye) %."
                
                
            default:
                sumOfLyesErroMessage = nil
        }
    }
    func calculateOneOilWeightIfPerc () {
        for oil in chosenOils {
            if let userPerc = oil.userPercent {
                oil.userWeightValue = totalOilAmount * userPerc / 100
            }
        }
    }
    
    func calculateOneOilPerc () {
        for oil in chosenOils {
            if let oilWeight = oil.userWeightValue {
                oil.userPercent = oilWeight * 100 / (totalOilAmount)
            }
        }
    }
    
    
    
    func calculate() {
        
        
        if !isPerc {
            calculateTotalOilWeight()
        }
        isPerc ? calculateOneOilWeightIfPerc() : calculateOneOilPerc()
        
        
        
        calculateEsOilWeight()
        
        for oil in chosenOils {
            
            var weightWithSFDiscount: Double {
                var value: Double = 0
                if isColdProcess {
                    if let userWeight = oil.userWeightValue {
                        value = userWeight - userWeight * (sfPercent ?? 0) / 100 //for now nil-coalescing need to think later about unwrapping
                    }
                    soapMakingProcess = "cold process soap"
                    return value
                } else {
                    if let userWeight = oil.userWeightValue {
                        if let extraSFperc = extraSFPercent {
                            value = userWeight - userWeight * extraSFperc / 100
                        }
                    }
                }
                soapMakingProcess = "hot process soap"
                return value
            }
            
            if isSolid {
                let NaOHPerOil = weightWithSFDiscount * oil.saponificationNaOH
                totalAmountNaOH += NaOHPerOil
                soapType = "Solid"
            } else if isLiquid {
                let KOHPerOil = weightWithSFDiscount * oil.saponificationKOH
                totalAmountKOH += KOHPerOil
                soapType = "Liquid"
            } else {
                let NaOHPerOil = weightWithSFDiscount * (hybridNaOHPercent ?? 0) / 100 * oil.saponificationNaOH//for now nil-coalescing need to think later about unwrapping
                let KOHPerOil = weightWithSFDiscount * (hybridKOHPercent ?? 0) / 100 * oil.saponificationKOH//for now nil-coalescing need to think later about unwrapping
                totalAmountNaOH += NaOHPerOil
                totalAmountKOH += KOHPerOil
                soapType = "Hybrid"
            }
            
        }
        
        
//        if let waterPerc = waterPercent {
        if waterPercent != nil {
            totalWaterAmount = totalOilAmount * (waterPercent!) / 100
        }
//        }
        if extraWaterPercent != nil {
        extraWaterAmount = totalOilAmount * extraWaterPercent! / 100
        }
//        if let sfPercent = sfPercent {
            sfValue = totalOilAmount * (sfPercent ?? 0) / 100
//        }
        if extraSFPercent != nil {
            extraSFValue = totalOilAmount * extraSFPercent! / 100
        }
        totalSoapWeight = totalOilAmount + totalEsOilAmount + totalWaterAmount +   totalAmountNaOH + totalAmountKOH
        changeUnits()
        
        calculateProperties()
        
        
    }
    func calculateProperties() {
        
        for oil in chosenOils {
            if let percent = oil.userPercent {
                
                bubblyInd += oil.bubbly * percent / 100
                
                print("bubly: \(bubblyInd)")
                print(oil.name)
                print(percent)
                cleaningInd += oil.cleaning * percent / 100
                conditionInd += oil.condition * percent / 100
                hardnessInd += oil.hardness * percent / 100
                longevityInd += oil.longevity * percent / 100
                stabilityInd += oil.stability * percent / 100
                //iodineInd += oil.bubbly * perc / 100
            }
        }
        
        //set colors and suggestions
        
        switch bubblyInd {
            case 0..<10:
                bubblyColor = .red
                bubblySuggestion = "Add to recipe more hard oils(coconut oil, palm oil, shea butter etc)"
            case 10..<15:
                bubblyColor = .yellow
                bubblySuggestion = "almost perfect"
            case 15...30:
                bubblyColor = .accentColor
                bubblySuggestion = "perfect"
            case 30...40:
                bubblyColor = .yellow
                bubblySuggestion = "almost perfect"
            case 40..<100:
                bubblyColor = .red
                bubblySuggestion = "Reduce the amount of hard oils(coconut oil, palm oil, shea butter etc)"
            default:
                bubblyColor = .accentColor
        }
        switch cleaningInd {
            case 0..<10:
                cleaningColor = .red
                cleaningSuggestion = ""
            default:
                cleaningColor = .gray
        }
        
    }
    
    func check100perc () {
        var arrayOfPerc: [Double] = []
        for oil in chosenOils {
            if let userPerc = oil.userPercent {
                arrayOfPerc.append(userPerc)
                
            }
        }
        percSum = arrayOfPerc.reduce(0, +)
        switch percSum {
                
            case 0..<100:
                isNot100Perc = true
                percLeft = 100 - percSum
                
            case 100:
                percLeft = 0
                isNot100Perc = false
                percText = "Everything's great"
            case 100...:
                percLeft = percSum - 100
                isNot100Perc = true
                percText = "Excess:"
            default:
                percLeft = 0
        }
        
    }
    
    func changeFavorite(oil: Oil) {
        let index = oilStore.oils.firstIndex { o in
            return o.id == oil.id
        }
        oilStore.oils[index!].isChosen.toggle()
        
        oilStore.oils[index!].userPercent = nil
        oilStore.oils[index!].userWeightValue = nil
        
        oilStore.saveData()
        
    }
    func changeFavorite(esOil: EssentialOil) {
        let index = essentialOilStore.esOils.firstIndex { o in
            return o.id == esOil.id
        }
        essentialOilStore.esOils[index!].isChosen.toggle()
        essentialOilStore.esOils[index!].calculatedWeight = nil
        essentialOilStore.esOils[index!].userPercent = nil
        
        essentialOilStore.saveData()
    }
    func deleteCalculation() {
        
        
        totalAmountNaOH = 0.0
        totalAmountKOH = 0.0
        bubblyInd = 0.0
        cleaningInd = 0.0
        conditionInd = 0.0
        hardnessInd = 0.0
        longevityInd = 0.0
        stabilityInd = 0.0
        iodineInd = 0.0
        
        
    }
    
    
    //     init() {
    
    //        self.isLiquid = UserDefaults.standard.object(forKey: isLiquidKey) as? Bool ?? true
    //        self.isSolid = UserDefaults.standard.object(forKey: isSolidKey) as? Bool ?? false
    //        self.isHybrid = UserDefaults.standard.object(forKey: isHybridKey) as? Bool ?? false
    //        self.isColdProcess = UserDefaults.standard.object(forKey: isColdProcessKey) as? Bool ?? false
    //        self.hybridNaOHPercent = UserDefaults.standard.object(forKey: naohHybridPercentKey) as? Double ?? 0.0
    //        self.hybridKOHPercent = UserDefaults.standard.object(forKey: kohHybridPercentKey) as? Double ?? 0.0
    //        self.isHotProcess = UserDefaults.standard.object(forKey: isHotProcessKey) as? Bool ?? false
    //        self.unit = UserDefaults.standard.object(forKey: unitKey) as? String ?? "Grams"
    //        self.si = UserDefaults.standard.object(forKey: siKey) as? String ?? "g"
    //        self.totalOilAmount = UserDefaults.standard.object(forKey: totalOilAmountKey) as? Double ?? 0.0
    //        self.sfPercent = UserDefaults.standard.object(forKey: sfKey) as? Double ?? 0.0
    //        self.extraSFPercent = UserDefaults.standard.object(forKey: extraSFKey) as? Double //?? 0.0
    //        self.waterPercent = UserDefaults.standard.object(forKey: waterPercentKey) as? Double //?? 0.0
    //        self.extraWaterPercent = UserDefaults.standard.object(forKey: extraWaterPercentKey) as? Double ?? 0.0
    //        self.isPerc = UserDefaults.standard.object(forKey: percKey) as? Bool ?? false
    
    //    }
}


