//
//  ViewController.m
//  SnbcDemo
//
//  Created by majunkai on 2018/12/30.
//  Copyright © 2018年 SNBC. All rights reserved.
//

#import "ViewController.h"
#import <SnbcTableLib/SnbcTableLib.h>

@interface ViewController ()<BYTableEditManagerDelegate>

@property (nonatomic, strong) BYTableEditManager *manager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _manager = [BYTableEditManager defaultManager];
    _manager.delegate = self;
    [_manager showInView:self.view];
}
- (void)managerCreateTableWithModel:(BYTableDataModel *)model{
    
}
- (void)managerUpdateTableWithModel:(BYTableDataModel *)model{
    
}

@end
