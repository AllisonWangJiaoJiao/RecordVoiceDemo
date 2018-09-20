//
//  LameTool.h
//  RecordVoiceDemo
//
//  Created by allison on 2018/9/1.
//  Copyright © 2018年 allison. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LameTool : NSObject

+ (NSString *)audioToMP3: (NSString *)sourcePath isDeleteSourchFile: (BOOL)isDelete;

@end
