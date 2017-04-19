//
//  XSTableView.h
//  XSTableViewAndCollectionView
//
//  Created by dashuios126 on 2017/4/18.
//  Copyright © 2017年 dashuios126. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 在此处理点击事件 可以添加参数(或者添加方法),根据自己的需求 灵活改变 */
@protocol  XSTableViewDelegate<NSObject>

@optional

- (void)didSelectedRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface XSTableView : UITableView


@property (nonatomic,weak) id<XSTableViewDelegate> selectedDelegate;

@end
