//
//  WJViewCell.m
//  糗百框架
//
//  Created by 孙文君 on 15/6/29.
//  Copyright (c) 2015年 sunwenjun. All rights reserved.
//
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kMargin 10
#define kContentFont [UIFont systemFontOfSize:14]

#import "WJViewCell.h"
#import "WJAuthorView.h"
#import "WJqiushi.h"

@interface WJViewCell ()

@property (nonatomic, weak) WJAuthorView* authorView;

@property (nonatomic, weak) UILabel* contentLabel;



@end

@implementation WJViewCell

+ (instancetype)cellWithTableView:(UITableView*)tableView
{
    static NSString* ID = @"cell";
    WJViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ID];

    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }

    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier
{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //上部作者栏
        WJAuthorView *authView = [[WJAuthorView alloc] init];
        [self.contentView addSubview:authView];
        self.authorView = authView;
        
        //中部内容
        UILabel* contenLab = [[UILabel alloc] init];
        contenLab.numberOfLines = 0;
        contenLab.font = kContentFont;
        [self.contentView addSubview:contenLab];
        self.contentLabel = contenLab;
    }
    return self;
}

- (void)setQiushiFrame:(WJFrameQiushi*)qiushiFrame
{
    _qiushiFrame = qiushiFrame;
    WJqiushi *qiushi = qiushiFrame.qiushi;
    //给出控件位置
    self.authorView.authorFrame = qiushiFrame.authorFrame;
    self.contentLabel.frame = qiushiFrame.contentFra;
    //给控件赋值
    self.contentLabel.text = qiushi.content;
    
    
}

@end
