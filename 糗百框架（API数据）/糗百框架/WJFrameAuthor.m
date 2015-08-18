//
//  WJFrameAuthor.m
//  糗百框架
//
//  Created by 孙文君 on 15/6/29.
//  Copyright (c) 2015年 sunwenjun. All rights reserved.
//

#import "WJFrameAuthor.h"
#import "WJAuthor.h"
#define kAuthorNameFont [UIFont systemFontOfSize:13]

@implementation WJFrameAuthor

-(void)setAuthor:(WJAuthor *)author
{
    _author = author;
    
      CGSize size  = [author.login boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:0 attributes:@{NSFontAttributeName:kAuthorNameFont} context:nil].size;
    self.nameFrame = CGRectMake(50, 10, size.width, size.height);
    self.authorHeight = CGRectGetMaxY(self.nameFrame);
    
    self.frame  =CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.authorHeight);
}

@end
