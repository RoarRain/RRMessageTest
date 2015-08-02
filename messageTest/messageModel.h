//
//  messageModel.h
//  messageTest
//
//  Created by RoarRain on 15/8/2.
//  Copyright (c) 2015年 RoarRain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface messageModel : NSObject
@property (nonatomic, copy) NSString *content;


- (instancetype)initWithDic:(NSDictionary *)Dic;
+ (id)messageModelWithDic:(NSDictionary *)Dic;

@end
