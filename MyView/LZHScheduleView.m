//
//  LZHScheduleView.m
//  LoversUniversity
//
//  Created by 李政浩 on 2018/9/5.
//  Copyright © 2018年 李政浩. All rights reserved.
//

#import "LZHScheduleView.h"

@interface LZHScheduleView ()

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
    
    self.navigationItem.title = @"123";
    
    UIButton * myBtn;
    myBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    myBtn.frame  = CGRectMake(0, 0, 30, 30);
    [myBtn setCenter:CGPointMake(35, 30)];
    myBtn.backgroundColor = [UIColor greenColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:myBtn];
    
    // Do any additional setup after loading the view.
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
