//
//  FlipPresentAnimationController.h
//  CustomTransitions
//
//  Created by fengxin on 2018/10/31.
//  Copyright © 2018年 fengxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface FlipPresentAnimationController : NSObject<UIViewControllerAnimatedTransitioning>
-(id)init:(CGRect)originFrame;
@end

NS_ASSUME_NONNULL_END
