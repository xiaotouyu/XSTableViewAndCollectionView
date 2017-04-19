//
//  XSViewController.m
//  XSTableViewAndCollectionView
//
//  Created by dashuios126 on 2017/4/18.
//  Copyright © 2017年 dashuios126. All rights reserved.
//

#import "XSViewController.h"
#import "XSTableView.h"
#import "XSCollectionView.h"





@interface XSViewController ()<XSTableViewDelegate>

/** 左侧tableView */
@property (nonatomic,weak) XSTableView *tableView;
/** 内容View */
@property (nonatomic,weak) XSCollectionView *collectionView;



@end

@implementation XSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = random(244, 245, 247, 1.0);


    XSTableView *xs_tableView = [[XSTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    xs_tableView.backgroundColor = randomColor;
    xs_tableView.selectedDelegate = self;
    [self.view addSubview:xs_tableView];
    self.tableView = xs_tableView;
    xs_tableView.sd_layout.topEqualToView(self.view)
    .leftEqualToView(self.view)
    .widthIs(75)
    .heightIs(KSCREENHEIGHT);

    XSCollectionView *xs_collectionView = [[XSCollectionView alloc]initWithFrame:CGRectZero];
    xs_collectionView.lineSpacing = 5;
    xs_collectionView.interitemSpacing = 5;
    [self.view addSubview:xs_collectionView];
    self.collectionView = xs_collectionView;
    
    xs_collectionView.sd_layout.topSpaceToView(self.view, 64)
    .leftSpaceToView(xs_tableView, 10)
    .rightSpaceToView(self.view, 10)
    .heightIs(KSCREENHEIGHT-64);

}

- (void)didSelectedRowAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"%zd",indexPath.row);
    NSMutableArray *array = [NSMutableArray array];
    [self.collectionView.dataArray removeAllObjects];

    for (int i = 0; i < indexPath.row+1; i++) {
        [array addObject:@(i)];
        [self.collectionView.dataArray addObject:array];
    }
    [self.collectionView refreshView];
    NSLog(@"%@",self.collectionView.dataArray);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
