//
//  FlipPresentAnimationController.m
//  CustomTransitions
//
//  Created by fengxin on 2018/10/31.
//  Copyright © 2018年 fengxin. All rights reserved.
//

#import "FlipPresentAnimationController.h"

@interface FlipPresentAnimationController()
@property(nonatomic) CGRect originFrame;

@end


@implementation FlipPresentAnimationController


-(id)init:(CGRect)originFrame{
    self.originFrame = originFrame;
    return  self;
}


- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *snapshot = [toVC.view snapshotViewAfterScreenUpdates:YES];
    UIView *containerView = transitionContext.containerView;
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    
    snapshot.frame = _originFrame;
    snapshot.layer.cornerRadius = 5;
    snapshot.layer.masksToBounds = YES;
    
    [containerView addSubview:toVC.view];
    [containerView addSubview:snapshot];
    toVC.view.hidden = YES;
    
    
    CATransform3D  transform = CATransform3DIdentity;
    transform.m34 = -0.002;
    containerView.layer.sublayerTransform = transform;
    snapshot.layer.transform =  CATransform3DMakeRotation(M_PI_2, 0.0, 1.0, 0.0);
    
    [UIView animateKeyframesWithDuration: [self transitionDuration:transitionContext] delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1/3.0 animations:^{
            fromVC.view.layer.transform = CATransform3DMakeRotation(-M_PI_2, 0.0, 1.0, 0.0);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:1/3.0 relativeDuration:1/3.0 animations:^{
             snapshot.layer.transform = CATransform3DMakeRotation(0, 0, 1.0, 0.0);
        }];
        [UIView addKeyframeWithRelativeStartTime:2/3.0 relativeDuration:1/3.0 animations:^{
            snapshot.frame = finalFrame;
            snapshot.layer.cornerRadius = 0;
        }];

        
        
    } completion:^(BOOL finished) {
        [toVC.view setHidden:NO];
        [snapshot removeFromSuperview];
        fromVC.view.layer.transform = CATransform3DIdentity;
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
    
    
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return  3;
}

@end
