//
//  BYTableLineSelectAlertView.m
//  SnbcTableLib
//
//  Created by majunkai on 2018/12/19.
//  Copyright © 2018年 SNBC. All rights reserved.
//

#import "BYTableLineSelectAlertView.h"
#import "BYCommon.h"

@interface BYTableLineSelectAlertView ()<UITableViewDelegate,UITableViewDataSource, UIGestureRecognizerDelegate>

///线条类型
@property (nonatomic, strong) UIView *alertView;
@property (nonatomic, strong) UIView *baseView;
@property (nonatomic, strong) UILabel *titleL;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UIButton *cancleBtn;
@property (nonatomic, strong) UIButton *sureBtn;
@property (nonatomic, assign) NSInteger index;

@end

@implementation BYTableLineSelectAlertView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapSpaceView:)];
        tap.delegate = self;
        [self addGestureRecognizer:tap];
        _title = @"选择线框样式";
        [self createSubviews];
    }
    return self;
}
///点击空白处移除view
-(void)tapSpaceView:(UITapGestureRecognizer *)tap{
    [self dismiss];
}

-(void)createSubviews{
    _alertView = [[UIView alloc] init];
    
    _baseView = [[UIView alloc] init];
    _baseView.backgroundColor = [UIColor whiteColor];
    _baseView.layer.cornerRadius = 5;
    _baseView.layer.masksToBounds = YES;
    
    _titleL = [[UILabel alloc] init];
    _titleL.backgroundColor = [UIColor whiteColor];
    _titleL.textColor = [UIColor blackColor];
    _titleL.textAlignment = NSTextAlignmentCenter;
    _titleL.text = _title;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[BYAlertCell class] forCellReuseIdentifier:@"alertCell"];
    
    [_baseView addSubview:_titleL];
    [_baseView addSubview:_tableView];
    
    _cancleBtn = [[UIButton alloc] init];
    _cancleBtn.backgroundColor = [UIColor whiteColor];
    _cancleBtn.layer.cornerRadius = 5;
    _cancleBtn.layer.masksToBounds = YES;
    [_cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
    [_cancleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_cancleBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    _sureBtn = [[UIButton alloc] init];
    _sureBtn.backgroundColor = [UIColor whiteColor];
    _sureBtn.layer.cornerRadius = 5;
    _sureBtn.layer.masksToBounds = YES;
    [_sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [_sureBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_sureBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [_alertView addSubview:_baseView];
    [_alertView addSubview:_cancleBtn];
    [_alertView addSubview:_sureBtn];
    
    [self addSubview:_alertView];
}

-(void)btnClicked:(UIButton *)btn{
    if (btn == _cancleBtn) {
        [self dismiss];
    }else {
        if (self.delegate && [self.delegate respondsToSelector:@selector(didAlertViewSelectFinish:)]) {
            [self.delegate didAlertViewSelectFinish:self.index];
        }
        [self dismiss];
    }
}

-(void)setTitle:(NSString *)title{
    _title = title;
    _titleL.text = title;
}

-(void)setLineView:(BYLineTypeSelectView *)lineView{
    _lineView = lineView;
    NSArray *lines = lineView.lines;
    for (int i=0; i<lines.count; i++) {
        UIImage *image = [BYCommon commonWithName:lines[i]];
        [self.dataArray addObject:image];
    }
}

-(void)show{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}

-(void)dismiss{
    [self removeFromSuperview];
}

#pragma mark - UITableViewDelegate/UITableViewDataSource代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BYAlertCell *cell = [tableView dequeueReusableCellWithIdentifier:@"alertCell"];
    cell.lineImageView.image = self.dataArray[indexPath.row];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.index = indexPath.row;
}
#pragma mark 解决手势冲突
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    } else {
        return YES;
    }
}

#pragma mark - 布局子view
-(void)layoutSubviews{
    
    CGFloat padding = 10;
    CGFloat screen_W = [UIScreen mainScreen].bounds.size.width;
    CGFloat screen_H = [UIScreen mainScreen].bounds.size.height;
    CGFloat btn_W = (screen_W - 3 * padding) / 2;
    CGFloat btn_H = 40;
    CGFloat alert_W = screen_W;
    CGFloat alert_H = alert_W * 2 / 3;
    CGFloat alert_Y = screen_H - alert_H - 44 + padding;
    self.frame = [UIScreen mainScreen].bounds;
    
    _alertView.frame = CGRectMake(0, alert_Y, alert_W, alert_H);
    
    _baseView.frame = CGRectMake(padding, 0, CGRectGetWidth(_alertView.frame) - 2 * padding, CGRectGetHeight(_alertView.frame) - 2 * padding - btn_H);
    _titleL.frame = CGRectMake(0, 0, CGRectGetWidth(_baseView.frame), 40);
    _tableView.frame = CGRectMake(0, CGRectGetMaxY(_titleL.frame), CGRectGetWidth(_baseView.frame), CGRectGetHeight(_baseView.frame) - CGRectGetHeight(_titleL.frame));
    _cancleBtn.frame = CGRectMake(padding, CGRectGetMaxY(_baseView.frame) + padding, btn_W, btn_H);
    _sureBtn.frame = CGRectMake(CGRectGetMaxX(_cancleBtn.frame) + padding, CGRectGetMinY(_cancleBtn.frame), btn_W, btn_H);
    
}
#pragma mark - 懒加载
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

@end

@implementation BYAlertCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubView];
    }
    return self;
}
#pragma mark 初始化视图
-(void)initSubView{
    CGFloat screen_W = [UIScreen mainScreen].bounds.size.width;
    _lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 18.5, screen_W - 60, 3)];
    _lineImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:_lineImageView];
}

@end
