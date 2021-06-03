//
//  HmCenterViewController.m
//  HMovers
//
//  Created by 66 on 2021/6/1.
//

#import "HmCenterViewController.h"
#import "HmFeedBackViewController.h"
#import "HmAboutUsViewController.h"

@interface HmCenterViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView *_tableView;
}

@end

@implementation HmCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TitleView(@"Me")
    [self createTableView];
    // Do any additional setup after loading the view from its nib.
}



- (void)createTableView {
    _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-SH_TopHeight) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor whiteColor];
    UIView * view =[[UIView alloc]init];
    _tableView.tableFooterView = view;
    [self.view addSubview:_tableView];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * heardView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 200)];
    heardView.backgroundColor = [UIColor whiteColor];
    UIImageView * imge = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 200)];
    imge.image = [UIImage imageNamed:(@"m_banner")];
    [heardView addSubview:imge];
    UIImageView * userimge = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH/2-50, 465, 100, 100)];
    userimge.image = [UIImage imageNamed:(@"m_im_1")];
    [heardView addSubview:userimge];
    return heardView;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 200;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellId = @"cellId";
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:cellId ];
    if (cell==nil) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }else {
        while ([cell.contentView.subviews lastObject] != nil) {
            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    cell.contentView.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSArray * image = @[@"m_i_2",@"m_i_3",@"m_i_4",];
    UIView * view =[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 80)];
    view.backgroundColor =[UIColor whiteColor];
    [cell.contentView addSubview:view];
    UIImageView * imge = [[UIImageView alloc]initWithFrame:CGRectMake(10, 25, 30, 30)];
    imge.image = [UIImage imageNamed:image[indexPath.row]];
    [view addSubview:imge];
    UILabel * detilsLabel =[[UILabel alloc]initWithFrame:CGRectMake(50, 25, WIDTH -60, 30)];
    detilsLabel.font = [UIFont systemFontOfSize:16];
    if (indexPath.row==0) {
        detilsLabel.text = @"Feedback";
    }else if (indexPath.row==1){
        detilsLabel.text = @"About us";
    }else {
        detilsLabel.text = @"Share it";
    }
    detilsLabel.textColor = [UIColor blackColor];
    [view addSubview:detilsLabel];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        HmFeedBackViewController * about = [[HmFeedBackViewController alloc]init];
        about.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:about animated:YES];
    }else if (indexPath.row==1){
        HmAboutUsViewController * about = [[HmAboutUsViewController alloc]init];
        about.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:about animated:YES];
    }else {
        NSArray *images = @[@"logo"];
        UIActivityViewController *activityController=[[UIActivityViewController alloc]initWithActivityItems:images applicationActivities:nil];
        [self.navigationController presentViewController:activityController animated:YES completion:nil];
    }
}
@end
