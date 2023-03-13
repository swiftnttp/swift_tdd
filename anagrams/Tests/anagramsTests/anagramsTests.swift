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
    
    func testFourLetter() {
        XCTAssertEqual(anagrams("biro"), ["biro", "bior", "brio", "broi", "boir", "bori", "ibro", "ibor", "irbo", "irob", "iobr", "iorb", "rbio", "rboi", "ribo", "riob", "robi", "roib", "obir", "obri", "oibr", "oirb", "orbi", "orib"])
    }
    
    func anagrams(_ val: String) -> [String] {
        
        if val.count == 1 {
            return [val]
        }
        
        var strings = [String]()
        for i in 0..<val.count {
            for k in 0..<anagrams(val.drop(at: i)).count {
                strings.append(val.at(i) + anagrams(val.drop(at: i))[k])
            }
        }
        return strings
        
    }
}

extension String {
    func at(_ index: Int) -> String {
        String(split(separator: "")[index])
    }
    
    func drop(at index: Int) -> String {
        var str = self
        str.remove(at: str.index(str.startIndex, offsetBy: index))
        return str
    }
}
