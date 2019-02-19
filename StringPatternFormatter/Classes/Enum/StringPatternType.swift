//
//  StringPatternType.swift
//  StringPatternFormatter
//
//  Created by Vitor Kawai Sala on 18/02/19.
//

import UIKit

public enum StringPatternType {
    case replace(to: String)
    case attributes([NSAttributedString.Key : Any])
}
