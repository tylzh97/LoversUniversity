//
//  LZHTabBarController.m
//  LoversUniversity
//
//  Created by 李政浩 on 2018/9/4.
//  Copyright © 2018年 李政浩. All rights reserved.
//

#import "LZHTabBarController.h"
#import "ViewController.h"

@interface LZHTabBarController ()

@end

@implementation LZHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addChildViewController:[self getNewVCWithtitle:@"消息" andImageName:@"message"]];
    [self addChildViewController:[self getNewVCWithtitle:@"课表" andImageName:@"schedule"]];
    [self addChildViewController:[self getNewVCWithtitle:@"用户" andImageName:@"user"]];
}

- (UIViewController *) getNewVCWithtitle:(NSString *)title andImageName:(NSString *) imgName{
    UIViewController * nvc = [ViewController new];
    nvc.title = title;
    nvc.tabBarItem.image = [self resizeUIImage:[UIImage imageNamed:imgName] withSize:CGSizeMake(30, 30)];
    nvc.tabBarItem.selectedImage = [[self resizeUIImage:[UIImage imageNamed:[imgName stringByAppendingString:@"_fill"]] withSize:CGSizeMake(30, 30)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return nvc;
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
