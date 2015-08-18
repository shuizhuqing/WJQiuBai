//
//  WJqiushi.m
//  糗百框架
//
//  Created by 孙文君 on 15/6/29.
//  Copyright (c) 2015年 sunwenjun. All rights reserved.
//

#import "WJqiushi.h"
#import "WJFrameAuthor.h"
#import "WJFrameQiushi.h"
#import "WJAuthor.h"
#import "WJVote.h"

@implementation WJqiushi
+ (void)requestWithPath:(NSString*)path success:(void (^)(NSMutableArray* ar))myblock
{
    NSURL* url = [NSURL URLWithString:path];

    NSURLRequest* request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];

    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse* response, NSData* data, NSError* connectionError) {
                               NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];

                               NSArray* arr = dic[@"items"];
                               //                    NSLog(@"arr:===%@",arr);
                               NSMutableArray* temar = [NSMutableArray array];
                               [arr enumerateObjectsUsingBlock:^(NSDictionary* obj, NSUInteger idx, BOOL* stop) {
                                   NSLog(@"obj==%@", obj);

                                   //            WJqiushi *qiushi = [WJqiushi objectWithKeyValues:obj];
                                   WJqiushi* qiushi = [WJqiushi qiuWithDic:obj];
                                   // NSLog(@"%@",qiushi);
                                   WJFrameQiushi* qiushiFram = [[WJFrameQiushi alloc] init];
                                   qiushiFram.qiushi = qiushi;
                                   [temar addObject:qiushiFram];
                               }];

                               if (myblock) {
                                   myblock([temar copy]);
                               }

                           }];
}

+ (instancetype)qiuWithDic:(NSDictionary*)dic
{
    WJqiushi* qiu = [[self alloc] init];

    qiu.allow_comment = dic[@"allow_comment"];
    qiu.articletype = dic[@"articletype"];
    qiu.comments_count = dic[@"comments_count"];
    qiu.content = dic[@"content"];
    qiu.created_at = dic[@"created_at"];
    qiu.ID = dic[@"id"];
    qiu.image = dic[@"image"];
    qiu.image_size = dic[@"image_size"];
    qiu.published_at = dic[@"published_at"];
    qiu.state = dic[@"state"];
    qiu.tag = dic[@"tag"];
    qiu.type = dic[@"type"];
    if (dic[@"user"] != [NSNull null]) {
        id usr = dic[@"user"];
        NSLog(@"user===%@", usr);
        qiu.user = [WJAuthor authorWithDic:dic[@"user"]];
    }
    qiu.votes = [WJVote votWithDic:dic[@"votes"]];
    return qiu;
}

- (WJAuthor*)user
{
    if (_user == NULL) {
        WJAuthor* au = [[WJAuthor alloc] init];
        au.login = @"匿名用户";
        _user = au;
    }
    return _user;
}
@end
