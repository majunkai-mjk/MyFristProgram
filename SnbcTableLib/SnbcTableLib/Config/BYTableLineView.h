//
//  BYTableLineView.h
//  SnbcTableLib
//
//  Created by majunkai on 2018/12/12.
//  Copyright © 2018年 SNBC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BYLineTypeSelectView.h"
#import "BYLineColorSelectView.h"

NS_ASSUME_NONNULL_BEGIN

@protocol BYTableLineViewDelegate <NSObject>

- (void)tableLineView:(UIView *)view updateWithLineType:(BYTableLineType)lineType;
- (void)tableLineView:(UIView *)view updateWithLineColor:(BYTableLineColor)lineColor;

@end

@interface BYTableLineView : UIView<BYLineColorSelectViewDelegate, BYLineTypeSelectViewDelegate>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSArray *lines;
@property (nonatomic, strong) NSArray *colors;
@property (nonatomic, strong) UILabel *titleL;
@property (nonatomic, strong) BYLineTypeSelectView *lineTypeView;
@property (nonatomic, strong) BYLineColorSelectView *lineColorView;
@property (nonatomic, weak) id<BYTableLineViewDelegate> delegate;

/**
 通过标题初始化线框控件
 
 @param title 标题文本
 @return 线框控件（BYTableLineView对象）
 */
-(instancetype)initWithTitle:(NSString *)title;

/**
 初始化方法

 @param title 标题
 @param lines 线框图片数组
 @param colors 线框颜色背景
 @param frame 位置信息
 @return 线框控件（BYTableLineView对象）
 */
- (instancetype)initWithTitle:(NSString *)title lines:(NSArray *)lines colors:(NSArray *)colors andFrame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
