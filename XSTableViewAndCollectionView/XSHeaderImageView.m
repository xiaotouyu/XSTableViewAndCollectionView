//
//  XSHeaderImageView.m
//  XSTableViewAndCollectionView
//
//  Created by dashuios126 on 2017/4/18.
//  Copyright © 2017年 dashuios126. All rights reserved.
//

#import "XSHeaderImageView.h"
@interface XSHeaderImageView ()
@property (nonatomic,weak) UILabel *titleLabel;
@property (nonatomic,weak) UIImageView *headerImageView;

@end
@implementation XSHeaderImageView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        UIImageView *imageView = [[UIImageView alloc]init];
//        imageView.image = [UIImage imageNamed:@"pic"];
        imageView.backgroundColor = [UIColor cyanColor];
        [self.contentView addSubview:imageView];
        self.headerImageView = imageView;
        imageView.sd_layout.topEqualToView(self.contentView)
        .leftEqualToView(self.contentView)
        .widthRatioToView(self.contentView, 1.0)
        .heightIs(100);

        UILabel *title = [[UILabel alloc]init];
        title.font = [UIFont systemFontOfSize:20];
        title.textColor = [UIColor darkGrayColor];
        [self.contentView addSubview:title];
        title.sd_layout.topSpaceToView(imageView, 10)
        .leftEqualToView(self.contentView)
        .widthRatioToView(self.contentView, 1.0)
        .heightIs(35);

        self.titleLabel = title;

    }
    return self;
}

- (void)setTitle:(NSString *)title{
    _title = title;
    self.titleLabel.text = title;
}

@end
