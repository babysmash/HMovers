//
//  UIBarButtonItem+Hm.h
//  HMovers
//
//  Created by 66 on 2021/6/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem(Hm)
+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)rightItemWithIcon:(NSString *)icon target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)rightItemWithTitle:(NSString *)rightTitle target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)rightItemWithTitle:(NSString *)rightTitle andTitleColor:(UIColor *)col target:(id)target action:(SEL)action;

@end

NS_ASSUME_NONNULL_END
