//
//  BYLineColorSelectView.h
//  SnbcTableLib
//
//  Created by majunkai on 2018/12/17.
//  Copyright © 2018年 SNBC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, BYTableLineColor) {
    BYTableLineColorBlack    = 0, //黑色
    BYTableLineColorGray     = 1, //灰色
    BYTableLineColorWhite    = 2, //白色
};

/**
 表格线框颜色选择协议
 */
@protocol BYLineColorSelectViewDelegate <NSObject>

-(void)didBYLineColorSelected:(NSInteger)index;

@end

/**
 线框颜色选择控件
 */
@interface BYLineColorSelectView : UIView

@property (nonatomic, assign) BYTableLineColor lineColor;
///线框颜色数组
@property (nonatomic, strong) NSArray *colors;
///代理
@property (nonatomic, weak) id<BYLineColorSelectViewDelegate> delegate;

/**
 根据颜色数组，初始化颜色选择控件

 @param colors 颜色数组
 @return 颜色选择控件对象
 */
-(instancetype)initWithColors:(NSArray *)colors;

@end

NS_ASSUME_NONNULL_END
