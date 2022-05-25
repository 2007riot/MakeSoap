//
//  Constants.swift
//  Make Soap!
//
//  Created by Galina Aleksandrova on 04/05/22.
//

import Foundation

let oilSearch = "Search oils"
let essentialOilSearch = "Search Essential oils"

//keys for oilModel
let searchOilKey = "searchOil"
let isSolidKey = "isSolid"
let isLiquidKey = "isLiquid"
let isHybridKey = "isHybrid"
let isHotProcessKey = "isHP"
let isColdProcessKey = "isCP"
let unitKey = "unit"
let siKey = "si"
let totalOilAmountKey = "totalOilWeight"
let naohHybridPercentKey = "naohHybrid%"
let kohHybridPercentKey = "kohHybrid%"
let waterPercentKey = "water%"
let extraWaterPercentKey = "extraWater%"
let sfKey = "SF%"
let extraSFKey = "extraSF%"
let percKey = "isPerc"
let percTextKey = "percText"
let percSumKey = "percSum"

//oilStore key
let oilDataKey = "SavedOilData"

let recipe = Recipe(title: "Galina", oils: OilStore(defaultData: true).oils, bubblyValue: 50, cleaningValue: 50, conditionValue: 50, hardnessValue: 50, longevityValue: 50, stabilityValue: 50, unit: "gr", NaOHvalue: 10, KOHValue: 10, soapWeight: 10, waterValue: 10, extraWater: 10, sfValue: 10, extraSFValue: 10, esOils: EssentialOilStore().essentialOils, date: Date.now)
