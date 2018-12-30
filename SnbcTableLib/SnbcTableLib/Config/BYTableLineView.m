//
//  BYTableLineView.m
//  SnbcTableLib
//
//  Created by majunkai on 2018/12/12.
//  Copyright © 2018年 SNBC. All rights reserved.
//

#import "BYTableLineView.h"

@interface BYTableLineView()

@end

@implementation BYTableLineView

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
        _title = @"表格外框:";
        _lines = @[@"thickLine", @"thinLine", @"virtualLine", @"dotLine"];
        _colors = @[[UIColor blackColor], [UIColor grayColor], [UIColor whiteColor]];
        [self createSubViews];
    }
    return self;
}

-(instancetype)initWithTitle:(NSString *)title{
    self = [super init];
    if (self) {
        self.title = title;
    }
    return self;
}

-(instancetype)initWithTitle:(NSString *)title lines:(NSArray *)lines colors:(NSArray *)colors andFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.title = title;
        self.lines = lines;
        self.colors = colors;
    }
    return self;
}

- (void)createSubViews{
    
    _titleL = [[UILabel alloc] init];
    _titleL.textAlignment = NSTextAlignmentCenter;
    _titleL.text = [NSString stringWithFormat:@"%@",self.title];
    
    _lineTypeView = [[BYLineTypeSelectView alloc] initWithLines:self.lines];
    _lineTypeView.delegate = self;
    
    _lineColorView = [[BYLineColorSelectView alloc] initWithColors:self.colors];
    _lineColorView.delegate = self;
    
    [self addSubview:_titleL];
    [self addSubview:_lineTypeView];
    [self addSubview:_lineColorView];
    
}

-(void)setTitle:(NSString *)title{
    _title = title;
    _titleL.text = title;
}

#pragma mark - BYLineTypeSelectViewDelegate代理方法
-(void)didBYLineTypeSelected:(NSInteger)index{
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableLineView:updateWithLineType:)]) {
        [self.delegate tableLineView:self updateWithLineType:index];
    }
}

#pragma mark - BYLineColorSelectViewDelegate代理方法
-(void)didBYLineColorSelected:(NSInteger)index{
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableLineView:updateWithLineColor:)]) {
        [self.delegate tableLineView:self updateWithLineColor:index];
    }
}

#pragma mark - 布局子控件
-(void)layoutSubviews{
    
    CGFloat padding = 10;
    CGFloat H = CGRectGetHeight(self.frame);
    CGFloat title_W = CGRectGetWidth(self.frame) * 4 / 15;
    CGFloat lineImage_X = title_W + padding;
    CGFloat lineImage_W = CGRectGetWidth(self.frame) / 2 - lineImage_X;
    CGFloat lineColor_X = CGRectGetWidth(self.frame) / 2 + padding;
    CGFloat lineColor_W = CGRectGetWidth(self.frame) / 2 - 3 * padding;
    
    _titleL.frame = CGRectMake(0, 0, title_W, H);
    _lineTypeView.frame = CGRectMake(lineImage_X, 0, lineImage_W, H);
    _lineColorView.frame = CGRectMake(lineColor_X, 0, lineColor_W, H);
    
}

@end
