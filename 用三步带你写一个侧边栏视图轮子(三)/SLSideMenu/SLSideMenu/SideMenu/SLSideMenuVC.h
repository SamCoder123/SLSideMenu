//
//  SLSideMenuVC.h
//  SLSideMenu
//
//  Created by halong33 on 16/3/16.
//  Copyright © 2016年 com.halong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLSideMenuVC : UIViewController
//主视图控制器
@property (nonatomic, strong)UIViewController *mainVC;
//侧边栏控制器
@property (nonatomic, strong)UIViewController *sideMenuVC;
//主视图动画的时间
@property (nonatomic, assign)NSTimeInterval duration;
//主视图缩放的大小值
@property (nonatomic, assign)CGFloat mainVCScaleValue;
//构造方法,从这个方法把mainVC和sideMenuVC传给我
- (id)initWithMainVC:(UIViewController *)mainVC sideMenuVC:(UIViewController *)sideMenuVC;
//显示侧边栏
- (void)presentSideMenu;
//隐藏侧边栏
- (void)hideSideMenu;
@end