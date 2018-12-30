//
//  BYColorButton.m
//  SnbcTableLib
//
//  Created by majunkai on 2018/12/13.
//  Copyright © 2018年 SNBC. All rights reserved.
//

#import "BYColorSelectButton.h"

@implementation BYColorSelectButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubviews];
    }
    return self;
}

-(void)createSubviews{
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.userInteractionEnabled = NO;
    [self addSubview:_button];
}

-(void)layoutSubviews{
    
    CGFloat padding = 2;
    CGFloat btn_X = padding;
    CGFloat btn_Y = padding;
    CGFloat btn_H = CGRectGetHeight(self.frame) - 2 * padding;
    CGFloat btn_W = btn_H;
    
    _button.frame = CGRectMake(btn_X, btn_Y, btn_W, btn_H);
    _button.layer.cornerRadius = btn_H / 2;
    _button.layer.borderColor = [UIColor grayColor].CGColor;
    _button.layer.borderWidth = 1;
    
    if (self.selected) {
        self.layer.cornerRadius = CGRectGetHeight(self.frame) / 2;
        self.layer.borderColor = [UIColor redColor].CGColor;
        self.layer.borderWidth = 1;
        self.layer.masksToBounds = YES;
    }else {
        self.layer.cornerRadius = CGRectGetHeight(self.frame) / 2;
        self.layer.borderColor = [UIColor clearColor].CGColor;
        self.layer.borderWidth = 1;
        self.layer.masksToBounds = YES;
    }
}

-(void)setSelected:(BOOL)selected{
    _selected = selected;
    if (selected) {
        self.layer.cornerRadius = CGRectGetHeight(self.frame) / 2;
        self.layer.borderColor = [UIColor redColor].CGColor;
        self.layer.borderWidth = 1.0f;
    }else {
        self.layer.cornerRadius = CGRectGetHeight(self.frame) / 2;
        self.layer.borderColor = [UIColor clearColor].CGColor;
        self.layer.borderWidth = 1.0f;
    }
    
}

@end
