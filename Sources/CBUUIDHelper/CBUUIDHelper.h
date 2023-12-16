#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface CBUUIDHelper : NSObject

+ (CBUUID *)cbuuidFromString:(NSString *)string;

@end
