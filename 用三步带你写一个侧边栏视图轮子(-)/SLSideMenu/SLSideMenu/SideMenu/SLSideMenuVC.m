//
//  SLSideMenuVC.m
//  SLSideMenu
//
//  Created by halong33 on 16/3/16.
//  Copyright © 2016年 com.halong. All rights reserved.
//

#import "SLSideMenuVC.h"

@interface SLSideMenuVC ()
//菜单栏容器视图
@property (nonatomic, strong) UIView *menuViewContainer;
//只控制器容器视图
@property (nonatomic, strong) UIView *mainViewContainer;
@end

@implementation SLSideMenuVC
//
- (id)initWithMainVC:(UIViewController *)mainVC sideMenuVC:(UIViewController *)sideMenuVC{
    if (self = [super init]) {
        _menuViewContainer = [[UIView alloc] init];
        _mainViewContainer = [[UIView alloc] init];
        _duration = 0.35;
        _mainVCScaleValue = 0.7f;
        _sideMenuVC = sideMenuVC;
        _mainVC = mainVC;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.menuViewContainer];
    [self.view addSubview:self.mainViewContainer];
    
    self.menuViewContainer.frame = self.view.bounds;
    self.menuViewContainer.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    if (self.sideMenuVC) {
        [self addChildViewController:self.sideMenuVC];
        self.sideMenuVC.view.frame = self.view.bounds;
        self.sideMenuVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.menuViewContainer addSubview:self.sideMenuVC.view];
    }
    self.mainViewContainer.frame = self.view.bounds;
    self.mainViewContainer.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addChildViewController:self.mainVC];
    self.mainVC.view.frame = self.view.bounds;
    [self.mainViewContainer addSubview:self.mainVC.view];
    [_mainViewContainer setBackgroundColor:[UIColor blueColor]];

}
//展示侧边栏
- (void)presentSideMenu{
    //分别设置两个容器类layer的锚点
    [self setAnChorPoint:CGPointMake(1.0, 0.5) forView:_mainViewContainer];
    [self setAnChorPoint:CGPointMake(1.0, 0.5) forView:_menuViewContainer];
    
    [UIView animateWithDuration:self.duration animations:^{
        CATransform3D mainScaleTransform = _mainViewContainer.layer.transform;
        mainScaleTransform = CATransform3DMakeScale(_mainVCScaleValue, _mainVCScaleValue, 1.0f);
        //设置mainViewContainer的缩放形变;
        _mainViewContainer.layer.transform = mainScaleTransform;
        
        CATransform3D mainTranslateTransform = _mainViewContainer.layer.transform;
        mainTranslateTransform = CATransform3DTranslate(mainTranslateTransform, 100, 0, 0);

        //设置mainViewContainer的平移形变;
        _mainViewContainer.layer.transform = mainTranslateTransform;

    } completion:^(BOOL finished) {
        
    }];
}

- (void)setAnChorPoint:(CGPoint)anchorPoint forView:(UIView *)view {
    //layer的修改anchorPoint，但又不想要移动layer也就是不想修改frame.origin,那就这样写
    CGRect oldFrame = view.frame;
    view.layer.anchorPoint = anchorPoint;
    view.frame = oldFrame;
}

- (void)hideSideMenu{
    [UIView animateWithDuration:self.duration animations:^{
        _mainViewContainer.layer.transform = CATransform3DIdentity;
    } completion:^(BOOL finished) {
    }];
}


@end
