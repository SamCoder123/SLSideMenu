//
//  SLSideMenuVC.m
//  SLSideMenu
//
//  Created by halong33 on 16/3/16.
//  Copyright © 2016年 com.halong. All rights reserved.
//

#import "SLSideMenuVC.h"

@interface SLSideMenuVC ()<UIGestureRecognizerDelegate>
//菜单栏容器视图
@property (nonatomic, strong) UIView *menuViewContainer;
//只控制器容器视图
@property (nonatomic, strong) UIView *mainViewContainer;
@property (nonatomic, assign) BOOL sideMenuVisible;
@property (assign, nonatomic)  NSInteger currentX;
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
    self.menuViewContainer.frame = CGRectMake(self.view.bounds.origin.x-30, self.view.bounds.origin.y, self.view.bounds.size.width, self.view.bounds.size.height);
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
    //添加手势
    // 添加滑动的手势手势
    UIPanGestureRecognizer * panGes = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(viewDidSlide:)];
    [_mainVC.view addGestureRecognizer:panGes];
}
//展示侧边栏
- (void)presentSideMenu{
    if (self.sideMenuVisible)  return;
    //分别设置两个容器类layer的锚点
    [self setAnChorPoint:CGPointMake(1.0, 0.5) forView:_mainViewContainer];
    [self setAnChorPoint:CGPointMake(0, 0.5) forView:_menuViewContainer];
    [self setAnChorPoint:CGPointMake(1.0, 0.5) forView:_mainVC.view];
    [UIView animateWithDuration:self.duration animations:^{
        CATransform3D mainScaleTransform = _mainViewContainer.layer.transform;
        mainScaleTransform = CATransform3DMakeScale(_mainVCScaleValue, _mainVCScaleValue, 1.0f);
        //设置mainViewContainer的缩放形变;
        _mainViewContainer.layer.transform = mainScaleTransform;
        CATransform3D mainTranslateTransform = _mainViewContainer.layer.transform;
        mainTranslateTransform = CATransform3DTranslate(mainTranslateTransform, 100, 0, 0);
        //设置mainViewContainer的平移形变;
        _mainViewContainer.layer.transform = mainTranslateTransform;
        
        //设置menuViewContainer的平移形变
        CATransform3D menuTranslateTransform = _menuViewContainer.layer.transform;
        menuTranslateTransform = CATransform3DTranslate(menuTranslateTransform, 30, 0, 0);
        _menuViewContainer.layer.transform = menuTranslateTransform;
    } completion:^(BOOL finished) {
        self.sideMenuVisible = YES;
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
        _menuViewContainer.layer.transform = CATransform3DIdentity;
    } completion:^(BOOL finished) {
        self.sideMenuVisible = NO;
    }];
}
#pragma mark Pan 手势识别
- (void)viewDidSlide:(UIScreenEdgePanGestureRecognizer *)pan{
    CGPoint location = [pan locationInView:self.view];
    if (pan.state == UIGestureRecognizerStateBegan) self.currentX = location.x; // 拿到当前的位置
        if (pan.state == UIGestureRecognizerStateEnded) { // 如果拖拽停止了
            CGPoint translantion = [pan translationInView:self.mainVC.view];
            if(ABS(translantion.x)/ABS(translantion.y) > 1){
                if (self.sideMenuVisible&&location.x<self.currentX) {
                    [self hideSideMenu];
                }else if(!self.sideMenuVisible&&location.x>self.currentX){
                    [self presentSideMenu];
                }
            }
        }
}
@end