import XCTest
@testable import primes

final class primeTests: XCTestCase {
    func testDecimalPlaces1() throws {
        XCTAssertEqual(numlang.decimalPlaces(num: 123.123, places: 1), "123.1")
        XCTAssertEqual(numlang.decimalPlaces(num: 123.123, places: 2), "123.12")
        XCTAssertEqual(numlang.decimalPlaces(num: 123.123, places: 3), "123.123")
        XCTAssertEqual(numlang.decimalPlaces(num: 123.123, places: 4), "123.1230")
    }

    func testDecimalPlaces2() throws {
        XCTAssertEqual(numlang.decimalPlaces(num: 1.000000001, places: 1), "1.0")
        XCTAssertEqual(numlang.decimalPlaces(num: 1.000000001, places: 2), "1.00")
    }

    func testDecimalPlaces3() throws {
        XCTAssertEqual(numlang.decimalPlaces(num: 1000, places: 0), "1000")
        XCTAssertEqual(numlang.decimalPlaces(num: 1000, places: 1), "1000.0")
        XCTAssertEqual(numlang.decimalPlaces(num: 1000, places: 2), "1000.00")
    }
}