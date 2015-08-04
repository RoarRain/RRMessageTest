//
//  ViewController.m
//  messageTest
//
//  Created by RoarRain on 15/8/2.
//  Copyright (c) 2015年 RoarRain. All rights reserved.
//

#import "ViewController.h"
#import "messageCell.h"
#import "messageModel.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_msgArray;
    NSMutableArray *_msgModelArray;


}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _msgModelArray = [NSMutableArray array];
    _msgArray = @[
  @{@"content":@"7月31日，央行网站发布了关于向社会公开征求《非银行支付机构网络支付业务管理办法》（以下简称《征求意见稿》）的公告。当日晚间在社交网络媒体上炸开了锅。有危言耸听者竟然说，这是非银行网络支付机构的“灭顶之灾"},
  @{@"content":@"面对舆论质疑，央行紧急辟谣称，意见稿中限额5000元仅针对网络支付的余额支付方式，超过5000元的消费"},
  @{@"content":@"用户可以选择银行网银来付款。不过，为何非要用网银支付，而不直接用方便快捷的网络支付手段呢？为了客户安全，为了防范风险的理由再充分不过了"},
  @{@"content":@"言外之意就是，网络支付不完全，银行网银支付百分之百安全。"},
  @{@"content":@"网络舆论如潮质疑，引起笔者注目。从7月31日晚间就开始仔细研读《征求意见稿》。通过对七章五十七条，洋洋8000多字《征求意见稿》的“拜读”。笔者有一种如鲠在喉、不吐难受的感觉。"}];
    
    [self creatBaseView];
}


- (void)creatBaseView{
    UITableView *messageTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    messageTable.delegate = self;
    messageTable.dataSource = self;
    messageTable.separatorStyle = UITableViewCellSeparatorStyleNone;

    [self.view addSubview:messageTable];
    
    [self configModel];
}

- (void)configModel{
    [_msgArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        messageModel *msgModel = [messageModel messageModelWithDic:obj];
        [_msgModelArray addObject:msgModel];
        
    }];

}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _msgModelArray.count;

}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *Identifier = @"messageCell";
    messageCell *msgCell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (msgCell == nil) {
        msgCell = [[messageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    msgCell.selectionStyle = UITableViewCellSelectionStyleNone;
    messageModel *model = _msgModelArray[indexPath.row];
    msgCell.userImage.image = [UIImage imageNamed:@"fbb.jpg"];
    msgCell.userImage.layer.masksToBounds = YES;
    msgCell.userImage.layer.cornerRadius = msgCell.userImage.frame.size.height/2;
    msgCell.msgLabel.text = model.content;
    msgCell.msgLabel.font = [UIFont systemFontOfSize:15.0];
    NSDictionary* attribute = @{ NSFontAttributeName : msgCell.msgLabel.font };
    CGSize textSize1 = [model.content boundingRectWithSize:CGSizeMake(msgCell.msgLabel.frame.size.width,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    msgCell.msgLabel.text = model.content;
    CGRect rect = msgCell.msgLabel.frame;
    rect.size.height = textSize1.height +20;
    msgCell.msgLabel.frame = rect;
    CGRect imageframe = msgCell.msgBgImageView.frame;
    
    imageframe.size.height = textSize1.height +40;
    msgCell.msgBgImageView.frame = imageframe;
    msgCell.msgBgImageView.image = [[UIImage imageNamed:@"消息框"] resizableImageWithCapInsets:UIEdgeInsetsMake(50, 50, 10, 10)];
    return msgCell;


}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
     messageCell* cell = (messageCell*)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    CGFloat hight = CGRectGetMaxY(cell.msgBgImageView.frame);
    
    return hight + 15;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
