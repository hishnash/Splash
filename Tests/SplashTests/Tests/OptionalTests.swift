/**
 *  Splash
 *  Copyright (c) John Sundell 2018
 *  MIT license - see LICENSE.md
 */

import Foundation
import XCTest
import Splash
import SplashTestKit


final class OptionalTests: SyntaxHighlighterTestCase {
    func testAssigningPropertyWithOptionalChaining() {
        let components = highlighter.highlight("object?.property = true")

        XCTAssertEqual(components, [
            .plainText("object?."),
            .token("property", .property),
            .whitespace(" "),
            .plainText("="),
            .whitespace(" "),
            .token("true", .keyword)
        ])
    }

    func testReadingPropertyWithOptionalChaining() {
        let components = highlighter.highlight("call(object?.property)")

        XCTAssertEqual(components, [
            .token("call", .call),
            .plainText("(object?."),
            .token("property", .property),
            .plainText(")")
        ])
    }

    func testCallingMethodwithOptionalChaining() {
        let components = highlighter.highlight("object?.call()")

        XCTAssertEqual(components, [
            .plainText("object?."),
            .token("call", .call),
            .plainText("()")
        ])
    }

    func testAllTestsRunOnLinux() {
        XCTAssertTrue(TestCaseVerifier.verifyLinuxTests((type(of: self)).allTests))
    }
}

extension OptionalTests {
    static var allTests: [(String, TestClosure<OptionalTests>)] {
        return [
            ("testAssigningPropertyWithOptionalChaining", testAssigningPropertyWithOptionalChaining),
            ("testReadingPropertyWithOptionalChaining", testReadingPropertyWithOptionalChaining),
            ("testCallingMethodwithOptionalChaining", testCallingMethodwithOptionalChaining)
        ]
    }
}
