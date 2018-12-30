//
//  BYSelectNumView.m
//  SnbcTableLib
//
//  Created by majunkai on 2018/12/12.
//  Copyright © 2018年 SNBC. All rights reserved.
//

#import "BYTableNumView.h"

@implementation BYTableNumView

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
        _title = @"行数:";
        [self createSubviews];
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    if (self) {
        self.title = title;
    }
    return self;
}

-(void)setMinusImage:(NSString *)minusImage andPlusImage:(NSString *)plusImage{
    [_counterView setMinusImage:minusImage andPlusImage:plusImage];
}

-(void)setTitle:(NSString *)title{
    _title = title;
    _titleL.text = title;
}

#pragma mark - 创建子控件
- (void)createSubviews{
    
    _titleL = [[UILabel alloc] init];
    _titleL.text = _title;
    
    _counterView = [[BYCounterView alloc] init];
    _counterView.delegate = self;
    
    [self addSubview:_titleL];
    [self addSubview:_counterView];
    
}

#pragma mark - 布局子view
-(void)layoutSubviews{
    
    CGFloat padding = 10;
    CGFloat title_W = CGRectGetWidth(self.frame) * 2 / 5;
    CGFloat title_H = CGRectGetHeight(self.frame);
    CGFloat counter_X = title_W + padding;
    CGFloat counter_W = CGRectGetWidth(self.frame) - title_W - padding;
    CGFloat counter_H = title_H;
    
    _titleL.frame = CGRectMake(0, 0, title_W, title_H);
    _counterView.frame = CGRectMake(counter_X, 0, counter_W, counter_H);
    
    [self changeWordSpaceForLabel:_titleL WithSpace:34];
    
}


/**
 设置字间距

 @param label label对象
 @param space 间距
 */
- (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space{
    
    NSString *subStr1 = [label.text substringToIndex:1];
    NSString *subStr2 = [label.text substringFromIndex:1];
    NSMutableAttributedString *attributedStr1 = [[NSMutableAttributedString alloc] initWithString:subStr1 attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedStr1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, subStr1.length)];
    NSMutableAttributedString *attributedStr2 = [[NSMutableAttributedString alloc] initWithString:subStr2];
    [attributedStr1 appendAttributedString:attributedStr2];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    [attributedStr1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attributedStr1.length)];
    label.attributedText = attributedStr1;
    
}

#pragma mark - 实现计数器代理方法
-(void)didBYCounterViewClicked:(NSInteger)currentNum{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(didBYTableNumView:updateWithNumber:)]) {
        [self.delegate didBYTableNumView:self updateWithNumber:currentNum];
    }
    
}

@end
