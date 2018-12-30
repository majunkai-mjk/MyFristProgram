//
//  BYTableBaseView.h
//  SnbcTableLib
//
//  Created by majunkai on 2018/12/13.
//  Copyright © 2018年 SNBC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BYTableNumView.h"
#import "BYTableLineView.h"
#import "BYTableDataModel.h"

NS_ASSUME_NONNULL_BEGIN


/**
 表格组件的协议
 */
@protocol BYTableBaseViewDelegate <NSObject>

/**
 BYTableEditManager的代理方法,将穿件表格的数据传递个BYTableEditManager的代理对象
 
 @param model 创建表格的数据Model
 */
-(void)tableBaseViewCreateTableWithModel:(BYTableDataModel *)model;

/**
 根据表格数据信息更新表格

 @param model 表格数据信息model
 */
-(void)updateTableWithModel:(BYTableDataModel *)model;

@end


/**
 表格组件view对象
 */
@interface BYTableBaseView : UIView<BYTableNumViewDelegate,BYTableLineViewDelegate>

///表格组件,配置数据模型
@property (nonatomic, strong) BYTableDataModel *model;
///行组件view
@property (nonatomic,strong) BYTableNumView *rowView;
///列组件view
@property (nonatomic,strong) BYTableNumView *columnView;
///表格外框组件view
@property (nonatomic, strong) BYTableLineView *outLineView;
///表格内框组件view
@property (nonatomic, strong) BYTableLineView *inLineView;
///生成竖向表格控件的按钮
@property (nonatomic, strong) UIImageView *verticalBtn;
///生成横向表格控件的按钮
@property (nonatomic, strong) UIImageView *horizontalBtn;
///控件之间的间距
@property (nonatomic, assign) CGFloat space;
///BYTableBaseViewDelegate代理
@property (nonatomic, weak) id<BYTableBaseViewDelegate> delegate;


/**
 通过model和frame初始化控件的方法

 @param model 表格组件数据模型
 @return 表格组件view
 */
-(instancetype)initWithModel:(BYTableDataModel *)model;

/**
 设置生成横向和竖向表格的按钮背景图

 @param verticalImg 竖向按钮背景图
 @param horizontalImg 横向按钮背景图
 */
-(void)setVerticalImg:(NSString *)verticalImg horizontalImg:(NSString *)horizontalImg;

@end

NS_ASSUME_NONNULL_END
