//
//  MBProgressHUD.h
//  HMovers
//
//  Created by 66 on 2021/6/1.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
NS_ASSUME_NONNULL_BEGIN

@protocol MBProgressHUDDelegate;
typedef enum {
    MBProgressHUDModeIndeterminate,
    MBProgressHUDModeDeterminate,
    MBProgressHUDModeDeterminateHorizontalBar,
    MBProgressHUDModeAnnularDeterminate,
    MBProgressHUDModeCustomView,
    MBProgressHUDModeText
} MBProgressHUDMode;
typedef enum {
    MBProgressHUDAnimationFade,
    MBProgressHUDAnimationZoom,
    MBProgressHUDAnimationZoomOut = MBProgressHUDAnimationZoom,
    MBProgressHUDAnimationZoomIn
} MBProgressHUDAnimation;
#ifndef MB_INSTANCETYPE
#if __has_feature(objc_instancetype)
#define MB_INSTANCETYPE instancetype
#else
#define MB_INSTANCETYPE id
#endif
#endif
#ifndef MB_STRONG
#if __has_feature(objc_arc)
#define MB_STRONG strong
#else
#define MB_STRONG retain
#endif
#endif
#ifndef MB_WEAK
#if __has_feature(objc_arc_weak)
#define MB_WEAK weak
#elif __has_feature(objc_arc)
#define MB_WEAK unsafe_unretained
#else
#define MB_WEAK assign
#endif
#endif
#if NS_BLOCKS_AVAILABLE
typedef void (^MBProgressHUDCompletionBlock)(void);
#endif
@interface MBProgressHUD : UIView
+ (MB_INSTANCETYPE)showHUDAddedTo:(UIView *)view animated:(BOOL)animated;
+ (BOOL)hideHUDForView:(UIView *)view animated:(BOOL)animated;
+ (NSUInteger)hideAllHUDsForView:(UIView *)view animated:(BOOL)animated;
+ (MB_INSTANCETYPE)HUDForView:(UIView *)view;
+ (NSArray *)allHUDsForView:(UIView *)view;
- (id)initWithWindow:(UIWindow *)window;
- (id)initWithView:(UIView *)view;
- (void)show:(BOOL)animated;
- (void)hide:(BOOL)animated;
- (void)hide:(BOOL)animated afterDelay:(NSTimeInterval)delay;
- (void)showWhileExecuting:(SEL)method onTarget:(id)target withObject:(id)object animated:(BOOL)animated;
#if NS_BLOCKS_AVAILABLE
- (void)showAnimated:(BOOL)animated whileExecutingBlock:(dispatch_block_t)block;
- (void)showAnimated:(BOOL)animated whileExecutingBlock:(dispatch_block_t)block completionBlock:(MBProgressHUDCompletionBlock)completion;
- (void)showAnimated:(BOOL)animated whileExecutingBlock:(dispatch_block_t)block onQueue:(dispatch_queue_t)queue;
- (void)showAnimated:(BOOL)animated whileExecutingBlock:(dispatch_block_t)block onQueue:(dispatch_queue_t)queue
     completionBlock:(MBProgressHUDCompletionBlock)completion;
@property (assign) BOOL isContinue;
@property (copy) MBProgressHUDCompletionBlock completionBlock;
#endif
@property (assign) MBProgressHUDMode mode;
@property (assign) MBProgressHUDAnimation animationType;
@property (MB_STRONG) UIView *customView;
@property (MB_WEAK) id<MBProgressHUDDelegate> delegate;
@property (copy) NSString *labelText;
@property (copy) NSString *detailsLabelText;
@property (assign) float opacity;
@property (MB_STRONG) UIColor *color;
@property (assign) float xOffset;
@property (assign) float yOffset;
@property (assign) float margin;
@property (assign) BOOL dimBackground;
@property (assign) float graceTime;
@property (assign) float minShowTime;
@property (assign) BOOL taskInProgress;
@property (assign) BOOL removeFromSuperViewOnHide;
@property (MB_STRONG) UIFont* labelFont;
@property (MB_STRONG) UIFont* detailsLabelFont;
@property (assign) float progress;
@property (assign) CGSize minSize;
@property (assign, getter = isSquare) BOOL square;
@end
@protocol MBProgressHUDDelegate <NSObject>
@optional
- (void)hudWasHidden:(MBProgressHUD *)hud;
@end
@interface MBRoundProgressView : UIView
@property (nonatomic, assign) float progress;
@property (nonatomic, MB_STRONG) UIColor *progressTintColor;
@property (nonatomic, MB_STRONG) UIColor *backgroundTintColor;
@property (nonatomic, assign, getter = isAnnular) BOOL annular;
@end
@interface MBBarProgressView : UIView
@property (nonatomic, assign) float progress;
@property (nonatomic, MB_STRONG) UIColor *lineColor;
@property (nonatomic, MB_STRONG) UIColor *progressRemainingColor;
@property (nonatomic, MB_STRONG) UIColor *progressColor;


@end

NS_ASSUME_NONNULL_END
