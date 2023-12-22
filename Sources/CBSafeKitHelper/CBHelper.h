#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface CBHelper : NSObject

+ (CBUUID *)UUIDWithString:(NSString *)theString;

+ (CBMutableService *)cbMutableServiceFromType:(CBUUID *)UUID
                                       primary:(BOOL)isPrimary;

@end
