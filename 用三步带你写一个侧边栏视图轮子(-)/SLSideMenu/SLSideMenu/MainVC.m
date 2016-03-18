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
@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor yellowColor]];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu"style:UIBarButtonItemStylePlain target:self
action:@selector(presentLeftMenuViewController)];
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