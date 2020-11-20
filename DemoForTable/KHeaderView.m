//
//  KHeaderView.m
//  DemoForTable
//
//  Created by kangzhiqiang on 2019/8/5.
//  Copyright © 2019 kangxx. All rights reserved.
//

#import "KHeaderView.h"
@interface KHeaderView()
{
    UILabel *lb;
}
@end
@implementation KHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self addGestureRecognizer:tap];
    
    lb = [UILabel new];
    lb.frame = CGRectMake(0, 0, 375, 40);
    lb.text = @"   Title";
    lb.backgroundColor = [UIColor whiteColor];
    [self addSubview:lb];
    
    UIView *linet = [UIView new];
    linet.frame = CGRectMake(0, 0, 375, 1);
    linet.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:linet];
}
- (void)tap{
    [self.delegate headerView:self];
}
- (void)clickSelect:(BOOL)select{
    lb.textColor = select?[UIColor redColor]:[UIColor lightGrayColor];
}
@end
