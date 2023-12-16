import CoreBluetooth
import CBUUIDHelper

public extension String {
    var asCBUUID: CBUUID? {
        CBUUIDHelper.cbuuid(from: self)
    }
}
