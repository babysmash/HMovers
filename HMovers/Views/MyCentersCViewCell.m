//
//  MyCenterCViewCell.m
//  HMovers
//
//  Created by 66 on 2021/6/1.
//

#import "MyCentersCViewCell.h"
@implementation MyCentersCViewCell
-(instancetype)initWithFrame:(CGRect)frame {
    self =[super initWithFrame:frame];
    if (self) {
    }
    return self;
}
-(void)setBgView:(UIView *)backgroundView{
    _backGView = backgroundView;
    backgroundView.layer.borderWidth = 0.5f;
    if (@available(iOS 13.0, *)) {
        backgroundView.layer.borderColor = [UIColor systemGroupedBackgroundColor].CGColor;
    } else {
        // Fallback on earlier versions
    }
    backgroundView.layer.cornerRadius = 6.f;
    backgroundView.layer.masksToBounds = YES;
}
-(void)setFatherView:(UIView *)fathersView{
    _fathersView = fathersView;
    fathersView.layer.borderWidth = 0.5f;
    if (@available(iOS 13.0, *)) {
        fathersView.layer.borderColor = [UIColor systemGroupedBackgroundColor].CGColor;
    } else {
        // Fallback on earlier versions
    }
    fathersView.layer.cornerRadius = 6.f;
    fathersView.layer.masksToBounds = YES;
}
- (void)awakeFromNib {
    [super awakeFromNib];
}
@end
