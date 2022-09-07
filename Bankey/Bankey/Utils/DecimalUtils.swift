//
//  DecimalUtils.swift
//  Bankey
//
//  Created by Lucas Lacerda on 07/09/22.
//

import Foundation


extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
