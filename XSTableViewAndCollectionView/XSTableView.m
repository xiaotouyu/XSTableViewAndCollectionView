//
//  XSTableView.m
//  XSTableViewAndCollectionView
//
//  Created by dashuios126 on 2017/4/18.
//  Copyright © 2017年 dashuios126. All rights reserved.
//

#import "XSTableView.h"

@interface XSTableView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) UILabel *line;
@end

@implementation XSTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{

    self = [super initWithFrame:frame style:style];
    if (self) {

        [self setData];
        self.dataSource = self;
        self.delegate = self;
        self.separatorInset = UIEdgeInsetsZero;

        /** 设置默认选中第一行 */
        NSIndexPath*indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionTop];

        UILabel *line = [[UILabel alloc]init];
        line.backgroundColor = [UIColor redColor];
        [self addSubview:line];
        self.line = line;
        line.sd_layout.topEqualToView(self)
        .leftEqualToView(self)
        .widthIs(5)
        .heightIs(44);
        [line updateLayout];
    }
    return self;
}
/** 测试数据 */
- (void)setData{

    self.dataArray = @[@"推荐分类",@"推荐分类",@"推荐分类",@"推荐分类",@"推荐分类",@"推荐分类",@"推荐分类",@"推荐分类",@"推荐分类",@"推荐分类",@"推荐分类",@"推荐分类",@"推荐分类",@"推荐分类",@"推荐分类",@"推荐分类",@"推荐分类",@"推荐分类",@"推荐分类",@"推荐分类",@"推荐分类",@"推荐分类",@"推荐分类",@"推荐分类",@"推荐分类",@"推荐分类",@"推荐分类",@"推荐分类",@"推荐分类"].mutableCopy;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dataArray.count > 0 ? self.dataArray.count : 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *rid = @"XSCELL";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rid];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                reuseIdentifier:rid];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.adjustsFontSizeToFitWidth = YES;
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        /*设置cell 选中是的背景 和 字体颜色*/
        cell.textLabel.highlightedTextColor = [UIColor redColor];
        cell.selectedBackgroundView = [[UIView alloc]initWithFrame:cell.frame];
        cell.selectedBackgroundView.backgroundColor = random(244, 245, 247, 1.0);
    }

    cell.textLabel.text = [NSString stringWithFormat:@"%@",self.dataArray[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [UIView animateWithDuration:0.2 animations:^{
        self.line.frame = CGRectMake(0, 44*indexPath.row, 5, 44);
    }];
    if (self.selectedDelegate != nil && [self.selectedDelegate respondsToSelector:@selector(didSelectedRowAtIndexPath:)]) {
        [self.selectedDelegate didSelectedRowAtIndexPath:indexPath];
    }
}

//- (UIImage*) createImageWithColor:(UIColor*) color
//{
//    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
//    UIGraphicsBeginImageContext(rect.size);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(context, [color CGColor]);
//    CGContextFillRect(context, rect);
//    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return theImage;
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
