//
//  HmMainViewController.m
//  HMovers
//
//  Created by 66 on 2021/6/1.
//

#import "HmMainViewController.h"
#import "MyCentersCViewCell.h"
#import "MyCenterCollectionReusableView.h"
#import "HmClassViewController.h"
#import "HmGoodDetailsViewController.h"
@interface HmMainViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,SDCycleScrollViewDelegate>
@property (nonatomic,strong) UICollectionView * collectionView;
@property (nonatomic,strong) NSDictionary * dataDic;
@property (nonatomic,strong) NSArray  * dataArray;
@end
@implementation HmMainViewController
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}
-(void)viewDidDisappear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = @[ @{@"image":@"o_i_1",@"number":@"0"}, @{@"image":@"re_i_3",@"number":@"0"}, @{@"image":@"o_i_3",@"number":@"0"}, @{@"image":@"w_i_2",@"number":@"0"}, @{@"image":@"re_i_4",@"number":@"0"}, @{@"image":@"o_i_5",@"number":@"0"}];
    self.view.backgroundColor =[UIColor whiteColor];
    [self creatCollectionView];
}
-(void)creatCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,-SH_StatusBarHeight, WIDTH, HEIGHT-SH_TabBarHeight+SH_StatusBarHeight) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
    _collectionView.showsVerticalScrollIndicator = NO;
    [_collectionView registerNib:[UINib nibWithNibName:@"MyCentersCViewCell" bundle:nil] forCellWithReuseIdentifier:@"MyCentersCViewCell"];
    [_collectionView registerClass:[MyCenterCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MyCenterCollectionReusableView"];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary * dic = _dataArray[indexPath.row];
    MyCentersCViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCentersCViewCell" forIndexPath:indexPath];
    cell.clipsToBounds = NO;
    cell.goodImage.image = [UIImage imageNamed:dic[@"image"]];
    cell.numbers.text = dic[@"number"];
    cell.submitBtn.tag = indexPath.row+100;
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary * dic = _dataArray[indexPath.row];
    HmGoodDetailsViewController * test = [[HmGoodDetailsViewController alloc]init];
    test.hidesBottomBarWhenPushed = YES;
    test.imageStr = dic[@"image"];
    [self.navigationController pushViewController:test animated:YES];
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize size=CGSizeMake((WIDTH-30)/2, (WIDTH-30)/2);
    return size;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 10, 0, 10);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0.01;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(0,600);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(0, 0);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        MyCenterCollectionReusableView * heardView = [_collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"MyCenterCollectionReusableView" forIndexPath:indexPath];
        heardView.backgroundColor =[UIColor whiteColor];
        for (UIView * view in heardView.subviews) {
            [view removeFromSuperview];
        }
        NSArray * array = @[@"banner",@"m_banner"];
        SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0,0, WIDTH, 200) delegate:self placeholderImage:[UIImage imageNamed:@"banner"]];
        cycleScrollView.backgroundColor =Color(255, 254, 248);
        cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        cycleScrollView.currentPageDotColor = [UIColor whiteColor];
        [heardView addSubview:cycleScrollView];
        cycleScrollView.type = @"normal";
        cycleScrollView.localizationImageNamesGroup = array;
        cycleScrollView.clickItemOperationBlock = ^(NSInteger index) {
        };
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 215, WIDTH, 20)];
        label.text = @"Classifications";
        label.font = [UIFont systemFontOfSize:18];
        label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentCenter;
        [heardView addSubview:label];
        float brand = (WIDTH - 300)/3;
        NSArray * brandArray = @[@"Residential",@"Office",@"Warehouse",@"Single large item"];
        for (int i = 0; i<4; i++) {
            UIButton * btn  = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(brand+ brand*(i%2)+150*(i%2), 250 + 100*(i/2)+ 20
                                   * (i/2), 150, 100);
            btn.backgroundColor = [UIColor whiteColor];
            btn.tag = 100+i;
            [btn setBackgroundImage:[UIImage imageNamed:brandArray[i]] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(brandClick:) forControlEvents:UIControlEventTouchUpInside];
            [heardView addSubview:btn];
        }
        UILabel * productlabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 490, WIDTH, 20)];
        productlabel.text = @"Recommended";
        productlabel.font = [UIFont systemFontOfSize:18];
        productlabel.textColor = [UIColor blackColor];
        productlabel.textAlignment = NSTextAlignmentCenter;
        [heardView addSubview:productlabel];
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake((WIDTH -200)/2, 530, 200, 50);
        [btn setBackgroundImage:[UIImage imageNamed:@"qu_1"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(sureBtn:) forControlEvents:UIControlEventTouchUpInside];
        [heardView addSubview:btn];
        return heardView;
    }else{
        return nil;
    }
}
-(void)sureBtn:(UIButton *)btn{
}
-(void)brandClick:(UIButton *)btn{
     HmClassViewController * class = [[HmClassViewController alloc]init];
    if (btn.tag==100) {
        class.dataArray = @[@"re_i_1",@"re_i_2",@"re_i_3",@"re_i_4",@"re_i_5",@"re_i_6",@"re_i_7",@"re_i_8"];
    }else if (btn.tag==101){
        class.dataArray = @[@"o_i_1",@"o_i_2",@"o_i_3",@"o_i_4",@"o_i_5",@"o_i_6",@"o_i_7"];
    }else if (btn.tag==102){
        class.dataArray = @[@"w_i_1",@"w_i_2",@"w_i_3"];
    }else{
        class.dataArray = @[@"si_i_1",@"si_i_2",@"si_i_3",@"si_i_4"];
    }
    class.hidesBottomBarWhenPushed  = YES;
    [self.navigationController pushViewController:class animated:YES];
}
@end

