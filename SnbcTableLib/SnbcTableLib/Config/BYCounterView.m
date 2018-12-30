//
//  BYSelectButtonView.m
//  SnbcTableLib
//
//  Created by majunkai on 2018/12/14.
//  Copyright © 2018年 SNBC. All rights reserved.
//

#import "BYCounterView.h"
#import "BYCommon.h"

@implementation BYCounterView

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
        _currentNum = 3;
        _min = 1;
        _max = 8;
        [self createSubviews];
    }
    return self;
}

-(instancetype)initWithImage:(NSString *)minusImage plusIcon:(NSString *)plusImage andFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setMinusImage:minusImage andPlusImage:plusImage];
    }
    return self;
}

-(void)setMinusImage:(NSString *)icon andPlusImage:(NSString *)icon1{
    [_minusButton setBackgroundImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [_plusButton setBackgroundImage:[UIImage imageNamed:icon1] forState:UIControlStateNormal];
}

#pragma mark - 设置计数器默认值
-(void)setCurrentNum:(NSInteger)currentNum{
    _currentNum = currentNum;
    _countLabel.text = [NSString stringWithFormat:@"%ld",(long)currentNum];
}

#pragma mark - 创建子view
-(void)createSubviews{
    
    _minusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_minusButton setBackgroundImage:[BYCommon commonWithName:@"form_icon_drop_nor"] forState:UIControlStateNormal];
    [_minusButton addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    _minusButton.tag = 100;
    
    _plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_plusButton setBackgroundImage:[BYCommon commonWithName:@"form_icon_litre_nor"] forState:UIControlStateNormal];
    [_plusButton addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    _plusButton.tag = 101;
    
    _countLabel = [[UILabel alloc] init];
    _countLabel.textAlignment = NSTextAlignmentCenter;
    _countLabel.textColor = [UIColor grayColor];
    _countLabel.text = [NSString stringWithFormat:@"%ld", (long)_currentNum];
    
    [self addSubview:_minusButton];
    [self addSubview:_plusButton];
    [self addSubview:_countLabel];
    
}

#pragma mark - 布局子view
-(void)layoutSubviews{
    
    CGFloat H = CGRectGetHeight(self.frame);
    CGFloat btn_H = 15;
    CGFloat padding = (CGRectGetHeight(self.frame) - btn_H)/2;
    CGFloat label_X = btn_H + padding;
    CGFloat label_W = CGRectGetWidth(self.frame) - 2 * label_X;
    CGFloat label_H = H;
    
    _minusButton.frame = CGRectMake(padding, padding, btn_H, btn_H);
    _plusButton.frame = CGRectMake(CGRectGetWidth(self.frame) - H + padding, padding, btn_H, btn_H);
    _countLabel.frame = CGRectMake(label_X, 0, label_W, label_H);
    
}

#pragma mark - 按钮点击事件
-(void)btnClicked:(UIButton *)btn{
    
    switch (btn.tag) {
        case 100:
            if (_currentNum > _min) {
                _currentNum--;
                if (_currentNum == _min) {
                    _minusButton.userInteractionEnabled = NO;
                    _minusButton.alpha = 0.5;
                }
                if (!_plusButton.isUserInteractionEnabled) {
                    _plusButton.userInteractionEnabled = YES;
                    _plusButton.alpha = 1;
                }
                _countLabel.text = [NSString stringWithFormat:@"%ld", (long)_currentNum];
            }
            break;
        case 101:
            if (_currentNum < _max) {
                _currentNum++;
                if (_currentNum == _max) {
                    _plusButton.userInteractionEnabled = NO;
                    _plusButton.alpha = 0.5;
                }
                if (!_minusButton.isUserInteractionEnabled) {
                    _minusButton.userInteractionEnabled = YES;
                    _minusButton.alpha = 1;
                }
                _countLabel.text = [NSString stringWithFormat:@"%ld", (long)_currentNum];
            }
            break;
        default:
            break;
    }
    //代理实现回调，将计数传递出去
    if (_delegate && [_delegate respondsToSelector:@selector(didBYCounterViewClicked:)]) {
        [_delegate didBYCounterViewClicked:_currentNum];
    }
}

@end
