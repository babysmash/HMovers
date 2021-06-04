//
//  HmAboutUsViewController.m
//  HMovers
//
//  Created by 66 on 2021/6/1.
//

#import "HmAboutUsViewController.h"

@interface HmAboutUsViewController ()

@end

@implementation HmAboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    TitleView(@"Feedback");
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"back" target:self action:@selector(back)];
    UILabel * details = [[UILabel alloc]initWithFrame:CGRectMake(15, SH_TopHeight+15, WIDTH - 30, 20)];
    details.font = [UIFont systemFontOfSize:16];
    details.text = @"H-Movers is a moving online booking platform. We are always ready to serve users in both Seattle and San Francisco. In our application, you only need to choose the goods, quantity, and time you carry. The rest only need to be handed over to us. .We promise that we will compensate you if there is any damage to the items during the handling process. We will provide you with free services. When the delivery is completed, we charge a fee. If you are not satisfied with our service, we will not charge the service fee.";
    details.textColor = [UIColor blackColor];
    details.numberOfLines = 0;
    [details sizeToFit];
    [self.view addSubview:details];
    
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
