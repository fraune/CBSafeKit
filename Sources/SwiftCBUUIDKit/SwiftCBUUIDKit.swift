import CoreBluetooth
import CBUUIDHelper

extension String {
    var asCBUUID: CBUUID? {
        CBUUIDHelper.cbuuid(from: self)
    }
}
