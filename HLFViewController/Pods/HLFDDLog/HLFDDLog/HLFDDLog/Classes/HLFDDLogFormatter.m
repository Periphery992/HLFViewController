//
//  HLFDDLogFormatter.m
//  Easy-All
//
//  Created by chen on 25/09/2017.
//  Copyright © 2017 chensa. All rights reserved.
//

#import "HLFDDLogFormatter.h"

@interface HLFDDLogFormatter()
@property (nonatomic, strong) NSDateFormatter *dateFormatter;


@end

@implementation HLFDDLogFormatter

- (id)init {
    if((self = [super init])) {
        self.dateFormatter = [[NSDateFormatter alloc] init];
#ifdef DEBUG
        [self.dateFormatter setDateFormat:@"[HH:mm:ss:SSS]"];
#else
        [self.dateFormatter setDateFormat:@"[yy-MM-dd HH:mm:ss:SSS]"];
#endif
    }
    return self;
}

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage {
    
    NSString *logLevel;
    
    switch (logMessage->_flag) {
        case DDLogFlagError    : logLevel = @"[E]"; break;
        case DDLogFlagWarning  : logLevel = @"[W]"; break;
        case DDLogFlagInfo     : logLevel = @"[I]"; break;
        case DDLogFlagDebug    : logLevel = @"[D]"; break;
        default                : logLevel = @"[V]"; break;
    }
    
    NSString *dateAndTime = [self.dateFormatter stringFromDate:(logMessage->_timestamp)];
    
    return [NSString stringWithFormat:@"%@ %@ : %@", logLevel ,dateAndTime ,logMessage->_message];
}


@end
