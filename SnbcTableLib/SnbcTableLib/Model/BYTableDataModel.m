//
//  BYTableDataModel.m
//  SnbcTableLib
//
//  Created by majunkai on 2018/12/12.
//  Copyright © 2018年 SNBC. All rights reserved.
//

#import "BYTableDataModel.h"
#import <UIKit/UIKit.h>

@implementation BYTableDataModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _row = 3;
        _column = 4;
        _outLineType = BYTableLineTypeThick;
        _outLineColor = BYTableLineColorBlack;
        _inLineType = BYTableLineTypeThin;
        _inLineColor = BYTableLineColorBlack;
        _isHorizontal = YES;
    }
    return self;
}

- (NSString *)description{
    return [NSString stringWithFormat:@"创建一个%@表格：\n行数：%ld \n列数：%ld \n表格外框：样式：%ld 颜色：%ld \n表格内框：样式：%ld 颜色：%ld",_isHorizontal ? @"横向" : @"纵向",(long)_row,(long)_column,(long)_outLineType,(long)_outLineColor,(long)_inLineType,(long)_inLineColor];
}

@end
