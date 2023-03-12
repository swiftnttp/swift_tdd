import XCTest
@testable import fizzbuzz

final class fizzbuzzTests: XCTestCase {
    func testOne() throws {
        XCTAssertEqual(fizzbuzz(1), "1")
    }
}
