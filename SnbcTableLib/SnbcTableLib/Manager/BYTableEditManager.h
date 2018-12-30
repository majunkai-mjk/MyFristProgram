//
//  BYBYTableEditManager.h
//  SnbcTableLib
//
//  Created by majunkai on 2018/12/12.
//  Copyright © 2018年 SNBC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BYTableConfig.h"
#import "BYTableDataModel.h"

NS_ASSUME_NONNULL_BEGIN

/**
 表格组件的管理类的协议，实现该协议，通过回调的表格数据来创建表格对象
 */
@protocol BYTableEditManagerDelegate <NSObject>


/**
 实现BYTableEditManagerDelegate协议方法，根据表格数据model创建表格对象

 @param model 表格信息model对象
 */
- (void)managerCreateTableWithModel:(BYTableDataModel *)model;

/**
 根据BYTableDataModel,更新表格
 
 @param model 表格数据信息
 */
- (void)managerUpdateTableWithModel:(BYTableDataModel *)model;

@end


/**
 表格组件的管理类，可以根据BYTableConfig配置类创建表格组件
 */
@interface BYTableEditManager : NSObject<BYTableBaseViewDelegate>

@property (nonatomic, strong) BYTableConfig *config;
@property (nonatomic, weak) id<BYTableEditManagerDelegate> delegate;

/**
 根据默认配置信息创建表格管理类
 
 @return manager管理对象
 */
+(BYTableEditManager *)defaultManager;

/**
 根据配置信息创建表格管理类
 
 @param config 配置对象，储存表格创建的配置信息
 @return manager管理对象
 */
+(BYTableEditManager *)managerWithConfing:(BYTableConfig *)config;

/**
 将表格组件展示到View上

 @param view 展示表格的view(一般为控制器的view)
 */
-(void)showInView:(UIView *)view;

/**
 将表格组件移除
 */
-(void)dismissView;

@end

NS_ASSUME_NONNULL_END
