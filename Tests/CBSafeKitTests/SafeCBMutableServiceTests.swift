import XCTest
import CoreBluetooth
@testable import CBSafeKit

final class SafeCBMutableServiceTests: XCTestCase {
    func test() {
        [
            // Valid: 2-byte CBUUID allowed
            ("AAAA", CBMutableService(type: CBUUID(string: "AAAA"), primary: true)),
            // Invalid: 4-byte CBUUID not allowed
            ("AAAABBCC", nil),
            // Valid: full UUID format allowed
            ("12345678-9ABC-DEF0-1234-56789ABCDEF0", CBMutableService(type: CBUUID(string: "12345678-9ABC-DEF0-1234-56789ABCDEF0"), primary: true))
        ].forEach { (input: String, expected: CBMutableService?) in
            let actual = SafeCBMutableService(type: CBUUID(string: input), primary: true)
            if expected == nil {
                XCTAssertNil(actual)
            } else {
                XCTAssertEqual(actual!.uuid, expected!.uuid)
                XCTAssertEqual(actual!.isPrimary, expected!.isPrimary)
            }
        }
    }
}
