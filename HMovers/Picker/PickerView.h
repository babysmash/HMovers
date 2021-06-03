//
//  PickerView.h
//  HMovers
//
//  Created by 66 on 2021/6/1.
//

#import <Foundation/Foundation.h>
#import "PickerModel.h"
#import "Masonry.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, PickerViewType) {
PickerViewTypeSex,
PickerViewTypeHeigh,
PickerViewTypeWeight,
PickerViewTypeBirthday,
PickerViewTypeTime,
PickerViewTypeRange,
PickerViewTypeCity,
};
@protocol PickerViewResultDelegate <NSObject>
@optional
- (void)pickerView:(UIView *)pickerView result:(NSString *)string;
@end
@interface PickerView : UIView<UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic,strong)UIPickerView *picker;
@property (nonatomic,strong)UIDatePicker *datePicke;
@property(nonatomic,assign)PickerViewType type;
@property(nonatomic,strong)NSMutableArray *array;
@property (nonatomic,assign)NSInteger selectComponent;
@property(nonatomic,weak)id<PickerViewResultDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
