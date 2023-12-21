import CoreBluetooth
import CBSafeKitHelper

public extension String {
    var asCBUUID: CBUUID? {
        CBHelper.cbuuid(from: self)
    }
}
