//
//  KTableViewCell.m
//  DemoForTable
//
//  Created by kangzhiqiang on 2019/8/5.
//  Copyright © 2019 kangxx. All rights reserved.
//

#import "KTableViewCell.h"

#import "KCollectionViewCell.h"

#define  SITEMW (375-60)/4
#define  SITENH  60

@interface KTableViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) UICollectionView *collectionView;;

@end
@implementation KTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
    }
    return self;
}
- (void)initUI {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumLineSpacing = 0;
    // 布局方式改为从上至下，默认从左到右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // Section Inset就是某个section中cell的边界范围
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 20, 10);
    // 每行内部cell item的间距
    flowLayout.minimumInteritemSpacing = 0;
    // 每行的间距
    flowLayout.minimumLineSpacing = 15;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 375, 80) collectionViewLayout:flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
//    _collectionView.pagingEnabled = YES;
    _collectionView.bounces = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [_collectionView registerNib:[UINib nibWithNibName:@"KCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"KCollectionViewCell"];
    [self addSubview:_collectionView];
}

#pragma mark UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeZero;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    KCollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"KCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor lightGrayColor];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(SITEMW, SITENH);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
   
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
