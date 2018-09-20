//
//  LZHScheduleView.m
//  LoversUniversity
//
//  Created by 李政浩 on 2018/9/5.
//  Copyright © 2018年 李政浩. All rights reserved.
//

#import "LZHScheduleView.h"

@interface LZHScheduleView ()

@property (nonatomic, strong) UILabel *testLabel;

@end

@implementation LZHScheduleView

+ (instancetype)new{
    id obj = [super new];
    if(obj){
        return obj;
    }
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化界面,只会执行一次.
    [self initlizeView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
    label.text = @"SafeArea";
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor greenColor];
    [self.view addSubview:label];
    self.testLabel = label;

    
    self.navigationItem.title = NSLocalizedString(@"ScheduleName", nil);
    
}


- (void)viewSafeAreaInsetsDidChange {
    [super viewSafeAreaInsetsDidChange];
    UIEdgeInsets insets = self.view.safeAreaInsets;
    self.testLabel.frame = CGRectMake(insets.left, insets.top, self.view.frame.size.width - (insets.right + insets.left), self.view.frame.size.height - (insets.top + insets.bottom));
}

/**用于初始化界面,该函数只会执行一次.*/
- (void) initlizeView {
    if(!self.hasInitlized){
        self.hasInitlized = TRUE;
        
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
