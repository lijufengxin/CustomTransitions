//
//  CustomCollectionViewCell.m
//  CustomTransitions
//
//  Created by fengxin on 2018/10/31.
//  Copyright © 2018年 fengxin. All rights reserved.
//

#import "CustomCollectionViewCell.h"

@implementation CustomCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createCellUI];
    }
    return self;
}

-(void)createCellUI{
    for (UIView *view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    _headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    _headImageView.center = self.contentView.center;
    _headImageView.backgroundColor = [UIColor redColor];
    _headImageView.layer.cornerRadius = 5;
    [self.contentView addSubview:_headImageView];
}


@end
