//
//  MBProgressHUD+Add.h
//  HMovers
//
//  Created by 66 on 2021/6/1.
//

#import "MBProgressHUD.h"
@interface MBProgressHUD (Add)
+ (void)showError:(NSString *)error toView:(UIView *)view;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (MBProgressHUD *)showMessag:(NSString *)message toView:(UIView *)view;
+ (MBProgressHUD *)showMessag:(NSString *)message withDelay:(NSTimeInterval)showDelay toView:(UIView *)view withMode:(MBProgressHUDMode)mode hideWithDelay:(NSTimeInterval)hideDelay;
@end
