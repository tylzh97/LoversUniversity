//
//  LZHTabBarController.m
//  LoversUniversity
//
//  Created by 李政浩 on 2018/9/4.
//  Copyright © 2018年 李政浩. All rights reserved.
//

#import "LZHTabBarController.h"
#import "ViewController.h"

#import "LZHScheduleView.h"
#import "LZHUserView.h"
#import "LZHMessageView.h"

@interface LZHTabBarController ()

@end

@implementation LZHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UINavigationController * nav2 = [[UINavigationController alloc] initWithRootViewController:[LZHScheduleView new]];
    
    
    [self addChildViewController:[self getViewController:[LZHMessageView new] withtitle:@"悄悄话" andImageName:@"message"]];
    [self addChildViewController:[self getViewController:nav2 withtitle:@"课程表" andImageName:@"schedule"]];
    [self addChildViewController:[self getViewController:[LZHUserView new] withtitle:@"我" andImageName:@"user"]];
    
    //让软件启动默认在第二页
    self.selectedIndex = 1;
}

- (UIViewController *) getViewController:(UIViewController *) vc withtitle:(NSString *)title andImageName:(NSString *) imgName{
    vc.title = title;
    vc.tabBarItem.image = [self resizeUIImage:[UIImage imageNamed:imgName] withSize:CGSizeMake(30, 30)];
    vc.tabBarItem.selectedImage = [[self resizeUIImage:[UIImage imageNamed:[imgName stringByAppendingString:@"_fill"]] withSize:CGSizeMake(30, 30)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return vc;
}

//重置图像大小的新方法测试
- (UIImage *) resizeUIImage:(UIImage *) img withSize:(CGSize) reSize{
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(0, 0, reSize.width, reSize.height);
    [btn setImage:img forState:UIControlStateNormal];
    [view addSubview:btn];
    
    CGSize s = view.bounds.size;
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
    UIGraphicsBeginImageContextWithOptions(s, NO, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
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
