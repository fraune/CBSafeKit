import CoreBluetooth
import CBSafeKitHelper

public func SafeCBUUID(string theString: String) -> CBUUID? {
    CBHelper.uuid(with: theString)
}

public func SafeCBMutableService(type UUID: CBUUID, primary isPrimary: Bool) -> CBMutableService? {
    CBHelper.cbMutableService(fromType: UUID, primary: isPrimary)
}
