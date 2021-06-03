//
//  HmOrderTableViewCell.m
//  HMovers
//
//  Created by 66 on 2021/6/1.
//

#import "HmOrderTableViewCell.h"

@implementation HmOrderTableViewCell
+(NSString *)reuseIdentifier{
    return @"HmOrderTableViewCell";
}

-(void)setCancelBtn:(UIButton *)cancelBtn{
    _cancelBtn = cancelBtn;
    cancelBtn.layer.cornerRadius = 5.f;
    cancelBtn.layer.masksToBounds = YES;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
