//
//  XSCollectionViewCell.m
//  XSTableViewAndCollectionView
//
//  Created by dashuios126 on 2017/4/18.
//  Copyright © 2017年 dashuios126. All rights reserved.
//

#import "XSCollectionViewCell.h"

@implementation XSCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.image = [UIImage imageNamed:@"pic"];
        [self.contentView addSubview:imageView];
        imageView.sd_layout.topEqualToView(self.contentView)
        .leftEqualToView(self.contentView)
        .widthRatioToView(self.contentView, 1.0)
        .heightRatioToView(self.contentView, 1.0);
    }
    return self;
}

@end
