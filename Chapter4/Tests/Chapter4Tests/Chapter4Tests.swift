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
    func testTrueIsValue() throws {
        let tmTrue = Term.TmTrue(Info())
        XCTAssertTrue(isValue(tmTrue))
    }
    func testIfTrueEvaluatesToT2() throws {
        let tmIf = Term.TmIf(Info(), .TmTrue(Info()), .TmZero(Info()), .TmFalse(Info()))
        XCTAssertEqual(try eval1(tmIf), .TmZero(Info()))
        XCTAssertNotEqual(try eval1(tmIf), .TmFalse(Info()), "Not equal")
    }
    func testIfFalseEvaluatesToT3() throws {
        let tmIf = Term.TmIf(Info(), .TmFalse(Info()), .TmZero(Info()), .TmFalse(Info()))
        XCTAssertNotEqual(try eval1(tmIf), .TmZero(Info()), "Not equal")
        XCTAssertEqual(try eval1(tmIf), .TmFalse(Info()))
    }
    func testTrueEvaluatesToException() throws {
        let tmTrue = Term.TmTrue(Info())
        XCTAssertThrowsError(try eval1(tmTrue))
    }
    func testIfEvaluatesToT2() throws {
        let tmIf = Term.TmIf(Info(), .TmIf(Info(),.TmTrue(Info()), .TmTrue(Info()), .TmFalse(Info())), .TmPred(Info(),.TmSucc(Info(),.TmZero(Info()))), .TmFalse(Info()))
        XCTAssertEqual(eval(tmIf), .TmZero(Info()))
        XCTAssertNotEqual(eval(tmIf), .TmFalse(Info()), "Not equal")
    }
}
