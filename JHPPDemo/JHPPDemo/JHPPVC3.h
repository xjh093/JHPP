//
//  JHPPVC3.h
//  JHPPDemo
//
//  Created by HaoCold on 2019/2/27.
//  Copyright © 2019 HaoCold. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JHPPVC3 : UIViewController
@property (nonatomic,    copy) NSString *text;

@property (nonatomic,    copy) dispatch_block_t callback;
@end

NS_ASSUME_NONNULL_END
