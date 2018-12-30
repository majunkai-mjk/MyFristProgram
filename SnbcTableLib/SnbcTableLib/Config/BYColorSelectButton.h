//
//  BYColorButton.h
//  SnbcTableLib
//
//  Created by majunkai on 2018/12/13.
//  Copyright © 2018年 SNBC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 颜色按钮控件
 */
@interface BYColorSelectButton : UIView

///button
@property (nonatomic, strong) UIButton *button;
///状态
@property (nonatomic, assign) BOOL selected;

@end

NS_ASSUME_NONNULL_END
