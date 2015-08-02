//
//  messageModel.m
//  messageTest
//
//  Created by RoarRain on 15/8/2.
//  Copyright (c) 2015年 RoarRain. All rights reserved.
//

#import "messageModel.h"

@implementation messageModel


- (instancetype)initWithDic:(NSDictionary *)Dic{
    if (self = [super init]) {
        self.content = Dic[@"content"];
    }
    return self;
}
+ (id)messageModelWithDic:(NSDictionary *)Dic{
    messageModel *messagemodel = [[messageModel alloc] initWithDic:Dic];
    return messagemodel;
}

@end
