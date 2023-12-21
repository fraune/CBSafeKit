#import "CBHelper.h"

@implementation CBHelper

+ (CBUUID *)cbuuidFromString:(NSString *)string {
    @try {
        return [CBUUID UUIDWithString:string];
    }
    @catch (NSException *exception) {
        return nil;
    }
}

+ (CBMutableService *)cbMutableServiceFromType:(CBUUID *)type primary:(BOOL)primary {
    @try {
        return [[CBMutableService alloc] initWithType:type primary:primary];
    }
    @catch (NSException *exception) {
        return nil;
    }
}

@end
