#import "CBHelper.h"

@implementation CBHelper

+ (CBUUID *)UUIDWithString:(NSString *)theString; {
    @try {
        return [CBUUID UUIDWithString:theString];
    } @catch (NSException *exception) {
        return nil;
    }
}

+ (CBMutableService *)cbMutableServiceFromType:(CBUUID *)UUID
                                       primary:(BOOL)isPrimary {
    @try {
        return [[CBMutableService alloc] initWithType:UUID primary:isPrimary];
    } @catch (NSException *exception) {
        return nil;
    }
}

@end
