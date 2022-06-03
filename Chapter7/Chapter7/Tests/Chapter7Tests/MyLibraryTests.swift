import XCTest
@testable import Chapter7

final class MyLibraryTests: XCTestCase {
    func testExample() throws {
        let varTerm:Term = .tmVar(.blank, 0, 0)

        let absTerm:Term = .tmAbs(.blank, "x", varTerm)
        
        let appTerm:Term = .tmApp(.blank, varTerm, varTerm)

        (termSubstTop(absTerm, with: appTerm))

        // XCTAssertEqual()
    }
}
