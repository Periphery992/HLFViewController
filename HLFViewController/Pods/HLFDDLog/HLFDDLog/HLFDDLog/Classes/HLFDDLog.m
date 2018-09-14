//
//  HLFDDLog.m
//  HLFDDLog
//
//  Created by Posen on 2018/7/4.
//  Copyright © 2018 Posen. All rights reserved.
//

#import "HLFDDLog.h"
#import "HLFDDLogFormatter.h"

@implementation HLFDDLog

+ (void)configure
{
    DDFileLogger *fileLogger = [[DDFileLogger alloc]init];  //文件输出日志
    DDTTYLogger *ttyLogger = [DDTTYLogger sharedInstance];  //控制台输出日志
    
    HLFDDLogFormatter *logFormatter = [[HLFDDLogFormatter alloc]init];  //日志格式
    fileLogger.logFormatter = logFormatter;
    ttyLogger.logFormatter = logFormatter;
    
    [DDLog addLogger:fileLogger];
    [DDLog addLogger:ttyLogger];

}

@end
