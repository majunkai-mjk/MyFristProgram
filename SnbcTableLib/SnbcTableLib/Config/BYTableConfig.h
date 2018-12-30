//
//  BYTableConfig.h
//  SnbcTableLib
//
//  Created by majunkai on 2018/12/12.
//  Copyright © 2018年 SNBC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BYTableBaseView.h"
#import "BYTableDataModel.h"
NS_ASSUME_NONNULL_BEGIN

/**
 表格组件配置信息类
 */
@interface BYTableConfig : NSObject

///表格组件view
@property (nonatomic, strong) BYTableBaseView *baseView;
///表格组件配置数据model
@property (nonatomic, strong) BYTableDataModel *model;

/**
 默认初始化方法

 @return 默认配置信息对象
 */
+(BYTableConfig *)defaultConfig;

/**
 自定义初始化方法

 @param model 配置数据model
 @param view 表格组件view
 @return 自定义的配置信息对象
 */
+(BYTableConfig *)configWithModel:(BYTableDataModel *)model andView:(BYTableBaseView *)view;

@end

NS_ASSUME_NONNULL_END
