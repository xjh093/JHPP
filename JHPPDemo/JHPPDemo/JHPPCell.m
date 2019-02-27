//
//  JHPPCell.m
//  JHPPDemo
//
//  Created by HaoCold on 2019/2/27.
//  Copyright © 2019 HaoCold. All rights reserved.
//

#import "JHPPCell.h"
#import "JHPP.h"

@interface JHPPCell()
@property (nonatomic,  strong) UIButton *button;
@end

@implementation JHPPCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 10, 200, 36);
    button.backgroundColor = [UIColor lightGrayColor];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitleColor:[UIColor blackColor] forState:0];
    [button addTarget:self action:@selector(xx_click_button) forControlEvents:1<<6];
    [self.contentView addSubview:button];
    _button = button;
}

- (void)setIndexPath:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
    NSString *title = nil;
    if (indexPath.row == 0) {
        title = @"从 Cell 直接跳转1";
    }else if (indexPath.row == 1) {
        title = @"从 Cell 直接跳转2";
    }else if (indexPath.row == 2) {
        title = @"从 Cell 直接跳转3";
    }else if (indexPath.row == 3) {
        title = @"从 Cell 直接跳转4";
    }else if (indexPath.row == 4) {
        title = @"从 Cell 直接跳转5";
    }else if (indexPath.row == 5) {
        title = @"从 Cell 直接跳转6";
    }else if (indexPath.row == 6) {
        title = @"从 Cell 直接跳转7";
    }
    
    [_button setTitle:title forState:0];
}

- (void)xx_click_button
{
    if (self.indexPath.row == 0) {
        UIViewController *vc = [[UIViewController alloc] init];
        vc.title = @"JHPP Push 1";
        vc.view.backgroundColor = [UIColor whiteColor];
        [JHPP pushVC:vc from:self];
    }else if (self.indexPath.row == 1) {
        UIViewController *vc = [[UIViewController alloc] init];
        vc.title = @"JHPP Push 2";
        vc.view.backgroundColor = [UIColor whiteColor];
        [JHPP pushVC:vc from:nil];
    }else if (self.indexPath.row == 2) {
        
        dispatch_block_t callback = ^{
            [_button setTitleColor:[UIColor redColor] forState:0];
        };
        
        NSMutableDictionary *mdic = @{}.mutableCopy;
        [mdic setValue:@"跳转事件：在上一个控制器的 Cell 内" forKey:@"text"];
        [mdic setValue:@"JHPP Push 3" forKey:@"title"];
        [mdic setValue:callback forKey:@"callback"];
        
        [JHPP pushVC:@"JHPPVC3" paramter:mdic from:self];
    }else if (self.indexPath.row == 3) {
        
        dispatch_block_t callback = ^{
            [_button setTitleColor:[UIColor greenColor] forState:0];
        };
        
        NSMutableDictionary *mdic = @{}.mutableCopy;
        [mdic setValue:@"跳转事件：在上一个控制器的 Cell 内" forKey:@"text"];
        [mdic setValue:@"JHPP Push 4" forKey:@"title"];
        [mdic setValue:callback forKey:@"callback"];
        
        [JHPP pushVC:@"JHPPVC3" paramter:mdic from:nil];
    }else if (self.indexPath.row == 4) {
        
        [self.window addSubview:({
            UIView *view = [[UIView alloc] init];
            view.frame = CGRectMake(10, 200, CGRectGetWidth([UIScreen mainScreen].bounds)-20, 100);
            view.backgroundColor = [UIColor brownColor];
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0, 30, CGRectGetWidth(view.frame), 40);
            button.backgroundColor = [UIColor lightGrayColor];
            button.titleLabel.font = [UIFont systemFontOfSize:16];
            button.titleLabel.numberOfLines = 0;
            [button setTitle:@"这是一个添加在 Window 上的 view,测试跳转" forState:0];
            [button addTarget:self action:@selector(click_button:) forControlEvents:1<<6];
            [view addSubview:button];
            
            view;
        })];
    }else if (self.indexPath.row == 5) {
        dispatch_block_t callback = ^{
            [_button setTitleColor:[UIColor orangeColor] forState:0];
        };
        
        NSMutableDictionary *mdic = @{}.mutableCopy;
        [mdic setValue:@"跳转事件：在上一个控制器的 Cell 内" forKey:@"text"];
        [mdic setValue:@"JHPP Push 6" forKey:@"title"];
        [mdic setValue:callback forKey:@"callback"];
        
        [JHPP pushVC:@"JHPPVC3" paramter:mdic from:self];
    }else if (self.indexPath.row == 6) {
        [JHPP pushVC:@"JHPPVC6" paramter:nil from:nil];
    }
}

- (void)click_button:(UIButton *)button
{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.title = @"JHPP Push 5";
    vc.view.backgroundColor = [UIColor whiteColor];
    [JHPP pushVC:vc from:button];
    
    [button.superview removeFromSuperview];
}


@end
