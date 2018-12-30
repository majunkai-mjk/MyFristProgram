//
//  BYLineTypeSelectView.h
//  SnbcTableLib
//
//  Created by majunkai on 2018/12/17.
//  Copyright © 2018年 SNBC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, BYTableLineType) {
    BYTableLineTypeThick    = 0, //粗实线
    BYTableLineTypeThin     = 1, //细实线
    BYTableLineTypeVirtual  = 2, //虚线
    BYTableLineTypeDot      = 3  //点线
};

/**
 表格线条选择协议
 */
@protocol BYLineTypeSelectViewDelegate <NSObject>

-(void)didBYLineTypeSelected:(NSInteger)index;

@end

/**
 线框选择view
 */
@interface BYLineTypeSelectView : UIView
///线条类型
@property (nonatomic, assign) BYTableLineType lineType;
///线条数组
@property (nonatomic, strong) NSArray *lines;
///代理
@property (nonatomic, weak) id<BYLineTypeSelectViewDelegate> delegate;

/**
 初始化线框选择控件

 @param lines 线条数组
 @return 线框选择控件对象
 */
-(instancetype)initWithLines:(NSArray *)lines;

@end

NS_ASSUME_NONNULL_END
