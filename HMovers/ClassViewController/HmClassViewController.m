//
//  HmClassViewController.m
//  HMovers
//
//  Created by 66 on 2021/6/1.
//

#import "HmClassViewController.h"
#import "MyCentersCViewCell.h"
#import "MyCenterCollectionReusableView.h"
#import "HmGoodDetailsViewController.h"

@interface HmClassViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView * collectionView;
@end

@implementation HmClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TitleView(@"Classification");
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"back" target:self action:@selector(back)];
    self.view.backgroundColor =[UIColor groupTableViewBackgroundColor];
    [self creatCollectionView];
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)creatCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,0, WIDTH, HEIGHT) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
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
    MyCentersCViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCentersCViewCell" forIndexPath:indexPath];
    cell.clipsToBounds = NO;
    cell.goodImage.image = [UIImage imageNamed:self.dataArray[indexPath.row]];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
        NSString * image = _dataArray[indexPath.row];
    HmGoodDetailsViewController * test = [[HmGoodDetailsViewController alloc]init];
        test.hidesBottomBarWhenPushed = YES;
        test.imageStr = image;
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
    return CGSizeMake(0,10);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(0, 0);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        MyCenterCollectionReusableView * heardView = [_collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"MyCenterCollectionReusableView" forIndexPath:indexPath];
        heardView.backgroundColor =[UIColor groupTableViewBackgroundColor];
        for (UIView * view in heardView.subviews) {
            [view removeFromSuperview];
        }
        return heardView;
    }else{
        return nil;
    }
}
-(void)sureBtn:(UIButton *)btn{
}
-(void)brandClick:(UIButton *)btn{
}

@end
