import XCTest
@testable import anagrams

//• biro bior brio broi boir bori
//• ibro ibor irbo irob iobr iorb
//• rbio rboi ribo riob roib robi
//• obir obri oibr oirb orbi orib

final class anagramsTests: XCTestCase {
    func testEmptyString() {
        XCTAssertEqual(anagrams(""), [])
    }
    
    func testOneLetter() {
        XCTAssertEqual(anagrams("a"), ["a"])
    }
    
    func anagrams(_ val: String) -> [String] {
        []
    }
}
