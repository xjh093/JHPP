//
//  JHPP.m
//  JHKit
//
//  Created by HaoCold on 2019/2/20.
//  Copyright © 2019 HaoCold. All rights reserved.
//
//  MIT License
//
//  Copyright (c) 2019 xjh093
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import "JHPP.h"
#import "JHUIViewControllerDecoupler.h"

@implementation JHPP

#pragma mark --- public

+ (UIViewController *)currentViewController
{
    return [self fetchViewControllerFromRootViewController];
}

+ (void)pushVC:(UIViewController *)vc from:(id)responder
{
    [self pushVC:vc from:responder animated:YES];
}

+ (void)pushVC:(UIViewController *)vc from:(id)responder animated:(BOOL)animated
{
    UIViewController *topVC = [self fetchViewController:responder];
    [topVC.navigationController pushViewController:vc animated:animated];
}

+ (void)pushVC:(NSString *)vcString paramter:(NSDictionary *)dic from:(id)responder
{
    [self pushVC:vcString paramter:dic from:responder animated:YES];
}

+ (void)pushVC:(NSString *)vcString paramter:(NSDictionary *)dic from:(id)responder animated:(BOOL)animated
{
    UIViewController *topVC = [self fetchViewController:responder];
    UIViewController *vc = [JHUIViewControllerDecoupler jh_controllerFromString:vcString paramter:dic];
    if (vc) {
        [topVC.navigationController pushViewController:vc animated:animated];
    }
}

+ (void)presentVC:(UIViewController *)vc from:(id)responder
{
    [self presentVC:vc from:responder animated:YES];
}

+ (void)presentVC:(UIViewController *)vc from:(id)responder animated:(BOOL)animated
{
    UIViewController *topVC = [self fetchViewController:responder];
    [topVC presentViewController:vc animated:animated completion:nil];
}

+ (void)presentVC:(UIViewController *)vc from:(id)responder navigation:(BOOL)navigation
{
    [self presentVC:vc from:responder navigation:navigation animated:YES];
}

+ (void)presentVC:(UIViewController *)vc from:(id)responder navigation:(BOOL)navigation animated:(BOOL)animated
{
    UIViewController *topVC = [self fetchViewController:responder];
    if (navigation) {
        vc = [[[topVC.navigationController class] alloc] initWithRootViewController:vc];
    }
    [topVC presentViewController:vc animated:animated completion:nil];
}

+ (void)presentVC:(NSString *)vcString paramter:(NSDictionary *)dic from:(id)responder
{
    [self presentVC:vcString paramter:dic from:responder animated:YES];
}

+ (void)presentVC:(NSString *)vcString paramter:(NSDictionary *)dic from:(id)responder animated:(BOOL)animated
{
    UIViewController *topVC = [self fetchViewController:responder];
    UIViewController *vc = [JHUIViewControllerDecoupler jh_controllerFromString:vcString paramter:dic];
    if (vc) {
        [topVC presentViewController:vc animated:animated completion:nil];
    }
}

+ (void)presentVC:(NSString *)vcString paramter:(NSDictionary *)dic from:(id)responder navigation:(BOOL)navigation
{
    [self presentVC:vcString paramter:dic from:responder navigation:navigation animated:YES];
}

+ (void)presentVC:(NSString *)vcString paramter:(NSDictionary *)dic from:(id)responder navigation:(BOOL)navigation animated:(BOOL)animated
{
    UIViewController *topVC = [self fetchViewController:responder];
    UIViewController *vc = [JHUIViewControllerDecoupler jh_controllerFromString:vcString paramter:dic];
    if (vc) {
        if (navigation) {
            vc = [[[topVC.navigationController class] alloc] initWithRootViewController:vc];
        }
        [topVC presentViewController:vc animated:animated completion:nil];
    }
}

#pragma mark --- private

+ (UIViewController *)fetchViewController:(id)responder
{
    UIViewController *vc;
    if ([responder isKindOfClass:[UIView class]]) {
        vc = [self fetchViewControllerFromView:responder];
    }else if ([responder isKindOfClass:[UIViewController class]]){
        vc = responder;
    }
    if (!vc) {
        vc = [self fetchViewControllerFromRootViewController];
    }
    return vc;
}

+ (UIViewController *)fetchViewControllerFromView:(UIView *)view
{
    UIResponder *responder = view.nextResponder;
    while (responder) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            break;
        }
        responder = responder.nextResponder;
    }
    return (UIViewController *)responder;
}

+ (UIViewController *)fetchViewControllerFromRootViewController
{
    UIViewController *vc = [UIApplication sharedApplication].delegate.window.rootViewController;
    while (vc) {
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = [(UITabBarController *)vc selectedViewController];
        }
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = [(UINavigationController *)vc visibleViewController];
        }
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        }else{
            break;
        }
    }
    return vc;
}
@end
