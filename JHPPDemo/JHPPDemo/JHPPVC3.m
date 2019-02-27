//
//  JHPPVC3.m
//  JHPPDemo
//
//  Created by HaoCold on 2019/2/27.
//  Copyright © 2019 HaoCold. All rights reserved.
//

#import "JHPPVC3.h"
#import "JHPP.h"

@interface JHPPVC3 ()
@property (nonatomic,  strong) UILabel *label;
@property (nonatomic,  strong) UIButton *button;
@end

@implementation JHPPVC3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupViews];
}

#pragma mark -------------------------------------视图-------------------------------------------

- (void)setupViews
{
    [self.view addSubview:self.label];
    [self.view addSubview:self.button];
    
    if ([self.title isEqualToString:@"JHPP Push 6"]) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(20, CGRectGetMaxY(self.button.frame) + 20, CGRectGetWidth(self.label.frame), CGRectGetHeight(self.label.frame));
        button.backgroundColor = [UIColor lightGrayColor];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [button setTitle:@"Present" forState:0];
        [button setTitleColor:[UIColor blackColor] forState:0];
        [button addTarget:self action:@selector(click_button) forControlEvents:1<<6];
        [self.view addSubview:button];
    }
}

#pragma mark -------------------------------------事件-------------------------------------------

- (void)xx_click_button
{
    if (_callback) {
        _callback();
    }
}

- (void)click_button
{
    [JHPP presentVC:@"JHPPVC4" paramter:nil from:self];
}

#pragma mark -------------------------------------懒加载-----------------------------------------

- (UILabel *)label{
    if (!_label) {
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(20, 100, CGRectGetWidth(self.view.frame)-40, 30);
        label.text = _text;
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:14];
        label.textAlignment = 1;
        label.backgroundColor = [UIColor lightGrayColor];
        _label = label;
    }
    return _label;
}

- (UIButton *)button{
    if (!_button) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(20, CGRectGetMaxY(self.label.frame) + 20, CGRectGetWidth(self.label.frame), CGRectGetHeight(self.label.frame));
        button.backgroundColor = [UIColor lightGrayColor];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [button setTitle:@"改变按钮标题颜色" forState:0];
        [button setTitleColor:[UIColor blackColor] forState:0];
        [button setImage:nil forState:0];
        [button addTarget:self action:@selector(xx_click_button) forControlEvents:1<<6];
        _button = button;
    }
    return _button;
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
