//
//  ZYDownloadFileManager.m
//  ZYDownloader
//
//  Created by zy on 15/12/23.
//  Copyright © 2015年 zybug. All rights reserved.
//

#import "ZYDownloadFileManager.h"

@interface ZYDownloadFileManager()
{
    NSFileManager *_nsFileMan;
}

@property (nonatomic, strong) NSString *localFileP;

@end

@implementation ZYDownloadFileManager

+ (ZYDownloadFileManager *)fileManager {
    static ZYDownloadFileManager *fm = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        fm = [[ZYDownloadFileManager alloc] init];
    });
    return fm;
}

// 设置缓存路径
- (instancetype)init {
    if (self = [super init]) {
        _nsFileMan = [NSFileManager defaultManager];
        NSString *documentPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        _localFileP = [documentPath stringByAppendingPathComponent:@"caches/"];
        if (![_nsFileMan fileExistsAtPath:_localFileP]) {
            NSError *error = nil;
            [_nsFileMan createDirectoryAtPath:_localFileP withIntermediateDirectories:YES attributes:nil error:&error];
            if (error) {
                NSLog(@"error:%@",error);
            }
        }
    }
    return self;
}

#pragma mark -

- (void)zy_saveLocalPath:(NSString *)localPath withData:(NSData *)data {
    NSString *path = [_localFileP stringByAppendingPathComponent:localPath];
    NSLog(@"FilePath:%@",path);
    [_nsFileMan createFileAtPath:path contents:nil attributes:nil];
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:path];
    [fileHandle seekToEndOfFile];
    [fileHandle writeData:data];
    [fileHandle closeFile];
}


@end
