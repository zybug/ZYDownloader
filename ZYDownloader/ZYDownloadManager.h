//
//  ZYDownloadManager.h
//  ZYDownloader
//
//  Created by zy on 15/12/23.
//  Copyright © 2015年 zybug. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYDownloadManager : NSObject

// 创建管理对象
+ (ZYDownloadManager *)manager;

#pragma mark - 下载相关函数


// 下载文件保存本地
- (void)zy_downloadUrl:(NSString *)url progress:(void (^)(NSProgress *progress))downProgress localPatch:(NSString *)localPatch successOrFaild:(void (^)(BOOL success, NSError *error))success;

// 下载文件保存本地 (默认MD5命名)
- (void)zy_downloadUrl:(NSString *)url progress:(void (^)(NSProgress *progress))downProgress successOrFaild:(void (^)(BOOL success, NSError *error))success;


@end
