//
//  XSCollectionView.m
//  XSTableViewAndCollectionView
//
//  Created by dashuios126 on 2017/4/18.
//  Copyright © 2017年 dashuios126. All rights reserved.
//

#import "XSCollectionView.h"
#import "XSHeaderView.h"
#import "XSCollectionViewCell.h"
#import "XSHeaderImageView.h"

@interface XSCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,weak) UICollectionView *collectionView;

@end

@implementation XSCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.dataArray = [NSMutableArray array];
        UICollectionViewFlowLayout *f_layout = [[UICollectionViewFlowLayout alloc]init];
        f_layout.minimumLineSpacing = 0;
        f_layout.minimumInteritemSpacing = 0;

        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:f_layout];
        collectionView.backgroundColor = [UIColor whiteColor];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        [self addSubview:collectionView];

        self.collectionView = collectionView;
        collectionView.sd_layout.topEqualToView(self)
        .leftEqualToView(self)
        .widthRatioToView(self, 1.0)
        .heightRatioToView(self, 1.0);

         [collectionView registerClass:[XSCollectionViewCell class] forCellWithReuseIdentifier:@"xs_collection"];
        [collectionView registerClass:[XSHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
        [collectionView registerClass:[XSHeaderImageView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerImage"];
    }
    return self;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.dataArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return [self.dataArray[section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    XSCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"xs_collection" forIndexPath:indexPath];
//    cell.backgroundColor = randomColor;
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {

        if (indexPath.section == 0) {
            XSHeaderImageView *imgView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerImage" forIndexPath:indexPath];
            imgView.title = [NSString stringWithFormat:@"%ld",indexPath.section];
            return imgView;
        }else{
            XSHeaderView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
            view.backgroundColor = randomColor;
            view.title = [NSString stringWithFormat:@"%ld",indexPath.section];
            return view;
        }
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(self.size.width, 140);
    }else{
        return CGSizeMake(self.size.width, 40);
    }
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat space = self.interitemSpacing > 0 ? self.interitemSpacing : 0.0;
    CGFloat WH = (self.collectionView.frame.size.width - 4 * space)/3;
    return CGSizeMake(WH, WH);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return self.lineSpacing;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return self.interitemSpacing;
}

- (void)setLineSpacing:(CGFloat)lineSpacing{
    _lineSpacing = lineSpacing;
}

- (void)setInteritemSpacing:(CGFloat)interitemSpacing{
    _interitemSpacing = interitemSpacing;
}

- (void)setDataArray:(NSMutableArray *)dataArray{
    _dataArray = dataArray;
}

- (void)refreshView{
    
    [self.collectionView reloadData];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
