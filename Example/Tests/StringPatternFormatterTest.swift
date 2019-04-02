//
//  StringPatternFormatterTest.swift
//  StringPatternFormatter_Tests
//
//  Created by Vitor Kawai Sala on 02/04/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import StringPatternFormatter

class StringPatternFormatterTest: XCTestCase {
    var sut: StringPatternFormatter!
    
    override func setUp() {
        sut = StringPatternFormatter()
    }

    override func tearDown() {
        sut = nil
    }

    func testAttributedStringFormat() {
        sut.patterns = [
            TestPattern(pattern: "-(.*)-", type: .attributes([.font : UIFont.boldSystemFont(ofSize: 24)]))
        ]
        let attributedString = try? sut.attributedString(for: "n-b-n")
        XCTAssertNotNil(attributedString)
        var attributes = attributedString!.attributes(at: 0, effectiveRange: nil)
        XCTAssertEqual(attributes.count, 0)
        XCTAssertNil(attributes[.font])
        attributes = attributedString!.attributes(at: 1, effectiveRange: nil)
        XCTAssertEqual(attributes.count, 1)
        XCTAssertNotNil(attributes[.font])
        XCTAssertTrue(checkFontTrait(font: attributes[.font] as! UIFont, trait: .traitBold))
        attributes = attributedString!.attributes(at: 2, effectiveRange: nil)
        XCTAssertEqual(attributes.count, 0)
        XCTAssertNil(attributes[.font])
    }
    
    func testReplaceStringFormat() {
        sut.patterns = [
            TestPattern(pattern: "#", type: .replace(to: "\n"))
        ]
        let attributedString = try? sut.attributedString(for: "a#b")
        XCTAssertNotNil(attributedString)
        XCTAssertEqual(attributedString!.string, "a\nb")
    }
    
    func testMixedStringFormat() {
        sut.patterns = [
            TestPattern(pattern: "-(.*)-", type: .attributes([.font : UIFont.boldSystemFont(ofSize: 24)])),
            TestPattern(pattern: "#", type: .replace(to: "\n"))
        ]
        let attributedString = try? sut.attributedString(for: "a#-b-")
        XCTAssertNotNil(attributedString)
        XCTAssertEqual(attributedString!.string, "a\nb")
        
        var attributes = attributedString!.attributes(at: 0, effectiveRange: nil)
        XCTAssertEqual(attributes.count, 0)
        XCTAssertNil(attributes[.font])
        
        attributes = attributedString!.attributes(at: 2, effectiveRange: nil)
        XCTAssertEqual(attributes.count, 1)
        XCTAssertNotNil(attributes[.font])
        XCTAssertTrue(checkFontTrait(font: attributes[.font] as! UIFont, trait: .traitBold))
    }
    
    private func checkFontTrait(font: UIFont, trait: UIFontDescriptor.SymbolicTraits) -> Bool {
        return font.fontDescriptor.symbolicTraits.contains(trait)
    }
}
