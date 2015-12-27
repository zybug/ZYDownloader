//
//  ViewController.m
//  ZYDownloader
//
//  Created by zy on 15/12/23.
//  Copyright © 2015年 zybug. All rights reserved.
//

#import "ViewController.h"
#import "ZYDownloadManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)btnClick:(id)sender {
    
    [self zy_downloadImage];
}

- (void)zy_downloadImage {
    [[ZYDownloadManager manager] zy_downloadUrl:@"https://www.baidu.com/img/bd_logo1.png" progress:nil successOrFaild:^(BOOL success, NSError *error) {
        if (success) {
            NSLog(@"下载成功");
        }
    }];
}

@end
