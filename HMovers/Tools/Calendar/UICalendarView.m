//
//  UICalendarView.m
//  HMovers
//
//  Created by 66 on 2021/6/1.
//

#import "UICalendarView.h"


@interface UICalendarView()
@property (nonatomic, weak) UIButton *preBtn;
@property (nonatomic, weak) UIButton *nextBtn;
@property (nonatomic, weak) UILabel *titleLable;
@property (nonatomic, weak) UIView *titleView;
@property (nonatomic, weak) UIView *dateView;
@property (nonatomic, strong) NSMutableArray *dateArray;
@property (nonatomic, strong) NSMutableArray *labelArray;
@property (nonatomic, strong) NSMutableArray *buttonArray;
@property (nonatomic, assign) NSInteger days;
@property (nonatomic, assign) NSInteger firstDays;
@property (nonatomic, strong) NSDate *currentDate;
@end
@implementation UICalendarView
- (NSMutableArray *)buttonArray {
    if (!_buttonArray) {
        _buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
}
- (NSMutableArray *)labelArray {
    if (!_labelArray) {
        _labelArray = [NSMutableArray array];
    }
    return _labelArray;
}
- (NSMutableArray *)dateArray {
    if (!_dateArray) {
        _dateArray = [NSMutableArray arrayWithObjects:@"",@"",@"",@"",@"",@"",@"", nil];
    }
    return _dateArray;
}
- (NSInteger)getCurrentDay:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date];
    NSInteger day = [components day];
    return day;
}
- (NSInteger)getCurrentMonth:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date];
    NSInteger month = [components month];
    return month;
}
- (NSInteger)getCurrentYear:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date];
    NSInteger year = [components year];
    return year;
}
- (NSInteger)getTotalDaysInMonth:(NSDate *)date {
    NSRange daysInOfMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return daysInOfMonth.length;
}
- (NSInteger)getFirstDayOfMonth:(NSDate *)date {
    NSInteger firstDayOfMonth = [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitWeekOfMonth forDate:date];
    return firstDayOfMonth;
}
- (NSDate *)lastMonth:(NSDate *)date {
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = -1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}
- (NSDate *)nextMonth:(NSDate *)date {
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = +1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = Color(244, 244, 244);
        _currentDate = [NSDate date];
        UIButton *preBtn = [[UIButton alloc] init];
        [preBtn setTitle:@"<<" forState:UIControlStateNormal];
        [preBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [preBtn addTarget:self action:@selector(preBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:preBtn];
        self.preBtn = preBtn;
        UIButton *nextBtn = [[UIButton alloc] init];
        [nextBtn setTitle:@">>" forState:UIControlStateNormal];
        [nextBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [nextBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:nextBtn];
        self.nextBtn = nextBtn;
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.text = @"2010-10-20";
        titleLable.textAlignment = NSTextAlignmentCenter;
        titleLable.textColor = [UIColor blackColor];
        [self addSubview:titleLable];
        self.titleLable = titleLable;
        UIView *titleView = [[UIView alloc] init];
        titleView.backgroundColor = [UIColor clearColor];
        [self addSubview:titleView];
        self.titleView = titleView;
        for (int i = 0; i < self.dateArray.count; i++) {
            UILabel *label = [[UILabel alloc] init];
            label.text = self.dateArray[i];
            label.textColor = RGBa(0xFFCD36);
            label.textAlignment = NSTextAlignmentCenter;
            [self.titleView addSubview:label];
            [self.labelArray addObject:label];
        }
        UIView *dateView = [[UIView alloc] init];
        dateView.backgroundColor = [UIColor clearColor];
        [self addSubview:dateView];
        self.dateView = dateView;
        [self loadWithDate:_currentDate];
    }
    return self;
}
- (void)loadWithDate:(NSDate *)date {
    if (self.buttonArray) {
        [self.buttonArray removeAllObjects];
    }
    if (self.dateView.subviews.count > 0) {
          [self.dateView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    _days = [self getTotalDaysInMonth:date];
    _firstDays = [self getFirstDayOfMonth:date];
    self.titleLable.text = [NSString stringWithFormat:@"%zd-%zd-%zd",[self getCurrentYear:date],[self getCurrentMonth:date],[self getCurrentDay:date]];
    for (int i = 1; i <= _days; i++) {
        UIButton *button = [[UIButton alloc] init];
        button.layer.cornerRadius = 20.f;
        button.layer.masksToBounds = YES;
        [button setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        if (i == [self getCurrentDay:[NSDate date]]) {
            button.backgroundColor = [UIColor colorWithRed:153/255.0 green:190/255.0 blue:218/255.0 alpha:1.0];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        [self.dateView addSubview:button];
        [self.buttonArray addObject:button];
    }
}
- (void)preBtnClick {
    NSDate *preDate = [self lastMonth:_currentDate];
    [self loadWithDate:preDate];
    [self setNeedsLayout];
    _currentDate = preDate;
}
- (void)nextBtnClick {
    NSDate *nextDate = [self nextMonth:_currentDate];
    [self loadWithDate:nextDate];
    [self setNeedsLayout];
    _currentDate = nextDate;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLable.frame = CGRectMake(0, 0, self.width, 40);
    self.preBtn.size = CGSizeMake(40, 40);
    self.preBtn.x = 0;
    self.preBtn.y = 0;
    self.nextBtn.size = CGSizeMake(40, 40);
    self.nextBtn.y = 0;
    self.nextBtn.x = self.width - self.nextBtn.width;
    self.titleView.frame = CGRectMake(0, self.titleLable.bottom, self.width, 40);
    for (int i = 0; i < self.labelArray.count; i++) {
        UILabel *label = self.labelArray[i];
        label.width = self.width / 7;
        label.height = self.titleView.height;
        label.y = 0;
        label.x = i * label.width;
    }
    self.dateView.frame = CGRectMake(0, self.titleView.bottom, self.width,  self.height - self.titleView.bottom);
    NSInteger row = (_firstDays % 7 + _days + 6) / 7;
    NSInteger colum = 7;
    CGFloat buttonH = self.dateView.height / row;
    CGFloat buttonW = self.dateView.width / 7;
    for (int i = 0; i < self.buttonArray.count; i++) {
        UIButton *button = self.buttonArray[i];
        button.width = buttonW;
        button.height = buttonH;
        button.x = (_firstDays % 7 + i) % colum * buttonW;
        button.y = (_firstDays % 7 + i) / colum * buttonH;
    }
}

@end
