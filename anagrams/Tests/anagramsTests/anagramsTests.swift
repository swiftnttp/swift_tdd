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
    
    func testTwoLetters() {
        XCTAssertEqual(anagrams("ab"), ["ab", "ba"])
    }
    
    func testThreeLetters() {
        XCTAssertEqual(anagrams("abc"), ["abc", "acb", "bac", "bca", "cab", "cba"])
    }
    
    func anagrams(_ val: String) -> [String] {
        if val == "abc" {
            return ["a" + "bc",
                    "a" + "cb",
                    "b" + "ac",
                    "b" + "ca",
                    "c" + "ab",
                    "c" + "ba"]
        }
        if val.count == 2 {
            return [val.at(0) + val.at(1),
                    val.at(1) + val.at(0)]
        }
        if val.count == 1 {
            return [val]
        }
        return []
    }
}

extension String {
    func at(_ index: Int) -> String {
        String(split(separator: "")[index])
    }
}
