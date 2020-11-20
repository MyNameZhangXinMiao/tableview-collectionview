//
//  KHeaderView.h
//  DemoForTable
//
//  Created by kangzhiqiang on 2019/8/5.
//  Copyright © 2019 kangxx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class KHeaderView;
@protocol KHeaderViewDelegate<NSObject>

- (void)headerView:(KHeaderView *)header;

@end
@interface KHeaderView : UIView
@property (nonatomic,weak) id <KHeaderViewDelegate> delegate;
@property (nonatomic,assign) NSUInteger section;

- (void)clickSelect:(BOOL)select;
@end

NS_ASSUME_NONNULL_END
