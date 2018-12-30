//
//  BYSelectNumView.h
//  SnbcTableLib
//
//  Created by majunkai on 2018/12/12.
//  Copyright © 2018年 SNBC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BYCounterView.h"

NS_ASSUME_NONNULL_BEGIN

/**
 行数、列数计数器控件的协议
 */
@protocol BYTableNumViewDelegate <NSObject>


/**
 行数、列数计数器控件协议方法

 @param view 计数器控件对象
 @param number 计数数值
 */
- (void)didBYTableNumView:(UIView *)view updateWithNumber:(NSInteger)number;

@end

/**
 行数、列数计数器控件
 */
@interface BYTableNumView : UIView<BYCounterViewDelegate>

///行数、列数计数器标题文字
@property (nonatomic, copy) NSString *title;
///行数、列数计数器标题控件
@property (nonatomic, strong) UILabel *titleL;
///行数、列数计数器控件
@property (nonatomic, strong) BYCounterView *counterView;
///行数、列数计数器代理
@property (nonatomic, weak) id<BYTableNumViewDelegate> delegate;

/**
 初始化方法

 @param title 标题
 @return 行、列计数器控件对象
 */
- (instancetype)initWithTitle:(NSString *)title;
/**
 设置图标
 
 @param minusImage 减号背景图
 @param plusImage 加号背景图
 */
-(void)setMinusImage:(NSString *)minusImage andPlusImage:(NSString *)plusImage;

@end

NS_ASSUME_NONNULL_END
