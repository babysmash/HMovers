//
//  BDImagePicker.h
//  HMovers
//
//  Created by 66 on 2021/6/1.
//

#import <Foundation/Foundation.h>
typedef void (^BDImagePickerFinishAction)(UIImage *image);
@interface BDImagePicker : NSObject
+ (void)showImagePickerFromViewController:(UIViewController *)viewController
                            allowsEditing:(BOOL)allowsEditing
                             finishAction:(BDImagePickerFinishAction)finishAction;

@end


