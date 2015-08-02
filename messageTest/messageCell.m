//
//  messageCell.m
//  messageTest
//
//  Created by RoarRain on 15/8/2.
//  Copyright (c) 2015年 RoarRain. All rights reserved.
//

#import "messageCell.h"
#import "messageModel.h"
@implementation messageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.941 green:0.945 blue:0.965 alpha:1.000];

        _userImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
        
        CGFloat userImagX =CGRectGetMaxX(_userImage.frame);
        _msgBgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(userImagX +10, 10,self.frame.size.width -userImagX - 40, 40)];
        _msgLabel = [[UILabel alloc] initWithFrame:CGRectMake(_msgBgImageView.frame.origin.x + 20, 20, _msgBgImageView.frame.size.width - 40,   30)];
        _msgLabel.numberOfLines = 0;
        _msgLabel.lineBreakMode = NSLineBreakByCharWrapping;
        _msgLabel.font = [UIFont systemFontOfSize:15.0];
        [self addSubview:_userImage];
        [self addSubview:_msgBgImageView];
        [self addSubview:_msgLabel];
        
    }

    return self;

}



@end
