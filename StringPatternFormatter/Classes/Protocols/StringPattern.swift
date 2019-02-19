//
//  StringPattern.swift
//  StringPatternFormatter
//
//  Created by Vitor Kawai Sala on 18/02/19.
//

import Foundation

public protocol StringPattern {
    var pattern: String { get }
    var type: StringPatternType { get }
}
