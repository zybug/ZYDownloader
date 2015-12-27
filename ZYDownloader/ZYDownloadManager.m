//
//  ZYDownloadManager.m
//  ZYDownloader
//
//  Created by zy on 15/12/23.
//  Copyright © 2015年 zybug. All rights reserved.
//

#import "ZYDownloadManager.h"
#import "ZYDownloadFileManager.h"
#import "ZYDownloadStringHelper.h"

// 依赖AFNetworking
#import <AFNetworking/AFNetworking.h>

@interface ZYDownloadManager()
{
    AFHTTPSessionManager *_afManager;
}
@end

@implementation ZYDownloadManager

+ (ZYDownloadManager *)manager {
    static ZYDownloadManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ZYDownloadManager alloc] init];
    });
    return manager;
}

// 初始化参数
- (instancetype)init {
    if (self = [super init]) {
        _afManager = [AFHTTPSessionManager manager];
        _afManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    return self;
}


#pragma mark -

- (void)zy_downloadUrl:(NSString *)url progress:(void (^)(NSProgress *progress))downProgress localPatch:(NSString *)localPatch successOrFaild:(void (^)(BOOL success, NSError *error))success{
    
    // 创建下载
    [_afManager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        // 如果开始下载就显示下载进度
        if (downProgress) {
            downProgress(downloadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 下载成功
        if (success) {
            success(YES, nil);
        }
        if ([responseObject isKindOfClass:[NSData class]]) {
            if (localPatch) {
                [[ZYDownloadFileManager fileManager] zy_saveLocalPath:localPatch withData:responseObject];
            }else{
                [[ZYDownloadFileManager fileManager] zy_saveLocalPath:[ZYDownloadStringHelper zy_md5FileName:url] withData:responseObject];
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 下载失败
        if (success) {
            success(NO, error);
        }
    }];
    
}


- (void)zy_downloadUrl:(NSString *)url progress:(void (^)(NSProgress *))downProgress successOrFaild:(void (^)(BOOL, NSError *))success {
    [self zy_downloadUrl:url progress:downProgress localPatch:nil successOrFaild:success];
}


@end
