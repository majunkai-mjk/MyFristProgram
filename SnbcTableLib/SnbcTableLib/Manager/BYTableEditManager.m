//
//  BYBYTableEditManager.m
//  SnbcTableLib
//
//  Created by majunkai on 2018/12/12.
//  Copyright © 2018年 SNBC. All rights reserved.
//

#import "BYTableEditManager.h"

@implementation BYTableEditManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+(BYTableEditManager *)manager{
    static dispatch_once_t onceToken;
    static BYTableEditManager *manager = nil;
    dispatch_once(&onceToken, ^{
        manager = [[BYTableEditManager alloc] init];
    });
    return manager;
}

#pragma mark -- 类方法和对象方法的实现
+(BYTableEditManager *)defaultManager{
    BYTableEditManager *manager = [self manager];
    manager.config = [BYTableConfig defaultConfig];
    manager.config.baseView.delegate = manager;
    return manager;
}

+(BYTableEditManager *)managerWithConfing:(BYTableConfig *)config{
    BYTableEditManager *manager = [self manager];
    manager.config = config;
    manager.config.baseView.delegate = manager;
    return manager;
}

-(void)showInView:(UIView *)view{
    [view addSubview:self.config.baseView];
    UIView *tableBaseView = self.config.baseView;
    CGRect frame = tableBaseView.frame;
    CGFloat Y = [UIScreen mainScreen].bounds.size.height;
    tableBaseView.frame = CGRectMake(0, Y, frame.size.width, frame.size.height);
    [UIView animateWithDuration:0.5 animations:^{
        tableBaseView.frame = frame;
    } completion:^(BOOL finished) {
        
    }];
}

-(void)dismissView{
    [UIView animateWithDuration:0.5 animations:^{
        [self.config.baseView removeFromSuperview];
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark -- manager实现BYTableBaseViewDelegate代理方法
-(void)tableBaseViewCreateTableWithModel:(BYTableDataModel *)model{
    if (self.delegate && [self.delegate respondsToSelector:@selector(managerCreateTableWithModel:)]) {
        [self.delegate managerCreateTableWithModel:model];
    }
}
-(void)updateTableWithModel:(BYTableDataModel *)model{
    if (self.delegate && [self.delegate respondsToSelector:@selector(managerUpdateTableWithModel:)]) {
        [self.delegate managerUpdateTableWithModel:model];
    }
}
@end
