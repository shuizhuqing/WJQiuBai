//
//  WJqiushi.h
//  糗百框架
//
//  Created by 孙文君 on 15/6/29.
//  Copyright (c) 2015年 sunwenjun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class WJAuthor,WJVote;
/**
 *  "allow_comment": true,
 "articletype": "word",
 "comments_count": 15,
 "content": "有没有人怎么吃都不会胖的，反而一饿就瘦，这是病吗？",
 "created_at": 1435593111,
 "id": "111074398",
 "image": null,
 "image_size": null,
 "published_at": 1435593111,
 "state": "publish",
 "tag": "",
 "type": "fresh",
 "user": {
     
 },
"votes": {
    "down": -21,
      "up": 151
 }
 
 */
@interface WJqiushi : NSObject
@property(nonatomic,assign)BOOL allow_comment;//是否允许评论
@property(nonatomic,copy)NSString *articletype;//糗事类型
@property(nonatomic,copy)NSNumber* comments_count;//评论数
@property(nonatomic,copy)NSString *content;//内容
@property(nonatomic,assign)NSNumber *created_at;//创建人ID
@property(nonatomic,copy)NSString *ID;//糗事Id
@property(nonatomic,copy)NSString *image;//图片url
@property(nonatomic,copy)NSNumber * image_size;//图片大小
@property(nonatomic,copy)NSString *published_at;//发布人ID
@property(nonatomic,copy)NSString *state;//发布审核状态
@property(nonatomic,copy)NSString *tag;
@property(nonatomic,copy)NSString *type;//"热门"，“新鲜”
@property(nonatomic,strong)WJAuthor *user;//作者
@property(nonatomic,strong)WJVote *votes;//”支持“，”反对“数量

+(void)requestWithPath:(NSString *)path success:(void(^)(NSMutableArray *ar))myblock;
+(instancetype)qiuWithDic:(NSDictionary *)dic;
@end
