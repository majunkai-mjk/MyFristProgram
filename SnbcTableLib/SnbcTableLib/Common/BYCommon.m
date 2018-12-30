//
//  Common.m
//  SnbcTableLib
//
//  Created by majunkai on 2018/12/19.
//  Copyright © 2018年 SNBC. All rights reserved.
//

#import "BYCommon.h"

@implementation BYCommon

+(id)commonWithName:(NSString *)imageName{
    NSBundle *bundle = [NSBundle bundleForClass:self];
    NSString *bundlePath = [bundle pathForResource:@"SnbcTableBundle" ofType:@"bundle"];
    NSBundle *curBundle = [NSBundle bundleWithPath:bundlePath];
    UIImage *image = [UIImage imageWithContentsOfFile:[curBundle pathForResource:imageName ofType:@"png"]];
    return image;
}

@end
