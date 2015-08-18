//
//  WJAuthor.h
//  糗百框架
//
//  Created by 孙文君 on 15/6/29.
//  Copyright (c) 2015年 sunwenjun. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 * 
 "created_at": "0",
 "icon": "20150602061546.jpg",
 "id": "28755468",
 "last_device": null,
 "last_visited_at": "0",
 "login": "你是我支撑",
 "role": "n",
 "state": "active"
 */
@interface WJAuthor : NSObject
@property(nonatomic,copy)NSString *created_at;
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *ID;
@property(nonatomic,copy)NSString *last_device;
@property(nonatomic,copy)NSString *login;
@property(nonatomic,copy)NSString *role;
@property(nonatomic,copy)NSString *state;
+(instancetype)authorWithDic:(NSDictionary *)dic;

@end
