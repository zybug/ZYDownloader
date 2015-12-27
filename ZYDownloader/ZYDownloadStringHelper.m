//
//  ZYDownloadStringHelper.m
//  ZYDownloader
//
//  Created by zy on 15/12/23.
//  Copyright © 2015年 zybug. All rights reserved.
//

#import "ZYDownloadStringHelper.h"
#import <CommonCrypto/CommonDigest.h>

@implementation ZYDownloadStringHelper

+ (NSString *)zy_nomarlFileName:(NSString *)url {
    
    NSString *tmpStr = [NSString stringWithString:url];
    NSArray *tmpArrary = [tmpStr componentsSeparatedByString:@"/"];
    if (tmpArrary.count > 1) {
        return tmpArrary.lastObject;
    }
    return nil;
}

+ (NSString *)zy_md5FileName:(NSString *)url {
    NSString *tmpStr = [NSString stringWithString:url];
    NSArray *tmpArrary = [tmpStr componentsSeparatedByString:@"."];
    NSString *lastStr;
    if (tmpArrary.count > 1) {
        lastStr = tmpArrary.lastObject;
    }else{
        return nil;
    }
    return [[self zy_md5:url] stringByAppendingFormat:@".%@",lastStr];
}


#pragma mark -
// 根据string 生成md

+ (NSString *)zy_md5:(NSString *)str {
    const char *cStr = [str UTF8String];
    unsigned char result[32];
    CC_MD5( cStr, (unsigned int)strlen(cStr), result );
    
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            
            result[0],result[1],result[2],result[3],
            
            result[4],result[5],result[6],result[7],
            
            result[8],result[9],result[10],result[11],
            
            result[12],result[13],result[14],result[15]];
}

@end
