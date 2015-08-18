//
//  WJViewCell.h
//  糗百框架
//
//  Created by 孙文君 on 15/6/29.
//  Copyright (c) 2015年 sunwenjun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WJFrameQiushi.h"

@interface WJViewCell : UITableViewCell

@property(nonatomic,strong)WJFrameQiushi *qiushiFrame;

+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
