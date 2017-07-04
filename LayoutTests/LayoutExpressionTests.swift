//  Copyright © 2017 Schibsted. All rights reserved.

import XCTest
@testable import Layout

class LayoutExpressionTests: XCTestCase {

    func testOptionalBracesInNumberExpression() {
        let node = LayoutNode()
        let expression = LayoutExpression(numberExpression: "{4 + 5}", for: node)
        XCTAssertEqual(try expression.evaluate() as? Double, 9)
    }

    func testOptionalBracesInColorExpression() {
        let node = LayoutNode()
        let expression = LayoutExpression(colorExpression: "{#fff}", for: node)
        XCTAssertEqual(try expression.evaluate() as? UIColor, UIColor(red: 1, green: 1, blue: 1, alpha: 1))
    }

    func testOptionalMultipleExpressionBodiesDisallowedInNumberExpression() {
        let node = LayoutNode()
        let expression = LayoutExpression(numberExpression: "{5}{6}", for: node)
        XCTAssertThrowsError(try expression.evaluate())
    }
}
