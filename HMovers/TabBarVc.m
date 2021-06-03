//
//  TabBarVcViewController.m
//  HMovers
//
//  Created by 66 on 2021/6/1.
//

#import "TabBarVc.h"
#import "HmMainViewController.h"
#import "HmRecordViewController.h"
#import "HmMessageViewController.h"
#import "HmCenterViewController.h"
@interface TabBarVc ()<UITabBarControllerDelegate>

@end

@implementation TabBarVc
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self createViewControllers];
    // Do any additional setup after loading the view.
}

- (void)createViewControllers {
    HmMainViewController * serverVC = [[HmMainViewController alloc]init];
    [self addChildViewController:serverVC title:@""imageName:@"h_i_5" selectedImageName:@"shafa"];
    HmRecordViewController * record = [[HmRecordViewController alloc]init];
    [self addChildViewController:record title:@""imageName:@"h_i_6" selectedImageName:@"h_i_2"];
    HmMessageViewController * bull = [[HmMessageViewController alloc]init];
    [self addChildViewController:bull title:@""imageName:@"h_i_7" selectedImageName:@"h_i_3"];
    HmCenterViewController   * myCenterVC = [[HmCenterViewController alloc]init];
    [self addChildViewController:myCenterVC title:@"" imageName:@"h_i_8" selectedImageName:@"h_i_4"];
}

- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    childController.title = title;
    childController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childController];
     [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"AN_I_1"] forBarMetrics:UIBarMetricsDefault];
    [self addChildViewController:nav];
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor whiteColor];
    view.frame = self.tabBar.bounds;
    [[UITabBar appearance] insertSubview:view atIndex:0];
    NSDictionary * detdic =@{NSForegroundColorAttributeName:[UIColor lightGrayColor]};
    [nav.tabBarItem setTitleTextAttributes:detdic forState:UIControlStateNormal];
    NSDictionary * seledic =@{NSForegroundColorAttributeName:RGBa(0x2fcca6)};
    [nav.tabBarItem setTitleTextAttributes:seledic forState:UIControlStateSelected];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
