//
//  BYSelectButtonView.h
//  SnbcTableLib
//
//  Created by majunkai on 2018/12/14.
//  Copyright © 2018年 SNBC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BYCounterViewDelegate <NSObject>

-(void)didBYCounterViewClicked:(NSInteger)currentNum;

@end

/**
 计数器控件
 */
@interface BYCounterView : UIView

///减号按钮
@property (nonatomic, strong) UIButton *minusButton;
///加号按钮
@property (nonatomic, strong) UIButton *plusButton;
///显示计数的Label
@property (nonatomic, strong) UILabel *countLabel;
///当前计数器的值
@property (nonatomic, assign) NSInteger currentNum;
///最小值
@property (nonatomic, assign) NSInteger min;
///最大值
@property (nonatomic, assign) NSInteger max;
///代理
@property (nonatomic, weak) id<BYCounterViewDelegate> delegate;


/**
 初始化数量计数器

 @param minusImage 减号背景图
 @param plusImage 加号背景图
 @param frame 控件位置大小
 @return 计数器控件对象
 */
-(instancetype)initWithImage:(NSString *)minusImage plusIcon:(NSString *)plusImage andFrame:(CGRect)frame;

/**
 设置图标

 @param icon 减号背景图
 @param icon1 加号背景图
 */
-(void)setMinusImage:(NSString *)icon andPlusImage:(NSString *)icon1;

@end

NS_ASSUME_NONNULL_END
