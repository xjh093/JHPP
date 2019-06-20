//
//  JHPP.h
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

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

/// A tool for  Push & Present ViewController
@interface JHPP : NSObject


/**
 Fetch current ViewController at the top.
 */
+ (UIViewController *)currentViewController;

/**
 Push a viewController.
 
 @param vc a viewController.
 @param responder a view or viewController.
 */
+ (void)pushVC:(UIViewController *)vc from:(id)responder;
+ (void)pushVC:(UIViewController *)vc from:(id)responder animated:(BOOL)animated;

/**
 Push a viewController.
 
 @param vcString name of viewController.
 @param dic viewController's property.
 @param responder a view or viewController.
 */
+ (void)pushVC:(NSString *)vcString paramter:(NSDictionary *)dic from:(id)responder;
+ (void)pushVC:(NSString *)vcString paramter:(NSDictionary *)dic from:(id)responder animated:(BOOL)animated;

/**
 Present a viewController.
 
 @param vc a viewController.
 @param responder a view or viewController.
 */
+ (void)presentVC:(UIViewController *)vc from:(id)responder;
+ (void)presentVC:(UIViewController *)vc from:(id)responder animated:(BOOL)animated;
+ (void)presentVC:(UIViewController *)vc from:(id)responder navigation:(BOOL)navigation;
+ (void)presentVC:(UIViewController *)vc from:(id)responder navigation:(BOOL)navigation animated:(BOOL)animated;

/**
 Present a viewController.
 
 @param vcString name of viewController.
 @param dic viewController's property.
 @param responder a view or viewController.
 */
+ (void)presentVC:(NSString *)vcString paramter:(NSDictionary *)dic from:(id)responder;
+ (void)presentVC:(NSString *)vcString paramter:(NSDictionary *)dic from:(id)responder animated:(BOOL)animated;
+ (void)presentVC:(NSString *)vcString paramter:(NSDictionary *)dic from:(id)responder navigation:(BOOL)navigation;
+ (void)presentVC:(NSString *)vcString paramter:(NSDictionary *)dic from:(id)responder navigation:(BOOL)navigation animated:(BOOL)animated;

@end
