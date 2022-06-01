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
enum CodingKeys: String, CodingKey {
    
    
    case searchOil = "searchOil"
    case isSolid = "isSolid"
    case isLiquid = "isLiquid"
    case isHybrid = "isHybrid"
    case isHotProcess = "isHP"
    case isColdProcess = "isCP"
    case unit = "unit"
    case si = "si"
    case totalOilAmount = "totalOilWeight"
    case naohHybridPercent = "naohHybrid%"
    case kohHybridPercent = "kohHybrid%"
    case waterPercent = "water%"
    case extraWaterPercent = "extraWater%"
    case sf = "SF%"
    case extraSF = "extraSF%"
    case perc = "isPerc"
    case percText = "percText"
    case percSum = "percSum"
    
    //oilStore key
    case oilData = "SavedOilData"
    
}

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
let oilDataKey = "SavedOilData"
