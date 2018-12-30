//
//  BYTableLineSelectAlertView.h
//  SnbcTableLib
//
//  Created by majunkai on 2018/12/19.
//  Copyright © 2018年 SNBC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BYLineTypeSelectView.h"

NS_ASSUME_NONNULL_BEGIN

@protocol BYTableLineSelectAlertViewDelegate <NSObject>

- (void)didAlertViewSelectFinish:(NSInteger)index;

@end

@interface BYTableLineSelectAlertView : UIView

@property (nonatomic, copy) NSString *title;
///线框view
@property (nonatomic, strong) BYLineTypeSelectView *lineView;
@property (nonatomic, strong) id<BYTableLineSelectAlertViewDelegate> delegate;

-(void)show;
-(void)dismiss;

@end

NS_ASSUME_NONNULL_END

@interface BYAlertCell : UITableViewCell

@property (nonatomic, strong) UIImageView *lineImageView;
@property (nonatomic, strong) UILabel *lineLabel;

@end
