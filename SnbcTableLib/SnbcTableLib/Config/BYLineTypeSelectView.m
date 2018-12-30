//
//  BYLineTypeSelectView.m
//  SnbcTableLib
//
//  Created by majunkai on 2018/12/17.
//  Copyright © 2018年 SNBC. All rights reserved.
//

#import "BYLineTypeSelectView.h"
#import "BYCommon.h"
#import "BYTableLineSelectAlertView.h"

@interface BYLineTypeSelectView()<BYTableLineSelectAlertViewDelegate>

@property (nonatomic, strong) UIView *baseView;
@property (nonatomic, strong) UIImageView *lineImageView;
@property (nonatomic, strong) UIImageView *selectImageView;
@property (nonatomic, strong) BYTableLineSelectAlertView *selectView;

@end

@implementation BYLineTypeSelectView

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
        _lines = @[@"thickLine", @"thinLine", @"virtualLine", @"dotLine"];
        [self createSubviews];
    }
    return self;
}

-(instancetype)initWithLines:(NSArray *)lines{
    self = [super init];
    if (self) {
        self.lines = lines;
    }
    return self;
}

-(void)createSubviews{
    
    _baseView = [[UIView alloc] init];
    _lineImageView = [[UIImageView alloc] init];
    _lineImageView.image = [BYCommon commonWithName:_lines[0]];
    _lineImageView.contentMode = UIViewContentModeScaleAspectFit;
    _selectImageView = [[UIImageView alloc] init];
    _selectImageView.image = [BYCommon commonWithName:@"downImg"];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView:)];
    [_baseView addGestureRecognizer:tap];
    
    [_baseView addSubview:_lineImageView];
    [_baseView addSubview:_selectImageView];
    
    _baseView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _baseView.layer.borderWidth = 1;
    _baseView.layer.cornerRadius = 5;
    
    [self addSubview:_baseView];
    
    _selectView = [[BYTableLineSelectAlertView alloc] init];
    _selectView.delegate = self;
    _selectView.lineView = self;
    
}

-(void)tapImageView:(UITapGestureRecognizer *)tap{
    [_selectView show];
}

-(void)setLines:(NSArray *)lines{
    _lines = lines;
}

-(void)setLineType:(BYTableLineType)lineType{
    _lineType = lineType;
    NSInteger index = (NSInteger)lineType;
    UIImage *image = [UIImage imageNamed:self.lines[index]];
    if (image != nil) {
        _lineImageView.image = image;
    }else {
        _lineImageView.image = [BYCommon commonWithName:self.lines[index]];
    }
}

#pragma mark - BYTableLineSelectAlertViewDelegate代理方法
-(void)didAlertViewSelectFinish:(NSInteger)index{
    UIImage *image = [UIImage imageNamed:self.lines[index]];
    if (image != nil) {
        _lineImageView.image = image;
    }else {
        _lineImageView.image = [BYCommon commonWithName:self.lines[index]];
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(didBYLineTypeSelected:)]) {
        [self.delegate didBYLineTypeSelected:index];
    }
}

#pragma mark - 布局子view
-(void)layoutSubviews{

    CGFloat H = CGRectGetHeight(self.frame);
    CGFloat base_W = CGRectGetWidth(self.frame);
    CGFloat base_H = 15;
    CGFloat base_Y = (H - base_H)/2;
    CGFloat line_H = 3;
    CGFloat line_Y = (base_H - line_H)/2;
    CGFloat select_H = 15;
    CGFloat select_Y = (base_H - select_H)/2;
    
    
    _baseView.frame = CGRectMake(0, base_Y, base_W, base_H);
    
    _lineImageView.frame = CGRectMake(0, line_Y, CGRectGetWidth(_baseView.frame) - base_H, line_H);
    _selectImageView.frame = CGRectMake(CGRectGetMaxX(_lineImageView.frame) + select_Y, select_Y, select_H, select_H);
    
}
@end
