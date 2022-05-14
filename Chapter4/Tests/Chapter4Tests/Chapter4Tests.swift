import XCTest
@testable import Chapter4

final class Chapter4Tests: XCTestCase {
    func testZeroIsNumericValue() throws {
        let zero = Term.TmZero(Info())
        XCTAssertTrue(isNumericValue(zero))
    }
    func testOneIsNumericValue() throws {
        let one = Term.TmSucc(Info(),.TmZero(Info()))
        XCTAssertTrue(isNumericValue(one))
    }
    func testTrueIsNotNumericValue() throws {
        let tmTrue = Term.TmTrue(Info())
        XCTAssertFalse(isNumericValue(tmTrue))
    }
}
