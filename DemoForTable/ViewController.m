//
//  ViewController.m
//  DemoForTable
//
//  Created by kangzhiqiang on 2019/8/5.
//  Copyright © 2019 kangxx. All rights reserved.
//

#import "ViewController.h"

#import "KModel.h"

#import "KHeaderView.h"
#import "KTableViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,KHeaderViewDelegate>
{
    NSUInteger selectIndex;
    KHeaderView *selectHeader;
}
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _dataArr = @[].mutableCopy;
    for (int i = 0; i < 10; i++) {
        KModel *model = [KModel new];
        if (i == 0) {
            model.expend = YES;
        }
        [_dataArr addObject:model];
    }
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[KTableViewCell class] forCellReuseIdentifier:@"KTableViewCell"];
    
}
#pragma mark - tableview delegate / dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    KModel *m = _dataArr[section];
    if (m.expend) {
        return 1;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KTableViewCell"];
    if (!cell) {
        cell = [[KTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"KTableViewCell"];
    }
    
    cell.selectionStyle = 0;
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    KModel *m = _dataArr[section];
    KHeaderView *header = [[KHeaderView alloc] initWithFrame:CGRectMake(0, 0, 375, 40)];
    header.backgroundColor = [UIColor redColor];
    header.delegate = self;
    header.section = section;
    if (section == 0) {
        selectHeader = header;
    }
    [header clickSelect:m.expend];
    return header;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 
}
- (void)headerView:(KHeaderView *)customHeaderFooterView{
    
    NSInteger section = customHeaderFooterView.section;
    KModel *model = _dataArr[section];
    KHeaderView *classHeaderView = (KHeaderView *)customHeaderFooterView;
    
    if (selectIndex == section) {
        if (model.expend == YES) {
           
        } else {
            // 显示出来
            model.expend = YES;
            [classHeaderView clickSelect:YES];
            [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForItem:0 inSection:section]] withRowAnimation:UITableViewRowAnimationFade];
        }
    }else{
        if (model.expend == YES) {
            // 缩回去
            model.expend = NO;
            [classHeaderView clickSelect:NO];
            [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForItem:0 inSection:section]] withRowAnimation:UITableViewRowAnimationFade];
        } else {
            // 显示出来
            model.expend = YES;
            [classHeaderView clickSelect:YES];
            [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForItem:0 inSection:section]] withRowAnimation:UITableViewRowAnimationFade];
        }
        KModel *premodel = _dataArr[selectIndex];
        if (premodel.expend) {
            premodel.expend = NO;
            [selectHeader clickSelect:NO];
            [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForItem:0 inSection:selectIndex]] withRowAnimation:UITableViewRowAnimationFade];
        }
        selectIndex = section;
        selectHeader = customHeaderFooterView;
    }
    
}

#pragma mark - getter / setter

- (UITableView *)tableView
{
    if (_tableView == nil) {
        CGFloat top = 20;
        CGRect frame = CGRectMake(0, 0, 375, 667-top);
        //        CGRect frame = self.view.bounds;
        _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.delegate = self;
        _tableView.separatorStyle = 0;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        
        
    }
    return _tableView;
}
@end
