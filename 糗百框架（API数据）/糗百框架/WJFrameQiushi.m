//
//  WJFrameQiushi.m
//  糗百框架
//
//  Created by 孙文君 on 15/6/29.
//  Copyright (c) 2015年 sunwenjun. All rights reserved.
//
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kMargin 10
#define kContentFont    [UIFont systemFontOfSize:14]

#import "WJFrameQiushi.h"
#import "WJqiushi.h"
#import "WJFrameAuthor.h"

@implementation WJFrameQiushi

-(void)setQiushi:(WJqiushi *)qiushi
{
    _qiushi = qiushi;
    
    //计算作者拦
    WJAuthor *user =  qiushi.user;
    WJFrameAuthor *autho = [[WJFrameAuthor alloc] init];
    autho.author = user;
    self.authorFrame = autho;
    
    //计算内容栏

    
    CGSize con = [qiushi.content boundingRectWithSize:CGSizeMake(kScreenWidth-2*kMargin, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:kContentFont} context:nil].size;
    NSLog(@"size = %@",NSStringFromCGSize(con));
    self.contentFra  =CGRectMake(kMargin, self.authorFrame.authorHeight+kMargin, con.width, con.height);
    
    self.rowHeight = CGRectGetMaxY(self.contentFra);

}

@end
