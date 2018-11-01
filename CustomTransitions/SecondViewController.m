//
//  SecondViewController.m
//  CustomTransitions
//
//  Created by fengxin on 2018/10/31.
//  Copyright © 2018年 fengxin. All rights reserved.
//

#import "SecondViewController.h"
#import "FlipPresentAnimationController.h"
@interface SecondViewController ()<UIViewControllerTransitioningDelegate,UINavigationControllerDelegate>

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.delegate = self;
    self.swip = [[SwipeInteractionController alloc]init:self];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)popHandle:(id)sender {
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0){
    return [[FlipPresentAnimationController alloc]init:CGRectMake((self.view.frame.size.width - 200)/2, (self.view.frame.size.height - 200)/2, 200, 200)];
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
