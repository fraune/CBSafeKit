#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface CBHelper : NSObject

+ (CBUUID *)cbuuidFromString:(NSString *)string;
+ (CBMutableService *)cbMutableServiceFromType:(CBUUID *)type primary:(BOOL)primary;

@end
