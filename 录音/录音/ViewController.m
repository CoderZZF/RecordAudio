//
//  ViewController.m
//  录音
//
//  Created by zhangzhifu on 2017/3/2.
//  Copyright © 2017年 seemygo. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
@property (nonatomic, strong) AVAudioRecorder *recorder;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}
- (IBAction)startRecord {
    
    // 4. 开始录音
    [self.recorder record];
}


- (IBAction)stopRecord {
    [self.recorder stop];
}


#pragma mark - 懒加载代码
- (AVAudioRecorder *)recorder {
    if (_recorder == nil) {
        // 1. 创建存放录音文件的地址
        NSString *Path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        NSString *filePath = [Path stringByAppendingPathComponent:@"321.caf"];
        NSURL *url = [NSURL URLWithString:filePath];
        
        // 2. 创建录音对象
        self.recorder = [[AVAudioRecorder alloc] initWithURL:url settings:nil error:nil];
        
        // 3. 准备录音
        [self.recorder prepareToRecord];
    }
    
    return _recorder;
}
@end
