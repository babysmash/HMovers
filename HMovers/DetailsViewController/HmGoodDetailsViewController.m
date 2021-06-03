//
//  HmGoodDetailsViewController.m
//  HMovers
//
//  Created by 66 on 2021/6/1.
//

#import "HmGoodDetailsViewController.h"

@interface HmGoodDetailsViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *goodsImage;
@property (weak, nonatomic) IBOutlet UIButton *oneBtn;
@property (weak, nonatomic) IBOutlet UIButton *twoBtn;
@property (weak, nonatomic) IBOutlet UIButton *threeBtn;
@property (weak, nonatomic) IBOutlet UITextField *fromYourAddress;
@property (weak, nonatomic) IBOutlet UITextField *toDropOff;
@property (weak, nonatomic) IBOutlet UITextField *ContactNum;
@property (nonatomic,strong) NSMutableArray * dataArray;
@property (nonatomic,copy) NSString * cartType;

@end

@implementation HmGoodDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.cartType = @"one";
    self.oneBtn.selected = YES;
    self.goodsImage.image = [UIImage imageNamed:self.imageStr];
    self.dataArray = @[].mutableCopy;
    NSArray * array = USER_DEFAULTGet(@"data");
    if ([array isKindOfClass:[NSArray class]]) {
        if (array.count>0) {
            for (NSDictionary * diuc in array) {
                [self.dataArray addObject:diuc];
            }
        }
    }
    self.view.backgroundColor = [UIColor whiteColor];
    TitleView(@"Booking");
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"back" target:self action:@selector(back)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem rightItemWithTitle:@"submit" target:self action:@selector(submit)];
    // Do any additional setup after loading the view from its nib.
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)submit{
    if (self.fromYourAddress.text.length==0) {
        SHuiMBhudTextTimeStr(@"Please enter place of departure");
        return;
    }
    if (self.toDropOff.text.length==0) {
        SHuiMBhudTextTimeStr(@"Please enter Dropping Area");
        return;
    }
    if (self.ContactNum.text.length==0) {
        SHuiMBhudTextTimeStr(@"Please enter phone number");
        return;
    }
    NSMutableDictionary * dic = [NSMutableDictionary new];
    [dic setObject:self.imageStr forKey:@"goodsType"];
    [dic setObject:self.ContactNum.text forKey:@"phone"];
    [dic setObject:self.fromYourAddress.text forKey:@"frome"];
    [dic setObject:self.toDropOff.text forKey:@"to"];
    [dic setObject:self.cartType  forKey:@"Btn"];
    [self.dataArray addObject:dic];
    USER_DEFAULTSet(self.dataArray, @"data");
    SHuiMBhudTextTimeStr(@"Booking success!");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.navigationController popViewControllerAnimated:YES];
    });
}

- (IBAction)oneClicks:(id)sender {
    self.cartType = @"one";
    self.oneBtn.selected = YES;
    self.twoBtn.selected = NO;
    self.threeBtn.selected = NO;
}
- (IBAction)twoClicks:(id)sender {
    self.cartType = @"two";
    self.oneBtn.selected = NO;
    self.twoBtn.selected = YES;
    self.threeBtn.selected = NO;
}
- (IBAction)threeClicks:(id)sender {
    self.cartType = @"three";
    self.oneBtn.selected = NO;
    self.twoBtn.selected = NO;
    self.threeBtn.selected = YES;
}


@end
