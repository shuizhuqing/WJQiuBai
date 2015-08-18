//
//  WJFrameAuthor.h
//  糗百框架
//
//  Created by 孙文君 on 15/6/29.
//  Copyright (c) 2015年 sunwenjun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class WJAuthor;
@interface WJFrameAuthor : NSObject
@property(nonatomic,assign)CGRect nameFrame;//昵称frame

@property(nonatomic,assign)CGFloat authorHeight;//author lable的高度

@property(nonatomic,assign)CGRect frame;
@property(nonatomic,strong)WJAuthor *author;

@end
