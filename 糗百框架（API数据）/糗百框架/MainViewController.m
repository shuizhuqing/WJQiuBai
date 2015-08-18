//
//  MainViewController.m
//  糗百框架
//
//  Created by 孙文君 on 15/5/30.
//  Copyright (c) 2015年 sunwenjun. All rights reserved.
//
#define widthScree self.view.bounds.size.width
#define heightScree self.view.bounds.size.height

#import "DSNavigationBar.h"
#import "MainViewController.h"
#import "UIImage+Extension.h"
#import "ChunWenController.h"
@interface MainViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView* scrollView;
@property (nonatomic, weak) UIPageControl* pageControl; //最顶部的pageControl

@property (nonatomic, weak) UIButton* clickTopBtn;//被选中的top button
@property (nonatomic, weak) UIView* slipView;
@property (nonatomic, weak) UIView* topView;//顶部的topView，包含四个topButton

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //自定义顶部标题
    UIView* titlView = [[UIView alloc] initWithFrame:CGRectMake(30, 0, 200, 44)];
    titlView.backgroundColor = [UIColor yellowColor];

    UILabel* label = [[UILabel alloc] init];
    label.text = @"糗事百科";
    label.textAlignment = NSTextAlignmentCenter;
    label.frame = CGRectMake(0, 0, 200, 38);
    [titlView addSubview:label];

    UIPageControl* pageCon = [[UIPageControl alloc] init];

    pageCon.numberOfPages = 4;
    pageCon.pageIndicatorTintColor = [UIColor grayColor];
    pageCon.currentPageIndicatorTintColor = [UIColor orangeColor];
    pageCon.frame = CGRectMake(0, 38, 200, 6);
    [titlView addSubview:pageCon];
    self.pageControl = pageCon;

    self.navigationItem.titleView = titlView;

    //定义topView
    NSArray* titleArray = @[ @"专享", @"视频", @"纯文", @"纯图" ];
    CGFloat topViewHeig = 44;
    UIView* topview = [[UIView alloc] initWithFrame:CGRectMake(0, 64, widthScree, topViewHeig)];
    CGFloat btnWidth = widthScree * 0.25;
    topview.backgroundColor = [UIColor grayColor];

    for (int m = 0; m < 4; m++) { //给topView中添加四个button
        UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(m * btnWidth, 0, btnWidth, 30)];
        [btn setTitle:titleArray[m] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(topBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];
        [topview addSubview:btn];
    }
    //滑块添加
    UIView* slipVi = [[UIView alloc] initWithFrame:CGRectMake(0, 30, btnWidth, 10)];
    ;
    slipVi.backgroundColor = [UIColor orangeColor];
    self.slipView = slipVi;
    [topview addSubview:slipVi];
    self.topView = topview;

    [self.view addSubview:topview];
    //scrollView 中的tableview
    self.view.backgroundColor = [UIColor lightGrayColor];
    // Do any additional setup after loading the view.

    for (int i = 0; i < 4; i++) {

        UITableView* table = [[UITableView alloc] init];
        if (i == 2) {
            ChunWenController* chun = [[ChunWenController alloc] init];
            [self addChildViewController:chun];
            table = chun.tableView;
        }
        table.backgroundColor = (i % 2 == 0) ? [UIColor redColor] : [UIColor blueColor];
        CGFloat x = i * widthScree;
        table.frame = CGRectMake(x, 0, widthScree, heightScree);
        [self.scrollView addSubview:table];
    }
    self.scrollView.contentSize = CGSizeMake(4 * widthScree, 0);
    self.scrollView.bounces = YES;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
}

//顶部topButton被点击后的动作：
- (void)topBtnDidClick:(UIButton*)btn
{
    //切换被选中按钮
    self.clickTopBtn.selected = NO;
    btn.selected = YES;
    self.clickTopBtn = btn;
    
    
    //计算滑块滑动到指定位置所需的时间
    CGFloat btnX = btn.frame.origin.x;
    CGFloat slipX = self.slipView.frame.origin.x;
    CGFloat instance = ABS(btnX-slipX);//  (btnX - slipX) <= 0 ? (slipX - btnX) : (btnX - slipX);
    CGFloat tieme = instance / (btn.frame.size.width) * 0.3;

    CGRect orifram = self.slipView.frame;
    orifram.origin.x = btnX;
    [UIView animateWithDuration:tieme
                     animations:^{

                         self.slipView.frame = orifram;
                         self.scrollView.contentOffset = CGPointMake(btnX * 4, 0);
                     }];
}


#pragma mark scrollDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView*)scrollView
{

    NSLog(@"%s", __func__);
}

- (void)scrollViewDidScroll:(UIScrollView*)scrollView
{
    NSLog(@"%f", scrollView.contentOffset.x);
    CGFloat offX = scrollView.contentOffset.x;
    int page = (int)(offX / widthScree + 0.5);
    if (page != self.pageControl.currentPage) {
        self.pageControl.currentPage = page;
    }
    //移动滑条
    CGRect orifram = self.slipView.frame;
    orifram.origin.x = offX * 0.25;
    self.slipView.frame = orifram;
}
- (void)scrollViewDidEndDragging:(UIScrollView*)scrollView willDecelerate:(BOOL)decelerate
{
    //按钮选中状态
    //CGFloat offX =  scrollView.contentOffset.x;

    for (UIButton* btn in self.topView.subviews) {
        if ([btn isKindOfClass:[UIButton class]]) {
            if (btn.frame.origin.x == self.pageControl.currentPage * btn.frame.size.width) {
                //[self topBtnDidClick:btn];
                self.clickTopBtn.selected = NO;
                btn.selected = YES;
                self.clickTopBtn = btn;
                break;
            }
        }
    }
}
@end
