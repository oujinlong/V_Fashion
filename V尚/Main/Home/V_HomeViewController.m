//
//  V_HomeViewController.m
//  V尚
//
//  Created by oujinlong on 16/5/18.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import "V_HomeViewController.h"
#import "V_NavSegView.h"
#import "V_HomeModel.h"
#import "V_HomeTableViewCell.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "MJRefresh.h"
#import "YSLTransitionAnimator.h"
#import "UIViewController+YSLTransition.h"
#import "V_HomeDetailViewController.h"
@interface V_HomeViewController () <V_NavSegViewDelegate,UITableViewDataSource,UITableViewDelegate,YSLTransitionAnimatorDataSource,UINavigationControllerDelegate>
@property (nonatomic, strong) NSMutableArray* modelList;

@property (nonatomic, weak) UITableView* tableView;
@end

@implementation V_HomeViewController

- (NSMutableArray *)modelList
{
    if (!_modelList) {
        _modelList = [NSMutableArray array];
    }
    return _modelList;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self ysl_removeTransitionDelegate];
    
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    float statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    float navigationHeight = self.navigationController.navigationBar.frame.size.height;
    
    [self ysl_addTransitionDelegate:self];
    [self ysl_pushTransitionAnimationWithToViewControllerImagePointY:statusHeight + navigationHeight + 50
                                                   animationDuration:0.3];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
    
    [self setupMain];
    
    [self.tableView.mj_header beginRefreshing];
    
}
#pragma mark 布局相关
- (void)setupNav {
    
    self.navigationController.navigationBar.translucent = NO;
    
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    
    V_NavSegView* segView = [[V_NavSegView alloc] initWithFrame:CGRectMake(0, 0, 82, 40)];
    
    segView.delegate = self;
    
    self.navigationItem.titleView = segView;
}

-(void)setupMain{
    
    UITableView* tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView = tableView;
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    [self setupRefresh];
}

-(void)setupRefresh{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
}


#pragma mark 数据相关
-(void)loadData{
    [self.modelList removeAllObjects];
    
    [self.modelList addObjectsFromArray:[V_HomeModel models]];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(arc4random_uniform(2) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
        [self.tableView.mj_header endRefreshing];
    });
}
-(void)loadMore{
    [self.modelList addObjectsFromArray:[V_HomeModel models]];
    
    [self.tableView reloadData];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(arc4random_uniform(2) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
        [self.tableView.mj_header endRefreshing];
    });
}
#pragma mark UITableViewDataSource,UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.modelList.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    V_HomeTableViewCell* cell = [V_HomeTableViewCell cellWithTableView:tableView];
    
    cell.model = self.modelList[indexPath.section];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView cellHeightForIndexPath:indexPath model:self.modelList[indexPath.section] keyPath:@"model" cellClass:[V_HomeTableViewCell class] contentViewWidth:[UIScreen mainScreen].bounds.size.width];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    V_HomeTableViewCell* cell = [self.tableView cellForRowAtIndexPath:indexPath];
    if (cell.contentImageView.image == nil) {
        return;
    }
    V_HomeDetailViewController* vc = [[V_HomeDetailViewController alloc] initWithHomeModel:self.modelList[indexPath.section] imageSize:cell.contentImageView.image.size];
    self.navigationController.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark V_NavSegViewDelegate
-(void)V_NavSegView:(V_NavSegView *)V_NavSegView didSelectAtIndex:(NSInteger)index{
    NSLog(@"%s--%zd",__func__,index);
    
    [self.tableView.mj_header beginRefreshing];
}

#pragma mark -- YSLTransitionAnimatorDataSource
- (UIImageView *)pushTransitionImageView
{
    NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
    
    V_HomeTableViewCell* cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    return cell.contentImageView;
}

- (UIImageView *)popTransitionImageView
{
    return nil;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
