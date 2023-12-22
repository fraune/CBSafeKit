import XCTest
import CoreBluetooth
@testable import CBSafeKit

final class CBSafeKitTests: XCTestCase {
    func test() {
        [
            // Invalid: too short
            ("", nil),
            ("A", nil),
            ("AB", nil),
            ("ABC", nil),
            // Valid: mixed-case is allowed
            ("ABCD", CBUUID(string: "ABCD")),
            ("abcd", CBUUID(string: "ABCD")),
            ("abcd", CBUUID(string: "abcd")),
            ("abCD", CBUUID(string: "abcd")),
            // Invalid: not hex
            ("ZBCD", nil),
            // Invalid: unsupported size
            ("ABCD1", nil),
            ("ABCD12", nil),
            ("ABCD123", nil),
            // Valid: 4-bytes is allowed
            ("ABCD1234", CBUUID(string: "ABCD1234")),
            // Invalid: not hex
            ("ZBCD1234", nil),
            // Invalid: size malformed
            ("12345678-9AB", nil),
            // Valid: UUID format
            ("12345678-9ABC-DEF0-1234-56789ABCDEF0", CBUUID(string: "12345678-9ABC-DEF0-1234-56789ABCDEF0")),
            // Invalid: UUID not hex
            ("Z2345678-9ABC-DEF0-1234-56789ABCDEF0", nil),
            // Invalid: UUID format without dashes
            ("123456789ABCDEF0123456789ABCDEF0", nil),
            // Invalid: too long
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
}
