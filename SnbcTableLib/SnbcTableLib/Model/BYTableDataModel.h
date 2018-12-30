//
//  BYTableDataModel.h
//  SnbcTableLib
//
//  Created by majunkai on 2018/12/12.
//  Copyright © 2018年 SNBC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BYLineColorSelectView.h"
#import "BYLineTypeSelectView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BYTableDataModel : NSObject

@property (nonatomic, assign) NSInteger row;
@property (nonatomic, assign) NSInteger column;
@property (nonatomic, assign) BYTableLineType outLineType;
@property (nonatomic, assign) BYTableLineColor outLineColor;
@property (nonatomic, assign) BYTableLineType inLineType;
@property (nonatomic, assign) BYTableLineColor inLineColor;
@property (nonatomic, assign) BOOL isHorizontal;

@end

NS_ASSUME_NONNULL_END
