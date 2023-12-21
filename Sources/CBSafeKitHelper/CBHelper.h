#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface CBHelper : NSObject

+ (CBUUID *)cbuuidFromString:(NSString *)string;

@end
