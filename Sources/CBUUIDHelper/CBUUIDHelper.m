#import "CBUUIDHelper.h"

@implementation CBUUIDHelper

+ (CBUUID *)cbuuidFromString:(NSString *)string {
    @try {
        return [CBUUID UUIDWithString:string];
    }
    @catch (NSException *exception) {
        return nil;
    }
}

@end
