//
//  Oil - ViewModel.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 03/03/22.
//

import SwiftUI
import Combine



 class OilViewModel: ObservableObject {
    
    let oilStore = OilStore(defaultData: false)
    let essentialOilStore = EssentialOilStore()
     
     
    
    //process
    @Published var isHotProcess: Bool {
        didSet {
            UserDefaults.standard.set(isHotProcess, forKey: isHotProcessKey)
        }
        }
    @Published var isColdProcess: Bool {
        didSet {
            UserDefaults.standard.set(isColdProcess, forKey: isColdProcessKey)
        }
    }
    
    //soap type
    @Published var isHybrid: Bool = false {
        didSet {
            UserDefaults.standard.set(isHybrid, forKey: isHybridKey)
    }
    }
    @Published var isSolid: Bool = false {
        didSet {
            UserDefaults.standard.set(isSolid, forKey: isSolidKey)
    }
    }
    @Published var isLiquid: Bool {
        didSet {
            UserDefaults.standard.set(isLiquid, forKey: isLiquidKey)
    }
    }
    @Published var hybridNaOHPercent: Double {
        didSet {
            UserDefaults.standard.set(hybridNaOHPercent, forKey: naohHybridPercentKey)
        }
    }
    @Published var hybridKOHPercent: Double {
        didSet {
            UserDefaults.standard.set(hybridKOHPercent, forKey: kohHybridPercentKey)
        }
    }
    
    //water
    @Published var waterPercent: Double? {
        didSet {
            UserDefaults.standard.set(waterPercent, forKey: waterPercentKey)
        }
    }
    @Published var extraWaterPercent: Double {
        didSet {
            UserDefaults.standard.set(extraWaterPercent, forKey: extraWaterPercentKey)
        }
    }
    
    
    //superfat
    @Published var sfPercent: Double {
        didSet {
            UserDefaults.standard.set(sfPercent, forKey: sfKey)
        }
    }
    @Published var sfValue = 0.0
//     @AppStorage(extraSFKey) var extraSFPercent: Double?
    @Published var extraSFPercent: Double? {
        didSet {
            UserDefaults.standard.set(extraSFPercent, forKey: extraSFKey)
        }
    }
    @Published var extraSFValue = 0.0
   
    
    @Published var sfValueIsEditing = false

    
    //calculation screen
    @Published var calculationSheetShow = false
    
    @Published var totalAmountNaOH = 0.0
    @Published var totalAmountKOH = 0.0
    @Published var totalOilAmount: Double {
        didSet {
            UserDefaults.standard.set(totalOilAmount, forKey: totalOilAmountKey)
        }
    }
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
    @Published var unit: String {
        didSet {
            UserDefaults.standard.set(unit, forKey: unitKey)
        }
    }
    @Published var si: String {
        didSet {
            UserDefaults.standard.set(si, forKey: siKey)
        }
    }
     
     //percentage
     @Published var isPerc: Bool = false {
         didSet {
             UserDefaults.standard.set(isPerc, forKey: percKey)
     }
     }
     @Published var isNot100Perc: Bool = false
     @Published var percLeft: Double = 100
     @Published var percText = "Remains"
     var percSum: Double = 0
     
     @Published var recipeTitle = ""
    
    var searchedOils: [Oil] {
        oilStore.oils.filter({ $0.name.contains(inputTextOil) })
    }
     var searchedEsOils: [EssentialOil] {
         essentialOilStore.essentialOils.filter({
             $0.name.contains(inputTextEsOil)
         })
     }

    var chosenOils: [Oil] {
        oilStore.oils.filter { oil in
            oil.isChosen
        }
    }
     var chosenEsOils: [EssentialOil] {
         essentialOilStore.essentialOils.filter { esOil in
             esOil.isChosen
         }
     }
     
     func saveData() {
         if let encoded = try? JSONEncoder().encode(chosenOils) {
                 UserDefaults.standard.set(encoded, forKey: oilDataKey)
             }
     }
     
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
                 oil.userPercent = oilWeight * 100 / totalOilAmount
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
                        value = userWeight - userWeight * sfPercent / 100
                    }
                    return value
                } else {
                    if let userWeight = oil.userWeightValue {
                        if let extraSFperc = extraSFPercent {
                        value = userWeight - userWeight * extraSFperc / 100
                    }
                }
                }
                return value
            }

            
            if isSolid {
                let NaOHPerOil = weightWithSFDiscount * oil.saponificationNaOH

                totalAmountNaOH += NaOHPerOil
                } else if isLiquid {
                let KOHPerOil = weightWithSFDiscount * oil.saponificationKOH
                totalAmountKOH += KOHPerOil
            } else if isHybrid {
                let NaOHPerOil = weightWithSFDiscount * hybridNaOHPercent / 100 * oil.saponificationNaOH
                let KOHPerOil = weightWithSFDiscount * hybridKOHPercent / 100 * oil.saponificationKOH
                totalAmountNaOH += NaOHPerOil
                totalAmountKOH += KOHPerOil
            }
            
        }
        

        if let waterPerc = waterPercent {
        totalWaterAmount = totalOilAmount * waterPerc / 100
        }
        //extraWaterAmount = totalOilAmount * extraWaterPercent / 100
        sfValue = totalOilAmount * sfPercent / 100
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
        print( bubblyInd)
         
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
             percText = "Overadded:"
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
         let index = essentialOilStore.essentialOils.firstIndex { o in
             return o.id == esOil.id
         }
         essentialOilStore.essentialOils[index!].isChosen.toggle()
         essentialOilStore.essentialOils[index!].calculatedWeight = nil
         essentialOilStore.essentialOils[index!].userPercent = nil
        
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
    
     
     init() {
         
        self.isLiquid = UserDefaults.standard.object(forKey: isLiquidKey) as? Bool ?? true
        self.isSolid = UserDefaults.standard.object(forKey: isSolidKey) as? Bool ?? false
        self.isHybrid = UserDefaults.standard.object(forKey: isHybridKey) as? Bool ?? false
        self.isColdProcess = UserDefaults.standard.object(forKey: isColdProcessKey) as? Bool ?? false
        self.hybridNaOHPercent = UserDefaults.standard.object(forKey: naohHybridPercentKey) as? Double ?? 0.0
        self.hybridKOHPercent = UserDefaults.standard.object(forKey: kohHybridPercentKey) as? Double ?? 0.0
        self.isHotProcess = UserDefaults.standard.object(forKey: isHotProcessKey) as? Bool ?? false
        self.unit = UserDefaults.standard.object(forKey: unitKey) as? String ?? "Grams"
        self.si = UserDefaults.standard.object(forKey: siKey) as? String ?? "g"
        self.totalOilAmount = UserDefaults.standard.object(forKey: totalOilAmountKey) as? Double ?? 0.0
        self.sfPercent = UserDefaults.standard.object(forKey: sfKey) as? Double ?? 0.0
        self.extraSFPercent = UserDefaults.standard.object(forKey: extraSFKey) as? Double //?? 0.0
        self.waterPercent = UserDefaults.standard.object(forKey: waterPercentKey) as? Double //?? 0.0
        self.extraWaterPercent = UserDefaults.standard.object(forKey: extraWaterPercentKey) as? Double ?? 0.0
        self.isPerc = UserDefaults.standard.object(forKey: percKey) as? Bool ?? false
        
    }
}


