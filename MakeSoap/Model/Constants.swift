//
//  Constants.swift
//  Make Soap!
//
//  Created by Galina Aleksandrova on 04/05/22.
//

import Foundation
import PartialSheet
import SwiftUI

let oilSearch = "Search oils"
let essentialOilSearch = "Search Essential oils"

//keys for oilModel
struct Keys {
    
    static let searchOil = "searchOil"
    static let isSolid = "isSolid"
    static let isLiquid = "isLiquid"
    static let isHybrid = "isHybrid"
    static let isHotProcess = "isHP"
    static let isColdProcess = "isCP"
    static let unit = "unit"
    static let si = "si"
    static let totalOilAmount = "totalOilWeight"
    static let naohHybridPercent = "naohHybrid%"
    static let kohHybridPercent = "kohHybrid%"
    static let waterPercent = "water%"
    static let extraWaterPercent = "extraWater%"
    static let sf = "SF%"
    static let extraSF = "extraSF%"
    static let isPerc = "isPerc"
    static let percText = "percText"
    static let percSum = "percSum"
    static let sumOfLyeErrorMessage = "lyeSum"
    
    //oilStore key
    static let oilData = "SavedOilData"
    static let esOilData = "SavedEsOilData"
}

struct UIConstants {
    static let iPhoneStyle = PSIphoneStyle(
        background: .solid(Color(uiColor: .systemBackground)),
        handleBarStyle: .none,
        cover: .enabled(Color.black.opacity(0.2)),
        cornerRadius: 10
    )
}
