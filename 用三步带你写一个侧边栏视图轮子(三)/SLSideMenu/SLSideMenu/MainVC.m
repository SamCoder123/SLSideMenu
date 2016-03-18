//
//  ViewController.m
//  SLSideMenu
//
//  Created by halong33 on 16/3/16.
//  Copyright © 2016年 com.halong. All rights reserved.
//

#import "MainVC.h"
#import "SLSideMenuVC.h"
#import "AppDelegate.h"

@interface MainVC ()
@property (weak, nonatomic) IBOutlet UIView *titleContanierView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contanierViewTop;

@end

@implementation MainVC
- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
    _titleContanierView.alpha = 1.0;
    _contanierViewTop.constant = 21.0;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    _titleContanierView.alpha = 0.0;

    [UIView animateWithDuration:2 animations:^{
        _titleContanierView.alpha ++;

        [_titleContanierView layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}
- (IBAction)menuClickAction:(id)sender {
    [self presentLeftMenuViewController];
}
- (void) presentLeftMenuViewController{
    SLSideMenuVC *sideMenu = ((AppDelegate *)[UIApplication sharedApplication].delegate).slSideMenuVC;
    [sideMenu presentSideMenu];
}
+ (instancetype) controller{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    return [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([MainVC class])];
}
@end