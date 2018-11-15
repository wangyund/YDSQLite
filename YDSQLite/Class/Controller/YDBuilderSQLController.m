//
//  YDBuilderSQLController.m
//  YDSQLite
//
//  Created by rowena on 2018/11/15.
//  Copyright © 2018年 rowena. All rights reserved.
//

#import "YDBuilderSQLController.h"

@interface YDBuilderSQLController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titleList;

@end

@implementation YDBuilderSQLController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.titleList count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *builderSqlCell = @"YDBuilderSQLControllerUITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:builderSqlCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:builderSqlCell];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text = [self.titleList objectAtIndex:indexPath.row];
    return cell;
}
#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"您点击了-: %@",[self.titleList objectAtIndex:indexPath.row]);
}

#pragma mark -- get 函数
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame: self.view.bounds];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
- (NSArray *)titleList {
    if (!_titleList) {
        _titleList = @[@"测试壹 - 查询语句",@"测试贰 - 查询排序",@"测试叁 - 插入",@"测试肆 - 批量插入",@"测试伍 - 测试Dao",@"测试陆 - 测试创建数据库",@"测试柒 - 删除操作",@"测试捌 - 查询操作",@"测试玖 - 其他条件查询",@"测试拾 - 数据更新"];
    }
    return _titleList;
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
