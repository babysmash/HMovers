//
//  MBProgressHUD+Add.m
//  HMovers
//
//  Created by 66 on 2021/6/1.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD+Add.h"
@implementation MBProgressHUD (Add)
#pragma mark 显示信息
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = text;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    hud.mode = MBProgressHUDModeCustomView;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:0.7];
}
#pragma mark 显示错误信息
+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error icon:@"error.png" view:view];
}
+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self show:success icon:@"success.png" view:view];
}
#pragma mark 显示一些信息
+ (MBProgressHUD *)showMessag:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = message;
    hud.removeFromSuperViewOnHide = YES;
    hud.dimBackground = YES;
    return hud;
}
#pragma mark - 快速显示信息，带mode参数
+ (MBProgressHUD *)showMessag:(NSString *)message withDelay:(NSTimeInterval)showDelay toView:(UIView *)view withMode:(MBProgressHUDMode)mode hideWithDelay:(NSTimeInterval)hideDelay{
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [[MBProgressHUD alloc]initWithView:view];
    hud.isContinue = YES;
    [view addSubview:hud];
    hud.labelText = message;
    hud.removeFromSuperViewOnHide = YES;
    hud.mode = mode;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(showDelay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if(hud.isContinue) {
            [hud show:YES];
        }
    });
    if(hideDelay != 0) {
        [hud hide:YES afterDelay:hideDelay];
    }
    return hud;
}
@end
