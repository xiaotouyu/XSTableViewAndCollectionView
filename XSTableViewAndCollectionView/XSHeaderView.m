//
//  XSHeaderView.m
//  XSTableViewAndCollectionView
//
//  Created by dashuios126 on 2017/4/18.
//  Copyright © 2017年 dashuios126. All rights reserved.
//

#import "XSHeaderView.h"

@interface XSHeaderView ()
@property (nonatomic,weak) UILabel *titleLabel;

@end

@implementation XSHeaderView



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        UILabel *title = [[UILabel alloc]init];
        title.font = [UIFont systemFontOfSize:20];
        title.textColor = [UIColor darkGrayColor];
        [self.contentView addSubview:title];
        title.sd_layout.topEqualToView(self.contentView)
        .leftEqualToView(self.contentView)
        .widthRatioToView(self.contentView, 1.0)
        .heightRatioToView(self.contentView, 1.0);


        self.titleLabel = title;

    }
    return self;
}

- (void)setTitle:(NSString *)title{
    _title = title;
    self.titleLabel.text = title;
}



@end
