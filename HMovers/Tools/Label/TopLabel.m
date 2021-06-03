//
//  TopLabel.m
//  HMovers
//
//  Created by 66 on 2021/6/1.
//

#import <Foundation/Foundation.h>
#import "TopLabel.h"

@implementation TopLabel

+(UILabel *)withLabelWithLabelText:(NSString *)labelText{
    UILabel * titleLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    titleLabel.backgroundColor =[UIColor clearColor];
    titleLabel.text =labelText;
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment =NSTextAlignmentCenter;
    titleLabel.font =[UIFont systemFontOfSize:18.f];
    return titleLabel;
}
-(UILabel *)withLabelWithLabelText:(NSString *)labelText{
    UILabel * titleLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    titleLabel.backgroundColor =[UIColor clearColor];
    titleLabel.text =labelText;
    titleLabel.textColor =[UIColor blackColor];
    titleLabel.textAlignment =NSTextAlignmentCenter;
    titleLabel.font =[UIFont systemFontOfSize:18.f];
    return titleLabel;
}

@end
