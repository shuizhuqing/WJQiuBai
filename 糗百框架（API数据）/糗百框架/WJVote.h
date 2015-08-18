//
//  WJVote.h
//  糗百框架
//
//  Created by 孙文君 on 15/6/29.
//  Copyright (c) 2015年 sunwenjun. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *      "down": -21,
        "up": 151

 */
@interface WJVote : NSObject
@property(nonatomic,strong)NSNumber * down;
@property(nonatomic,strong)NSNumber * up;
+(instancetype)votWithDic:(NSDictionary *)dic;
@end
