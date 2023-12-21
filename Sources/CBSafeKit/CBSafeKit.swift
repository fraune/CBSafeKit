import CoreBluetooth
import CBSafeKitHelper

public func SafeCBUUID(string theString: String) -> CBUUID? {
    CBHelper.cbuuid(from: theString)
}

public func SafeCBMutableService(type: CBUUID, primary: Bool) -> CBMutableService? {
    CBHelper.cbMutableService(fromType: type, primary: primary)
}
