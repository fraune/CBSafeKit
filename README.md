# CBSafeKit

CBSafeKit is a lightweight helper package, to help Swift programmers safely instantiate various CoreBluetooth objects.

## The problem

Instantiating some CoreBluetooth objects can cause your program to raise `NSInternalInconsistencyException`s, which cannot be handled in a Swift do-catch. Unfortunately, there is very limited documentation for what is/isn't valid input for these types. As such, you might be tempted to write a lot of code, attempting to validate inputs that _might_ be valid.

This package solves that problem, by using Objective-C to bridge dangerous instantiations into safe Swift interfaces. Using this library, you are free to attempt all the invalid instantiations you like, and can easily handle the results in a "Swift" way.

## How to use

### 1. Add this repository as a SPM project/package dependency in Xcode:
```
https://github.com/fraune/CBSafeKit
```

### 2. Import the package and use one of the helpers
Example of using this package to safely create a CBUUID:
```swift
import CoreBluetooth
import CBSafeKit

func doSomething() {
    let input = "Invalid"

    guard let cbuuid = SafeCBUUID(string: input) else {
        print("Unable to create CBUUID with: \(input)")
        return
    }

    print("Safe to proceed")
    doSomethingElse(cbuuid)
}
```

## Interfaces

### SafeCBUUID(string: String)

* Safe alternative to `CBUUID(string: String)`
* Returns `CBUUID?`
* Does not throw

### SafeCBMutableService(type: CBUUID, primary: Bool)

* Safe alternative to `CBMutableService(type: CBUUID, primary: Bool)`
* Returns `CBMutableService?`
* Does not throw

## Documented Dangers

### [CBUUID.init(string:)](https://developer.apple.com/documentation/corebluetooth/cbuuid/1519025-init)

The following inputs will cause this method to throw an `NSInternalInconsistencyException`:
* If `string` length is 4 or 8:
    * It is not entirely hexadecimal (case insensitive)
* Or, if `string` length is 36:
    * It does not contain dashes at indices: 8, 13, 18, and 23 (i.e. UUID format)
    * All other characters are not hexadecimal (case insensitive)
* Else, the error will be thrown

### [CBMutableService.init(type:primary:)](https://developer.apple.com/documentation/corebluetooth/cbmutableservice/1434330-init)

The following inputs will cause this method to throw an `NSInternalInconsistencyException`:
* A valid CBUUID with a `data.length` that is not 2 or 16
    * Specifically, a valid CBUUID with a byte-length of 4 (8 hex characters) will cause this constructor to throw the error
        * e.g. `CBUUID(string: "ABCD1234")`

## Interesting Notes

### [CBMutableCharacteristic.init(type:properties:value:permissions:)](https://developer.apple.com/documentation/corebluetooth/cbmutablecharacteristic/1519073-init)

You might notice this package provides a safe constructor for `CBMutableService`, but not for `CBMutableCharacteristic`. Interestingly, this is not necessary: while a valid CBUUID with a byte-length of 4 (8 hex characters) is an invalid parameter for `CBMutableService`, it _is_ a valid parameter for `CBMutableCharacteristic`!

## Contributing

This package is simple, but contributer-friendly. I don't have a template or style guide right now, so if you would like to contribute, reach out.

### Scope

Keep the scope of this package limited to CoreBluetooth "safety" helpers.

### Documentation

If you can add to or refine any of the **Documented Dangers** or **Interesting Notes**, please open a PR with a documentation update and unit test.

## License

https://github.com/fraune/swift-cbuuid-kit/blob/main/LICENSE
