//
//  BYLineColorSelectView.m
//  SnbcTableLib
//
//  Created by majunkai on 2018/12/17.
//  Copyright © 2018年 SNBC. All rights reserved.
//

#import "BYLineColorSelectView.h"
#import "BYColorSelectButton.h"

@interface BYLineColorSelectView()

@property (nonatomic, strong) NSMutableArray *buttons;

@end

@implementation BYLineColorSelectView

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
        _colors = @[[UIColor blackColor], [UIColor grayColor], [UIColor whiteColor]];
        [self createSubviews];
    }
    return self;
}

-(instancetype)initWithColors:(NSArray *)colors{
    self = [super init];
    if (self) {
        self.colors = colors;
    }
    return self;
}

-(void)createSubviews{
    
    for (int i=0; i<self.colors.count; i++) {
        BYColorSelectButton *btn = [[BYColorSelectButton alloc] init];
        btn.button.backgroundColor = self.colors[i];
        if (i == 0) {
            btn.selected = YES;
        }
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBtn:)];
        [btn addGestureRecognizer:tap];
        [self addSubview:btn];
        [self.buttons addObject:btn];
    }
    
}

-(void)setColors:(NSArray *)colors{
    _colors = colors;
    for (int i=0; i<self.buttons.count; i++) {
        BYColorSelectButton *btn = self.buttons[i];
        btn.button.backgroundColor = colors[i];
    }
}

-(void)setLineColor:(BYTableLineColor)lineColor{
    for (BYColorSelectButton *subBtn in self.buttons) {
        if ([self.buttons objectAtIndex:lineColor] == subBtn) {
            subBtn.selected = YES;
        }else{
            subBtn.selected = NO;
        }
    }
}

-(void)tapBtn:(UITapGestureRecognizer *)tap{
    for (BYColorSelectButton *subBtn in self.buttons) {
        if (subBtn.gestureRecognizers.firstObject == tap) {
            subBtn.selected = YES;
            if (self.delegate && [self.delegate respondsToSelector:@selector(didBYLineColorSelected:)]) {
                [self.delegate didBYLineColorSelected:[self.buttons indexOfObject:subBtn]];
            }
        }else{
            subBtn.selected = NO;
        }
    }
}

#pragma mark - 布局子view
-(void)layoutSubviews{
    
    CGFloat H = CGRectGetHeight(self.frame);
    CGFloat btn_H = 15;
    CGFloat btn_W = btn_H;
    CGFloat btn_Y = (H - btn_H)/2;
    CGFloat padding = btn_Y;
    CGFloat space = (CGRectGetWidth(self.frame) - self.buttons.count * H) / (self.buttons.count - 1);
    
    for (int i=0; i<self.buttons.count; i++) {
        CGFloat btn_X = i * (H + space) + padding;
        BYColorSelectButton *btn = self.buttons[i];
        btn.frame = CGRectMake(btn_X, btn_Y, btn_W, btn_H);
    }
    
}

#pragma mark - 懒加载
-(NSMutableArray *)buttons{
    if (!_buttons) {
        _buttons = [[NSMutableArray alloc] init];
    }
    return _buttons;
}
@end
