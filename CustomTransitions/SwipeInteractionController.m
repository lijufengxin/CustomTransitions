//
//  SwipeInteractionController.m
//  CustomTransitions
//
//  Created by fengxin on 2018/10/31.
//  Copyright © 2018年 fengxin. All rights reserved.
//

#import "SwipeInteractionController.h"

@interface SwipeInteractionController()
{
    
    BOOL  shouldCompleteTransition;
    
}
@property(nonatomic,strong)UIViewController *viewController;
@end


@implementation SwipeInteractionController


-(id)init:(UIViewController *)viewController{
   self =  [super init];
    self.viewController = viewController;
    [self  prepareGestureRecognizer:self.viewController.view];
    return  self;
}


-(void)prepareGestureRecognizer:(UIView *)view{
    
    UIScreenEdgePanGestureRecognizer *gesture = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(handleGesture:)];
    gesture.edges = UIRectEdgeLeft;
    [view addGestureRecognizer:gesture];
    
    
}


-(void)handleGesture:(UIScreenEdgePanGestureRecognizer *)gesture{
    CGPoint translation = [gesture translationInView:gesture.view.superview];
    CGFloat  progress = translation.x/200;
    progress =   MIN(MAX(progress, 0.0), 1.0);
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:{
            _interactionInProgress = YES;
            [_viewController dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        case UIGestureRecognizerStateChanged:{
            shouldCompleteTransition = progress> 0.5;
            [self updateInteractiveTransition:progress];
        }
            break;
        case UIGestureRecognizerStateCancelled:{
            _interactionInProgress = NO;
            [self cancelInteractiveTransition];
        }
            break;
        case UIGestureRecognizerStateEnded:{
            _interactionInProgress = NO;
            if (shouldCompleteTransition) {
                [self finishInteractiveTransition];
            }else{
                [self cancelInteractiveTransition];
            }
        }
            break;
        default:
            break;
    }
    
}

@end
