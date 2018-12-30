//
//  BYTableConfig.m
//  SnbcTableLib
//
//  Created by majunkai on 2018/12/12.
//  Copyright © 2018年 SNBC. All rights reserved.
//

#import "BYTableConfig.h"

@implementation BYTableConfig

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.model = [[BYTableDataModel alloc] init];
        self.baseView = [[BYTableBaseView alloc] initWithModel:self.model];
    }
    return self;
}

+(BYTableConfig *)defaultConfig{
    BYTableConfig *config = [[BYTableConfig alloc] init];
    return config;
}
+(BYTableConfig *)configWithModel:(BYTableDataModel *)model andView:(BYTableBaseView *)view{
    BYTableConfig *config = [[BYTableConfig alloc] init];
    config.model = model;
    config.baseView = view;
    return config;
}
@end

