//
//  WJAuthorView.m
//  糗百框架
//
//  Created by 孙文君 on 15/6/30.
//  Copyright (c) 2015年 sunwenjun. All rights reserved.
//
#define kAuthorNameFont [UIFont systemFontOfSize:13]

#import "WJAuthorView.h"
#import "WJFrameAuthor.h"
#import "WJAuthor.h"

@interface WJAuthorView ()

@property(nonatomic,weak)UILabel *nameLabel;

@end
@implementation WJAuthorView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UILabel *lab =  [[UILabel alloc] init];
        [self addSubview:lab];
        lab.font = kAuthorNameFont;
        self.nameLabel= lab;
        
    }
    return self;

}
-(void)setAuthorFrame:(WJFrameAuthor *)authorFrame
{

    _authorFrame = authorFrame;
    WJAuthor *autho = authorFrame.author;
    self.nameLabel.frame = authorFrame.nameFrame;
    self.frame = authorFrame.frame;
    
    self.nameLabel.text =autho.login;
    
}

@end
