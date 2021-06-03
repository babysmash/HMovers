//
//  HmMessageViewController.m
//  HMovers
//
//  Created by 66 on 2021/6/1.
//

#import "HmMessageViewController.h"

@interface HmMessageViewController ()<UITableViewDelegate,UITableViewDataSource> {
    
    UITableView * _tableView;
}

@end

@implementation HmMessageViewController

- (void)viewDidLoad {
    TitleView(@"Message")
    [super viewDidLoad];
    [self creatTableView];
}
-(void)creatTableView {
    _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-SH_TopHeight) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor whiteColor];
    UIView * view =[[UIView alloc]init];
    _tableView.tableFooterView = view;
    [self.view addSubview:_tableView];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row==0||indexPath.row==1) {
        return 110;
    }else {
        return 180;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
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
    float height;
    if (indexPath.row==0||indexPath.row==1) {
        height =  110;
    }else {
        height =  180;
    }
    UIView * view =[[UIView alloc]initWithFrame:CGRectMake(0, 10, WIDTH, height-10)];
    view.backgroundColor =[UIColor whiteColor];
    [cell.contentView addSubview:view];
    UIImageView * imge = [[UIImageView alloc]initWithFrame:CGRectMake(5, 15, 30, 20)];
    imge.image = [UIImage imageNamed:(@"zy_1")];
    [view addSubview:imge];
    UILabel * detilsLabel =[[UILabel alloc]initWithFrame:CGRectMake(50, 15, WIDTH -60, 20)];
    detilsLabel.font = [UIFont systemFontOfSize:16];
    if (indexPath.row==0) {
        detilsLabel.text = @"H-Moving is a moving online booking platform. We are always ready to serve users in both Seattle and San Francisco.";
    }else if (indexPath.row==1){
        detilsLabel.text = @" Please strictly abide by national and local laws and resolutely resist illegal incidents and contraband.";
    }else {
        detilsLabel.text = @" We promise that we will compensate you if there is any damage to the items during the handling process. We will provide you with free services. When the delivery is completed, we charge a fee. If you are not satisfied with our service, we will not charge the service fee.";
    }
    detilsLabel.numberOfLines = 0;
    detilsLabel.textColor = [UIColor blackColor];
    [detilsLabel sizeToFit];
    [view addSubview:detilsLabel];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}

@end
