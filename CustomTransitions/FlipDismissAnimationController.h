//
//  FlipDismissAnimationController.h
//  CustomTransitions
//
//  Created by fengxin on 2018/10/31.
//  Copyright © 2018年 fengxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SwipeInteractionController.h"
NS_ASSUME_NONNULL_BEGIN

@interface FlipDismissAnimationController : NSObject<UIViewControllerAnimatedTransitioning>
@property(nonatomic,strong) SwipeInteractionController *interactionController;
-(id)init:(CGRect)finalFrame interactionController:(SwipeInteractionController *)interactionController;
@end

NS_ASSUME_NONNULL_END
