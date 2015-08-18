//
//  ChunWenController.m
//  糗百框架
//
//  Created by 孙文君 on 15/6/29.
//  Copyright (c) 2015年 sunwenjun. All rights reserved.
//

#import "ChunWenController.h"
#import "WJqiushi.h"
#import "WJViewCell.h"
#import "WJFrameQiushi.h"
#define path @"http://m2.qiushibaike.com/article/list/text?count=30&readarticles=%5B111072868%2C107325794%5D&page=1&AdID=14355714038354678BCBD6"
@interface ChunWenController ()

@property(nonatomic,strong)NSMutableArray *modeFramArr;//存储所有的实体
//@property(nonatomic,weak)UIRefreshControl *refresh;
@end

@implementation ChunWenController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    [self.refreshControl beginRefreshing];            id result = [resultClass objectWithKeyValues:responseObj];
    
    [self setUpRefresh];
    [self loadNewData];
   
}
//-(void)setModeFramArr:(NSMutableArray *)modeFramArr
//{
//    if (_modeFramArr ==nil) {
//        _modeFramArr = [NSMutableArray array];
////        //_modeFramArr = modeFramArr;
////    }else{
////        [self.modeFramArr addObjectsFromArray:modeFramArr];
//    }
//    [self.tableView reloadData];
//}
-(NSMutableArray *)modeFramArr
{
    if (_modeFramArr ==nil) {
        _modeFramArr = [NSMutableArray array];
    }
    return _modeFramArr;

}
-(void)setUpRefresh
{

    UIRefreshControl *refre = [[UIRefreshControl alloc] init];
    refre.tintColor = [UIColor grayColor];
    refre.attributedTitle = [[NSAttributedString alloc] initWithString:@"正在努力加载" attributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]}];
    [self.tableView addSubview:refre];
    self.refreshControl = refre;
    [self.refreshControl addTarget:self action:@selector(loadNewData) forControlEvents:UIControlEventValueChanged];
}
-(void)loadNewData
{
    [self.refreshControl beginRefreshing];
    __weak typeof (self) weaSel = self;
    [WJqiushi requestWithPath:path
                      success:^(NSMutableArray *arr) {
//                          NSRange rang =NSMakeRange(0, arr.count);
//                          NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:rang];
//                          [weaSel.modeFramArr insertObjects:arr atIndexes:set];
                          [weaSel.modeFramArr removeAllObjects];
                          [weaSel.modeFramArr addObjectsFromArray:arr];
                          [weaSel.tableView reloadData];
                          [weaSel.refreshControl endRefreshing];
                          
                      }];

}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.modeFramArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WJViewCell *cell = [WJViewCell cellWithTableView:tableView];
    
    WJFrameQiushi *qiushiF = self.modeFramArr[indexPath.row];
    cell.qiushiFrame = qiushiF;
    // Configure the cell...
    
    return cell;
}
-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WJFrameQiushi *qiushiF = self.modeFramArr[indexPath.row];
    //NSLog(@"%d = %f",indexPath.row,qiushiF.rowHeight);
    return qiushiF.rowHeight;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
