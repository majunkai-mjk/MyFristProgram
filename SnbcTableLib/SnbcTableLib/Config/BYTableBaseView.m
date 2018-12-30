//
//  BYTableBaseView.m
//  SnbcTableLib
//
//  Created by majunkai on 2018/12/13.
//  Copyright © 2018年 SNBC. All rights reserved.
//

#import "BYTableBaseView.h"
#import "BYCommon.h"

@interface BYTableBaseView()

@property (nonatomic, strong) UIView *spaceLineView;
@property (nonatomic, strong) UIView *baseView;

@end

@implementation BYTableBaseView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat screen_H = [UIScreen mainScreen].bounds.size.height;
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = [UIScreen mainScreen].bounds.size.width/2;
        self.frame = CGRectMake(0, screen_H - height, width, height);
        self.space = 10;
        self.backgroundColor = [UIColor whiteColor];
        [self createSubViews];
    }
    return self;
}
-(instancetype)initWithModel:(BYTableDataModel *)model{
    self = [super init];
    if (self) {
        self.model = model;
    }
    return self;
}

-(void)setVerticalImg:(NSString *)verticalImg horizontalImg:(NSString *)horizontalImg{
    self.verticalBtn.image = [UIImage imageNamed:verticalImg];
    self.horizontalBtn.image = [UIImage imageNamed:horizontalImg];
}
-(void)setModel:(BYTableDataModel *)model{
    _model = model;
    self.rowView.counterView.currentNum = self.model.row;
    self.columnView.counterView.currentNum = self.model.column;
    self.outLineView.lineTypeView.lineType = self.model.outLineType;
    self.outLineView.lineColorView.lineColor = self.model.outLineColor;
    self.inLineView.lineTypeView.lineType = self.model.inLineType;
    self.inLineView.lineColorView.lineColor = self.model.inLineColor;
}
- (void)createSubViews{
    _spaceLineView = [[UIView alloc] init];
    _spaceLineView.backgroundColor = [UIColor grayColor];
    [self addSubview:_spaceLineView];
    
    _rowView = [[BYTableNumView alloc] initWithTitle:@"行数:"];
    _rowView.delegate = self;
    [self addSubview:_rowView];
    
    _columnView = [[BYTableNumView alloc] initWithTitle:@"列数:"];
    _columnView.delegate = self;
    [self addSubview:_columnView];
    
    _outLineView = [[BYTableLineView alloc] initWithTitle:@"表格外框:"];
    _outLineView.delegate = self;
    [self addSubview:_outLineView];
    
    _inLineView = [[BYTableLineView alloc] initWithTitle:@"表格内框:"];
    _inLineView.delegate = self;
    [self addSubview:_inLineView];
    
    _baseView = [[UIView alloc] init];
    _horizontalBtn = [[UIImageView alloc] init];
    _horizontalBtn.image = [BYCommon commonWithName:@"form_icon_cross"];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    _horizontalBtn.userInteractionEnabled = YES;
    [_horizontalBtn addGestureRecognizer:tap];
    [_baseView addSubview:_horizontalBtn];
    
    _verticalBtn = [[UIImageView alloc] init];
    _verticalBtn.image = [BYCommon commonWithName:@"form_icon_vertical"];
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    _verticalBtn.userInteractionEnabled = YES;
    [_verticalBtn addGestureRecognizer:tap1];
    [_baseView addSubview:_verticalBtn];
    
    [self addSubview:_baseView];

}

-(void)tapGesture:(UITapGestureRecognizer *)tap{
    if (tap == self.horizontalBtn.gestureRecognizers.firstObject) {
        self.model.isHorizontal = YES;
    }else{
        self.model.isHorizontal = NO;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableBaseViewCreateTableWithModel:)]) {
        [self.delegate tableBaseViewCreateTableWithModel:self.model];
    }
}

-(void)layoutSubviews{
    CGFloat padding = 10;
    CGFloat H = (CGRectGetHeight(self.frame) - 5 * _space) / 4;
    CGFloat tableNum_W = CGRectGetWidth(self.frame) * 2 / 3;
    CGFloat tableLine_W = CGRectGetWidth(self.frame);
    
    _spaceLineView.frame = CGRectMake(0, 0, tableLine_W, 0.5);
    _rowView.frame = CGRectMake(0, _space, tableNum_W, H);
    _columnView.frame = CGRectMake(0, CGRectGetMaxY(_rowView.frame) + _space, tableNum_W, H);
    _outLineView.frame = CGRectMake(0, CGRectGetMaxY(_columnView.frame) + _space, tableLine_W, H);
    _inLineView.frame = CGRectMake(0, CGRectGetMaxY(_outLineView.frame) + _space, tableLine_W, H);
    
    CGFloat base_X = CGRectGetMaxX(_rowView.frame) + padding;
    CGFloat base_Y = _space;
    CGFloat base_H = 2 * H + _space;
    CGFloat base_W = tableLine_W - tableNum_W - 2 * padding;
    _baseView.frame = CGRectMake(base_X, base_Y, base_W, base_H);
    CGFloat base_half_W = CGRectGetWidth(_baseView.frame) / 2;
    CGFloat sub_H = 30;
    CGFloat sub_W = sub_H;
    CGFloat padding1 = (base_half_W - sub_H)/2;//用于调节按钮大小
    _verticalBtn.frame = CGRectMake(padding1, padding1, sub_W, sub_H);
    _horizontalBtn.frame = CGRectMake(CGRectGetMaxX(_verticalBtn.frame) + padding1, padding1, sub_W, sub_H);
}

#pragma mark -- BYTableNumViewDelegate,BYTableLineViewDelegate代理方法的实现
-(void)didBYTableNumView:(UIView *)view updateWithNumber:(NSInteger)number{
    if (view == self.rowView) {
        self.model.row = number;
    }else {
        self.model.column = number;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(updateTableWithModel:)]) {
        [self.delegate updateTableWithModel:self.model];
    }
}

-(void)tableLineView:(UIView *)view updateWithLineType:(BYTableLineType)lineType{
    if (view == self.outLineView) {
        self.model.outLineType = lineType;
    }else {
        self.model.inLineType = lineType;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(updateTableWithModel:)]) {
        [self.delegate updateTableWithModel:self.model];
    }
}

-(void)tableLineView:(UIView *)view updateWithLineColor:(BYTableLineColor)lineColor{
    if (view == self.outLineView) {
        self.model.outLineColor = lineColor;
    }else {
        self.model.inLineColor = lineColor;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(updateTableWithModel:)]) {
        [self.delegate updateTableWithModel:self.model];
    }
}
@end
