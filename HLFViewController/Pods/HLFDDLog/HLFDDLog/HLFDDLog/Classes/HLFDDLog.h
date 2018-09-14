//
//  HLFDDLog.h
//  HLFDDLog
//
//  Created by Posen on 2018/7/4.
//  Copyright © 2018 Posen. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LOG_LEVEL_DEF ddLogLevel
#import <CocoaLumberjack/CocoaLumberjack.h>
//设置DDLog日志等级
#ifdef DEBUG
static const DDLogLevel ddLogLevel = DDLogLevelAll;
#else
static const DDLogLevel ddLogLevel = DDLogLevelOff;
#endif

@interface HLFDDLog : NSObject

+ (void)configure;

@end
