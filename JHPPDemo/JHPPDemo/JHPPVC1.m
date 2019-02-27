//
//  JHPPVC1.m
//  JHPPDemo
//
//  Created by HaoCold on 2019/2/27.
//  Copyright © 2019 HaoCold. All rights reserved.
//

#import "JHPPVC1.h"
#import "JHPPCell.h"

@interface JHPPVC1 ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,  strong) UITableView *tableView;

@end

@implementation JHPPVC1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Push & Present";
    
    [self xjh_setupViews];
}

#pragma mark -------------------------------------视图-------------------------------------------

- (void)xjh_setupViews
{
    [self.view addSubview:self.tableView];
}

#pragma mark -------------------------------------事件-------------------------------------------

#pragma mark ---UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JHPPCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (!cell) {
        cell = [[JHPPCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    }
    cell.indexPath = indexPath;
    return cell;
}

#pragma mark -------------------------------------懒加载-----------------------------------------

- (UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:0];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = 56;
        tableView.tableFooterView = [[UIView alloc] init];
        tableView.showsVerticalScrollIndicator = NO;
        _tableView = tableView;
    }
    return _tableView;
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
