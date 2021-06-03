//
//  MyCentersCViewCell.h
//  HMovers
//
//  Created by 66 on 2021/6/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyCentersCViewCell : UICollectionViewCell
@property(weak, nonatomic)IBOutlet UIImageView *goodImage;

@property(weak, nonatomic)IBOutlet UILabel *numbers;

@property(weak, nonatomic)IBOutlet UIView *fathersView;

@property(weak, nonatomic)IBOutlet UIView *backGView;

@property(weak, nonatomic)IBOutlet UIButton * submitBtn;

@property(weak, nonatomic)IBOutlet UIButton * addButton;

@property(nonatomic, strong)NSDictionary * agentDict;


@end

NS_ASSUME_NONNULL_END
