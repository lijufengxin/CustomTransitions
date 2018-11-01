//
//  FlipDismissAnimationController.m
//  CustomTransitions
//
//  Created by fengxin on 2018/10/31.
//  Copyright © 2018年 fengxin. All rights reserved.
//

#import "FlipDismissAnimationController.h"
#import "SwipeInteractionController.h"

@interface FlipDismissAnimationController()
@property(nonatomic) CGRect finalFrame;

@end
@implementation FlipDismissAnimationController


-(id)init:(CGRect)finalFrame interactionController:(SwipeInteractionController *)interactionController{
    self.finalFrame = finalFrame;
    self.interactionController = interactionController;
    return self;
}
- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = transitionContext.containerView;
    UIView *snapshot = [fromVC.view  snapshotViewAfterScreenUpdates:NO];
    
    snapshot.layer.cornerRadius = 5;
    snapshot.layer.masksToBounds = YES;
//    [containerView insertSubview:toVC.view atIndex:0];
    [containerView addSubview:toVC.view];
     [containerView addSubview:snapshot];
    fromVC.view.hidden = YES;
    
    
    CATransform3D  transform = CATransform3DIdentity;
    transform.m34 = -0.002;
    containerView.layer.sublayerTransform = transform;
    toVC.view.layer.transform =  CATransform3DMakeRotation(-M_PI_2, 0.0, 1.0, 0.0);
    
    [UIView animateKeyframesWithDuration: [self transitionDuration:transitionContext] delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1/3.0 animations:^{
            snapshot.frame = self.finalFrame;
          
        }];
        
        [UIView addKeyframeWithRelativeStartTime:1/3.0 relativeDuration:1/3.0 animations:^{
            snapshot.layer.transform = CATransform3DMakeRotation(M_PI_2, 0.0, 1.0, 0.0);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:2/3.0 relativeDuration:1/3.0 animations:^{
            toVC.view.layer.transform = CATransform3DMakeRotation(0, 0, 1.0, 0.0);
        }];
    
        
        
        
    } completion:^(BOOL finished) {
        [fromVC.view setHidden:NO];
        [snapshot removeFromSuperview];
         [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
    
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 5;
}

@end
