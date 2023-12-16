# SwiftCBUUIDKit

This project is a small helper package that helps Swift programmers safely instantiate a CoreBluetooth CBUUID.

## The problem

Instantiating a CBUUID from a String can cause your program to raise an NSInternalInconsistencyException, which cannot be handled in a Swift do-catch. As such, you might be tempted to write a lot of code to attempt to validate that a String _could_ be a valid CBUUID.

This package solves that problem by adding a String extension that either returns a valid CBUUID or nil.

## How to use

### 1. Add this repository as a SPM project/package dependency in Xcode:
```
https://github.com/fraune/swift-cbuuid-kit
```

### 2. Import the package and instantiate a CBUUID
Example of using this package to safely create a CBUUID
```swift
import CoreBluetooth
import SwiftCBUUIDKit

func createMutableService(_ fromUUIDString: String) throws -> CBMutableService {
    guard let cbuuid = fromUUIDString.asCBUUID else {
        throw NSError()
    }
    return CBMutableService(type: cbuuid, primary: true)
}
```

## Contributing

This package is simple, but contributer-friendly. I don't have a template or style guide right now, so if you would like to contribute, reach out.