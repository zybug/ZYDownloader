//
//  ZYDownloadStringHelper.h
//  ZYDownloader
//
//  Created by zy on 15/12/23.
//  Copyright © 2015年 zybug. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYDownloadStringHelper : NSObject

// 根据下载网址内容命名
+ (NSString *)zy_nomarlFileName:(NSString *)url;

// 根据网址MD5命名
+ (NSString *)zy_md5FileName:(NSString *)url;

@end
