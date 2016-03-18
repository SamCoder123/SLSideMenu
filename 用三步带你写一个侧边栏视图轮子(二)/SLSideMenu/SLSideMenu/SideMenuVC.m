/*
 工程名:SLSideMenu
 文件名称:SideMenuVC.m
 创建者: 李善忠 SamLee 简书关注:小王子sl 爱编程  希望代码少点bug 目标:代码手工艺者
 创建时间:16/3/16
 描述:
 */
#import "SideMenuVC.h"
#import "AppDelegate.h"

@interface SideMenuVC ()

@end

@implementation SideMenuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor purpleColor]];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    SLSideMenuVC *sideMenu = ((AppDelegate *)[UIApplication sharedApplication].delegate).slSideMenuVC;
    [sideMenu hideSideMenu];
}
+ (instancetype)controller {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    return [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([SideMenuVC class])];
}

@end
