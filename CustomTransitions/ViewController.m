//
//  ViewController.m
//  CustomTransitions
//
//  Created by fengxin on 2018/10/31.
//  Copyright © 2018年 fengxin. All rights reserved.
//

#import "ViewController.h"
#import "CustomCollectionViewCell.h"
#import "SecondViewController.h"
#import "FlipPresentAnimationController.h"
#import "FlipDismissAnimationController.h"
@interface ViewController ()<UIViewControllerTransitioningDelegate,UINavigationControllerDelegate>

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
//    self.navigationController.delegate = self;
    [self.view addSubview:self.collectionView];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width    , self.view.frame.size.height - 64);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}




- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [[FlipPresentAnimationController alloc]init:CGRectMake((self.view.frame.size.width - 200)/2, (self.view.frame.size.height - 200)/2, 200, 200)];
    
}


- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    if ([dismissed isKindOfClass:[SecondViewController class]]) {
        SecondViewController *second = dismissed;
         return [[FlipDismissAnimationController alloc]init:CGRectMake((self.view.frame.size.width - 200)/2, (self.view.frame.size.height - 200)/2, 200, 200)  interactionController:second.swip];
    }else{
        return nil;
    }
    
   
}


- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator{
    if ( [animator isMemberOfClass:[FlipDismissAnimationController class]]) {
        FlipDismissAnimationController *dd = animator;
        if (dd.interactionController.interactionInProgress) {
              return dd.interactionController;
        }else{
            return nil;
        }
      
    }
    else{
        return nil;
    }
}


 
- (void)collectionView:(UICollectionView *)collectionView prefetchItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths NS_AVAILABLE_IOS(10_0){
    
}

- (NSInteger ) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger ) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  3;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CustomCollectionViewCell *cell  =[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
   
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    SecondViewController *second = [[SecondViewController alloc]init];
    self.navigationController.delegate = second;
//    second.transitioningDelegate = self;
//    [self presentViewController:second animated:YES completion:nil];
    
    [self.navigationController pushViewController:second animated:YES];
//    [self presentModalViewController:[[SecondViewController alloc]init]
    
}


#pragma mark View
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = CGSizeMake(200, 200);
        layout.minimumLineSpacing = 10;
      
        
    _collectionView= [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64,  self.view.frame.size.width   ,self.view.frame.size.height - 64)
                                                              collectionViewLayout:layout];
         _collectionView.pagingEnabled = YES;
        [_collectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
   
    }
    return _collectionView;
}

@end
