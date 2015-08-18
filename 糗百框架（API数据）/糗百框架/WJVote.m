
//
//  WJVote.m
//  糗百框架
//
//  Created by 孙文君 on 15/6/29.
//  Copyright (c) 2015年 sunwenjun. All rights reserved.
//

#import "WJVote.h"

@implementation WJVote
+(instancetype)votWithDic:(NSDictionary *)dic
{
    WJVote *vot = [[WJVote alloc]init];
    [vot setValuesForKeysWithDictionary:dic];
    return vot;
}
@end
