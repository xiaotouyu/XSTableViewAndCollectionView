//
//  XSCollectionView.h
//  XSTableViewAndCollectionView
//
//  Created by dashuios126 on 2017/4/18.
//  Copyright © 2017年 dashuios126. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XSCollectionView : UIView
/** 行间距 */
@property (nonatomic,assign) CGFloat lineSpacing;
/** 列间距 */
@property (nonatomic,assign) CGFloat interitemSpacing;

/** 右侧列表需要的数据 */
@property (nonatomic,strong) NSMutableArray *dataArray;
/** 刷新界面 */
- (void)refreshView;

@end
