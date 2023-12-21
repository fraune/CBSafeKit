import XCTest
import CoreBluetooth
@testable import CBSafeKit

final class CBSafeKitTests: XCTestCase {
    func test_SafeCBUUID() {
        /// ( Input String, Expected Result )
        [
            // too short
            ("", nil),
            ("A", nil),
            ("AB", nil),
            ("ABC", nil),
            // valid
            ("ABCD", CBUUID(string: "ABCD")),
            ("abcd", CBUUID(string: "ABCD")),
            ("abcd", CBUUID(string: "abcd")),
            // not hex
            ("ZBCD", nil),
            // invalid size
            ("ABCD1", nil),
            ("ABCD12", nil),
            ("ABCD123", nil),
            // valid
            ("ABCD1234", CBUUID(string: "ABCD1234")),
            // not hex
            ("ZBCD1234", nil),
            // invalid size
            ("12345678-9AB", nil),
            // valid
            ("12345678-9ABC-DEF0-1234-56789ABCDEF0", CBUUID(string: "12345678-9ABC-DEF0-1234-56789ABCDEF0")),
            // not hex
            ("Z2345678-9ABC-DEF0-1234-56789ABCDEF0", nil),
            // no dashes
            ("123456789ABCDEF0123456789ABCDEF0", nil),
            // too long
            ("12345678-9ABC-DEF0-1234-56789ABCDEF01", nil)
        ].forEach { (input: String, expected: CBUUID?) in
            let actual = SafeCBUUID(string: input)
            if expected == nil {
                XCTAssertNil(actual)
            } else {
                XCTAssertEqual(actual, expected)
            }
        }
    }

    func test_SafeCBMutableService() {
        [
            ("AAAA", CBMutableService(type: CBUUID(string: "AAAA"), primary: true)),
            ("AAAABBCC", nil),
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
