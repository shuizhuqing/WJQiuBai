//
//  WJAuthor.m
//  糗百框架
//
//  Created by 孙文君 on 15/6/29.
//  Copyright (c) 2015年 sunwenjun. All rights reserved.
//

#import "WJAuthor.h"

@implementation WJAuthor
+(instancetype)authorWithDic:(NSDictionary *)dic
{
    WJAuthor *aut = [[WJAuthor alloc] init];
    aut.created_at = dic[@"created_at"];
    aut.icon = dic[@"icon"];

    aut.ID = dic[@"id"];

    aut.last_device = dic[@"last_device"];

    aut.login = dic[@"login"];

    aut.role = dic[@"role"];
    
    aut.state = dic[@"state"];
    return aut;
}
@end
