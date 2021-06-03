//
//  HmFeedBackViewController.m
//  HMovers
//
//  Created by 66 on 2021/6/1.
//

#import "HmFeedBackViewController.h"
#import "SZTextView.h"
#import "MBProgressHUD.h"
#import "MBProgressHUD+Add.h"
@interface HmFeedBackViewController ()
@property (nonatomic,strong) SZTextView * sztTextView;
@end

@implementation HmFeedBackViewController
- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor whiteColor];
    TitleView(@"Feedback");
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"back" target:self action:@selector(back)];
    self.sztTextView =[[SZTextView alloc]initWithFrame:CGRectMake(10,SH_TopHeight+10, WIDTH-20, 150)];
    self.sztTextView.placeholder = @"Please enter content";
    self.sztTextView.font =[UIFont systemFontOfSize:15];
    self.sztTextView.layer.borderWidth = 0.5;
    self.sztTextView.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    [self.view addSubview:self.sztTextView];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, SH_TopHeight
                           +200, WIDTH -40, 50);
    [btn setTitle:@"Submit" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor blackColor]];
    btn.layer.cornerRadius = 6.f;
    btn.layer.masksToBounds = YES;
    [btn addTarget:self action:@selector(record) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)record{
    if (self.sztTextView.text.length<=0) {
        SHuiMBhudTextTimeStr(@"Please enter content");
        return;
    }else {
        SHuiMBhudTextTimeStr(@"Submit success, thank you!");
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.navigationController popViewControllerAnimated:YES];
        });
    }
}
@end
