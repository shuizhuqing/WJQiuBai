//
//  WJFrameQiushi.h
//  糗百框架
//
//  Created by 孙文君 on 15/6/29.
//  Copyright (c) 2015年 sunwenjun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class WJqiushi,WJFrameAuthor;
@interface WJFrameQiushi : NSObject

//@property(nonatomic,assign)CGRect authorFra;//作者view  frame
@property(nonatomic,assign)CGRect contentFra;//内容 view frame
//@property(nonatomic,assign) authorFra;
@property(nonatomic,strong)WJqiushi *qiushi;

@property(nonatomic,strong)WJFrameAuthor *authorFrame;

@property(nonatomic,assign)CGFloat rowHeight;
@end
