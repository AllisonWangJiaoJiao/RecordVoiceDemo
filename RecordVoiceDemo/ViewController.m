//
//  ViewController.m
//  RecordVoiceDemo
//
//  Created by allison on 2018/7/4.
//  Copyright © 2018年 allison. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "LameTool.h"

@interface ViewController ()
@property (nonatomic, strong) AVAudioRecorder *record;
@end

@implementation ViewController

-(AVAudioRecorder *)record {
    if (!_record) {
        // NSString *path = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"text.caf"];
        // url : 录音文件的路径 (这里为便于测试，我用桌面路径,项目中需要用沙盒路径)
        NSURL *url = [NSURL URLWithString:@"/Users/allison/Desktop/audio/test.caf"];
        // setting:录音的设置项
        NSDictionary *configDic = @{// 编码格式
                                    AVFormatIDKey:@(kAudioFormatLinearPCM),
                                    // 采样率
                                    AVSampleRateKey:@(11025.0),
                                    // 通道数
                                    AVNumberOfChannelsKey:@(2),
                                    // 录音质量
                                    AVEncoderAudioQualityKey:@(AVAudioQualityMin)
                                    };
        NSError *error = nil;
        _record = [[AVAudioRecorder alloc]initWithURL:url settings:configDic error:&error];
        if (error) {
            NSLog(@"error:%@",error);
        }
        // 准备录音(系统会给我们分配一些资源)
        [_record prepareToRecord];
    }
    return _record;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"录音Demo";
}

- (IBAction)startClick:(UIButton *)sender {
    // 开始录音
    [self.record record];
    NSLog(@"开始录音");
}
- (IBAction)endClick:(UIButton *)sender {
    // 根据当前的录音时间，做处理
    // 如果录音不超过两秒，则删除录音
    if (self.record.currentTime > 2) {
        [self.record stop];
    } else {
        // 删除录音文件
        //如果想要删除录音文件，必须先停止录音
        [self.record stop];
        [self.record deleteRecording];
    }
    NSLog(@"结束录音");
}

@end
