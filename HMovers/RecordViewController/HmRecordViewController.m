//
//  HmRecordViewController.m
//  HMovers
//
//  Created by 66 on 2021/6/1.
//

#import "HmRecordViewController.h"
#import "HmOrderTableViewCell.h"
#import "HmOrderDetailsViewController.h"
@interface HmRecordViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView * _tableView;
    NSString * typeStr;
}
@property (nonatomic,strong) NSMutableArray * dataArray;
@property (nonatomic,strong) UIView * bgview;
@end
@implementation HmRecordViewController
-(void)viewWillAppear:(BOOL)animated{
    self.dataArray = @[].mutableCopy;
    NSArray * array = USER_DEFAULTGet(@"data");
    if ([array isKindOfClass:[NSArray class]]) {
        if (self.dataArray) {
            [self.dataArray removeAllObjects];
        }
        for (NSDictionary * dic in array) {
            [self.dataArray addObject:dic];
        }
    }
    if (self.dataArray.count>0) {
        self.bgview.hidden = YES;
    }else {
        self.bgview.hidden = NO;;
    }
    [_tableView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    TitleView(@"Record");
    self.bgview = [[UIView alloc]initWithFrame:CGRectMake(30, 150, WIDTH -60, 300)];
    self.bgview .backgroundColor = [UIColor whiteColor];
    self.bgview.hidden = YES;
    UIImageView * image = [[UIImageView alloc]initWithFrame:CGRectMake((WIDTH -60 -200)/2, 0, 200, 175)];
    image.image = [UIImage imageNamed:@"not"];
    UIButton * addto = [UIButton buttonWithType:UIButtonTypeCustom];
    addto.frame = CGRectMake(0, 230, WIDTH-60, 40);
    addto.backgroundColor = [UIColor whiteColor];
    addto.layer.cornerRadius = 6.f;
    addto.layer.masksToBounds = YES;
    [addto setTitle:@"There is no order" forState:UIControlStateNormal];
    [addto setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    if (self.dataArray.count>0) {
        self.bgview.hidden = YES;
    }else {
        self.bgview.hidden = NO;;
    }
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatTableView];
    [self.bgview addSubview:addto];
    [self.bgview addSubview:image];
    [self.view addSubview:self.bgview];
}
-(void)creatTableView {
    _tableView  =[[UITableView alloc]initWithFrame:CGRectMake(0,0, WIDTH, HEIGHT-SH_TabBarHeight)
                                             style:UITableViewStyleGrouped];
    _tableView.dataSource=self;
    _tableView.delegate =self;
    _tableView.backgroundColor = [UIColor whiteColor];
    UIView * view =[[UIView alloc]init];
    _tableView.tableFooterView =view;
    [_tableView registerNib:[UINib nibWithNibName:@"HmOrderTableViewCell" bundle:nil] forCellReuseIdentifier:[HmOrderTableViewCell reuseIdentifier]];
    [self.view addSubview:_tableView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPat{
    return 130;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return  0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary * dic = self.dataArray[indexPath.row];
    HmOrderTableViewCell  * cell = [tableView dequeueReusableCellWithIdentifier:[HmOrderTableViewCell reuseIdentifier]];
    cell.goodImage.image = [UIImage imageNamed:dic[@"goodsType"]];
        cell.from.text = [NSString stringWithFormat:@"From:%@",dic[@"frome"]];
        cell.to.text = [NSString stringWithFormat:@"To :%@",dic[@"to"]];
        cell.contact.text = [NSString stringWithFormat:@"Contact :%@",dic[@"phone"]];
        cell.cancelBtn.tag = indexPath.row + 100;
      [cell.cancelBtn addTarget:self action:@selector(cancelBtn:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
-(void)cancelBtn:(UIButton *)btn{
     NSDictionary * dic = self.dataArray[btn.tag - 100];
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Book Cancel" message:@"Cancel this Booking？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * sure = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSArray * array = USER_DEFAULTGet(@"data");
        if ([array isKindOfClass:[NSArray class]]) {
            if (self.dataArray) {
                [self.dataArray removeAllObjects];
            }
            for (NSDictionary * dict in array) {
                [self.dataArray addObject:dict];
                if ( [dic isEqual:dict]) {
                    [self.dataArray removeObject:dict];
                }
            }
        }
        USER_DEFAULTSet(self.dataArray, @"data");
        SHuiMBhudTextTimeStr(@"Cancel success!");
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (self.dataArray.count>0) {
                self.bgview.hidden = YES;
            }else {
                self.bgview.hidden = NO;;
            }
            [self->_tableView reloadData];
        });
    }];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alert addAction:sure];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary * dic =  _dataArray[indexPath.row];
    HmOrderDetailsViewController * test = [[HmOrderDetailsViewController alloc]init];
    test.hidesBottomBarWhenPushed = YES;
    test.dataDic = dic;
    [self.navigationController pushViewController:test animated:YES];
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView * heardView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 0.01)];
    heardView.backgroundColor = [UIColor whiteColor];
    return heardView;
}
@end
