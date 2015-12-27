//
//  ZYDownloadFileManager.h
//  ZYDownloader
//
//  Created by zy on 15/12/23.
//  Copyright © 2015年 zybug. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYDownloadFileManager : NSObject

+ (ZYDownloadFileManager *)fileManager;

#pragma mark - 保存文件

- (void)zy_saveLocalPath:(NSString *)localPath withData:(NSData *)data;


@end
