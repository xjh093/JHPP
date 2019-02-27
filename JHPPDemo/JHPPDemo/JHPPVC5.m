//
//  JHPPVC5.m
//  JHPPDemo
//
//  Created by HaoCold on 2019/2/27.
//  Copyright © 2019 HaoCold. All rights reserved.
//

#import "JHPPVC5.h"
#import "JHPP.h"

@interface JHPPVC5 ()

@end

@implementation JHPPVC5

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"JHPPVC5";
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupViews];
    
}

#pragma mark -------------------------------------视图-------------------------------------------

- (void)setupViews
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 100, CGRectGetWidth(self.view.frame)-40, 30);
    button.backgroundColor = [UIColor lightGrayColor];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitle:@"Push" forState:0];
    [button setTitleColor:[UIColor blackColor] forState:0];
    [button addTarget:self action:@selector(click_button) forControlEvents:1<<6];
    [self.view addSubview:button];
    
    {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 150, CGRectGetWidth(self.view.frame)-40, 30);
    button.backgroundColor = [UIColor lightGrayColor];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitle:@"Dismiss" forState:0];
    [button setTitleColor:[UIColor blackColor] forState:0];
    [button addTarget:self action:@selector(click_button1) forControlEvents:1<<6];
    [self.view addSubview:button];
    }
}

#pragma mark -------------------------------------事件-------------------------------------------

- (void)click_button
{
    NSMutableDictionary *mdic = @{}.mutableCopy;
    [mdic setValue:@"JHPP Push 6" forKey:@"title"];
    
    [JHPP pushVC:@"JHPPVC1" paramter:mdic from:nil];
}

- (void)click_button1
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -------------------------------------懒加载-----------------------------------------


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
