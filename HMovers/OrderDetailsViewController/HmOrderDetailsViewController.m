//
//  HmOrderDetailsViewController.m
//  HMovers
//
//  Created by 66 on 2021/6/1.
//

#import "HmOrderDetailsViewController.h"

@interface HmOrderDetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *goodImage;
@property (weak, nonatomic) IBOutlet UIImageView *TypeCars;
@property (weak, nonatomic) IBOutlet UILabel *fromYourAddress;
@property (weak, nonatomic) IBOutlet UILabel *toYourAddress;
@property (weak, nonatomic) IBOutlet UILabel *ContactNumber;
@property (nonatomic,strong) NSMutableArray * dataArray;
@end

@implementation HmOrderDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    TitleView(@"Details");
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"back" target:self action:@selector(back)];
    self.dataArray = @[].mutableCopy;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem rightItemWithTitle:@"Cancel" target:self action:@selector(sumbit)];
    self.goodImage.image = [UIImage imageNamed:self.dataDic[@"goodsType"]];
    self.fromYourAddress.text = [NSString stringWithFormat:@"%@",self.dataDic[@"frome"]];
    self.toYourAddress.text = [NSString stringWithFormat:@"%@",self.dataDic[@"to"]];
    self.ContactNumber.text = [NSString stringWithFormat:@"%@",self.dataDic[@"phone"]];
    if ([self.dataDic[@"type"] isEqualToString:@"one"]) {
        self.TypeCars.image = [UIImage imageNamed:@"tr_i_1"];
    }else if ([self.dataDic[@"type"] isEqualToString:@"two"]){
        self.TypeCars.image = [UIImage imageNamed:@"tr_i_2"];
    }else {
         self.TypeCars.image = [UIImage imageNamed:@"tr_i_3"];
    }
}
-(void)sumbit{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Book Cancel" message:@"Cancel this Booking？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * sure = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSArray * array = USER_DEFAULTGet(@"data");
        if ([array isKindOfClass:[NSArray class]]) {
            if (self.dataArray) {
                [self.dataArray removeAllObjects];
            }
            for (NSDictionary * dic in array) {
                [self.dataArray addObject:dic];
                if ( [self.dataDic isEqual:dic]) {
                    [self.dataArray removeObject:dic];
                }
            }
        }
        USER_DEFAULTSet(self.dataArray, @"data");
        SHuiMBhudTextTimeStr(@"Cancel success!");
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.navigationController popViewControllerAnimated:YES];
        });
    }];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alert addAction:sure];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
