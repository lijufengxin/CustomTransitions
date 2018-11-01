//
//  SwipeInteractionController.h
//  CustomTransitions
//
//  Created by fengxin on 2018/10/31.
//  Copyright © 2018年 fengxin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SwipeInteractionController : UIPercentDrivenInteractiveTransition
@property(nonatomic)  BOOL  interactionInProgress;
-(id)init:(UIViewController *)viewController;
@end

NS_ASSUME_NONNULL_END
