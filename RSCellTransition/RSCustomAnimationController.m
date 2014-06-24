//
//  CubeNavigationAnimator.m
//  MovieQuiz
//
//  Created by Andrés Brun on 27/10/13.
//  Copyright (c) 2013 Andrés Brun. All rights reserved.
//

#import "RSCustomAnimationController.h"


@implementation RSCustomAnimationController

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext fromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC fromView:(UIView *)fromView toView:(UIView *)toView
{
    if (self.reverse) {
        [self executeReverseAnimation:transitionContext fromVC:fromVC toVC:toVC fromView:fromView toView:toView];
    }
    else
    {
        [self executeForwardsAnimation:transitionContext fromVC:fromVC toVC:toVC fromView:fromView toView:toView];
    }
}



// ****** FIRST ONE ****** //



//- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext fromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC fromView:(UIView *)fromView toView:(UIView *)toView
//{
//    
//    //Calculate the direction
//    
//    //Create the differents 3D animations
//    CGAffineTransform viewFromTransform;
//    CGAffineTransform viewToTransform;
//    
//    //We create a content view for do the translate animation
//    UIView *generalContentView = [transitionContext containerView];
//    
//    float anchorY;
//    if(!self.reverse)
//    {
//        anchorY = (_cellCenter.y + 60) / fromView.frame.size.height;
//        float diff = fromView.center.y - _cellCenter.y - 60;
//        toView.transform = CGAffineTransformMakeScale(0, 0);
//        viewFromTransform = CGAffineTransformMakeScale(20, 20);
//        viewFromTransform = CGAffineTransformTranslate(viewFromTransform,0,diff);
//        viewToTransform = CGAffineTransformMakeScale(1, 1);
//        _lastAnchorY = anchorY;
//        [generalContentView addSubview:toView];
//    }
//    else
//    {
//        anchorY = _lastAnchorY?:0.5;
//        
//        float diff = fromView.center.y - _cellCenter.y - 60;
//        viewFromTransform = CGAffineTransformMakeScale(0, 0);
//        viewFromTransform = CGAffineTransformTranslate(viewFromTransform, 0, 0);
//        toView.transform = CGAffineTransformTranslate(CGAffineTransformMakeScale(10, 10),0, diff);
//        viewToTransform = CGAffineTransformMakeScale(1, 1);
//        viewToTransform = CGAffineTransformTranslate(viewToTransform, 0, 0);
//        toView.alpha = 1;
//        [generalContentView addSubview:toView];
//        [generalContentView bringSubviewToFront:fromView];
//    }
//    
//    //Add the to- view
//    
//    
//    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//        
//        fromView.transform = viewFromTransform;
//        toView.transform = viewToTransform;
//        if(self.reverse)
//        {
//            toView.alpha = 1;
//        }
//        else
//        {
//        }
//        
//    } completion:^(BOOL finished) {
//        
//        
//        toView.alpha = 1;
//        fromView.alpha = 0;
//        //Set the final position of every elements transformed
//        [generalContentView setTransform:CGAffineTransformIdentity];
//        fromView.layer.transform = CATransform3DIdentity;
//        toView.layer.transform = CATransform3DIdentity;
//        
//        [fromView.layer setAnchorPoint:CGPointMake(0.5f, 0.5f)];
//        //
//        [toView.layer setAnchorPoint:CGPointMake(0.5f, 0.5f)];
//        
//        if ([transitionContext transitionWasCancelled]) {
//            [toView removeFromSuperview];
//            fromView.alpha = 1;
//        } else {
//            [fromView removeFromSuperview];
//        }
//        
//        // inform the context of completion
//        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
//        
//    }];
//    
//}

/**************************************************************************************************************************************/



// ******** SECOND ONE ******* //


//-(void)executeForwardsAnimation:(id<UIViewControllerContextTransitioning>)transitionContext fromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC fromView:(UIView *)fromView toView:(UIView *)toView {
//    UIView* containerView = [transitionContext containerView];
//    
//    NSLog(@"forward");
//    [containerView addSubview:toView];
//    
//    UICollectionViewController *fromCVC = (UICollectionViewController*)fromVC;
//    _collectionView = (UICollectionView*)fromCVC.collectionView;
//    
//    _cell = [_collectionView cellForItemAtIndexPath:[_collectionView indexPathsForSelectedItems][0]];
//    [fromView bringSubviewToFront:_cell];
//    
//    for (UICollectionViewCell *visibleCell in _collectionView.visibleCells) {
//        visibleCell.tag = visibleCell.frame.origin.y;
//        if (![visibleCell isEqual:_cell]) {
//            CGRect rect = visibleCell.frame;
//            rect.origin.y = 600;
//            visibleCell.tag = visibleCell.frame.origin.y;
//            [UIView animateWithDuration:0.5 animations:^{
//                visibleCell.frame = rect;
//            }];
//        }
//    }
//    
//    CGRect cellFrame = _cell.frame;
//    cellFrame.size.width = 320;
//    cellFrame.size.height = fromView.frame.size.height + 64;
//    cellFrame.origin.y = - 64;
//    
//    /* ToView Transform */
//    toView.transform = CGAffineTransformMakeTranslation(fromView.frame.size.width, 0);
//    
//    
//    [UIView animateWithDuration:0.5 animations:^{
//        
//        _cell.frame = cellFrame;
//        
//    } completion:^(BOOL finished) {
//        
//        CGRect cellFrame2 = _cell.frame;
//        cellFrame2.origin.x = -fromView.frame.size.width;
//        
//        [UIView animateWithDuration:0.5 animations:^{
//            _cell.frame = cellFrame2;
//            toView.transform = CGAffineTransformMakeTranslation(0, 0);
//        }completion:^(BOOL finished) {
//            
//            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
//        }];
//    }];
//}
//
//
//-(void)executeReverseAnimation:(id<UIViewControllerContextTransitioning>)transitionContext fromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC fromView:(UIView *)fromView toView:(UIView *)toView {
//    NSLog(@"reverse");
//
//    UIView* containerView = [transitionContext containerView];
//    
//    [containerView insertSubview:toView belowSubview:fromView];
//    
//    UICollectionViewController *toCVC = (UICollectionViewController*)toVC;
//    _collectionView = (UICollectionView*)toCVC.collectionView;
//    for (UICollectionViewCell *visibleCell in _collectionView.visibleCells) {
//        if (visibleCell.frame.origin.x < -10 ) {
//            _cell = visibleCell;
//        }
//    }
//    [fromView bringSubviewToFront:_cell];
//    
//    CGRect cellFrame = _cell.frame;
//    cellFrame.size.width = 320;
//    cellFrame.size.height = fromView.frame.size.height + 64;
//    cellFrame.origin.y = - 64;
//    _cell.frame = cellFrame;
//   
//    
//    toView.transform = CGAffineTransformMakeTranslation(0, 0);
//
//    fromView.transform = CGAffineTransformMakeTranslation(0, 0);
//    
//    CGRect cellFrame2 = _cell.frame;
//    cellFrame2.origin.x = 0;
//    [UIView animateWithDuration:0.5 animations:^{
//        
//        _cell.frame = cellFrame2;
//        fromView.transform = CGAffineTransformMakeTranslation(fromView.frame.size.width, 0);
//    } completion:^(BOOL finished) {
//        CGRect cellFrame3 = _cell.frame;
//        cellFrame3.size.height = 80;
//        cellFrame3.origin.y = _cell.tag;
//        [UIView animateWithDuration:0.5 animations:^{
//            
//            _cell.frame = cellFrame3;
//            
//        }completion:^(BOOL finished) {
//        
//        }];
//        for (UICollectionViewCell *visibleCell in _collectionView.visibleCells) {
//            if (![visibleCell isEqual:_cell]) {
//                CGRect rect = visibleCell.frame;
//                rect.origin.y = visibleCell.tag;
//                [UIView animateWithDuration:0.5 animations:^{
//                    visibleCell.frame = rect;
//                }];
//            }
//        }
//        
//        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
//
//    }];
//}


/**************************************************************************************************************************************/



// ******** THIRD ONE ******* // Just ticket move

-(void)executeForwardsAnimation:(id<UIViewControllerContextTransitioning>)transitionContext fromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC fromView:(UIView *)fromView toView:(UIView *)toView {
    UIView* containerView = [transitionContext containerView];
    
    [containerView addSubview:toView];
    
//    if(![fromVC isKindOfClass:[UICollectionViewController class]])
//    {
//        [transitionContext completeTransition:YES];
//        return;
//    }
    UIView *cellToMove;
    
    if([fromVC isKindOfClass:[UICollectionViewController class]] || [[fromVC class] isSubclassOfClass:[UICollectionViewController class]])
    {
        UICollectionViewController *fromCVC = (UICollectionViewController*)fromVC;
        _collectionView = fromCVC.collectionView;
    
        _cell = [_collectionView cellForItemAtIndexPath:[_collectionView indexPathsForSelectedItems][0]];
        [fromView bringSubviewToFront:_cell];
        
        cellToMove = _cell;
    }
    else if([fromVC isKindOfClass:[UITableViewController class]] || [[fromVC class] isSubclassOfClass:[UITableViewController class]])
    {
        UITableViewController *fromTVC = (UITableViewController*)fromVC;
        _tableView = fromTVC.tableView;
        
        _tableCell = [_tableView cellForRowAtIndexPath:[_tableView indexPathForSelectedRow]];
        [fromView bringSubviewToFront:_cell];
        
        cellToMove = _tableCell.contentView;
    }
    /* ToView Transform */
    cellToMove.transform = CGAffineTransformMakeTranslation(0, 0);
    
    toView.transform = CGAffineTransformMakeTranslation(fromView.frame.size.width, 0);
    
    [UIView animateWithDuration:0.4 animations:^{
        
        cellToMove.transform = CGAffineTransformMakeTranslation(-fromView.frame.size.width, 0);
        toView.transform =CGAffineTransformMakeTranslation(0, 0);

    } completion:^(BOOL finished) {
        [fromView removeFromSuperview];
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
}


-(void)executeReverseAnimation:(id<UIViewControllerContextTransitioning>)transitionContext fromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC fromView:(UIView *)fromView toView:(UIView *)toView {
    NSLog(@"animation");
    UIView* containerView = [transitionContext containerView];
    
    [containerView insertSubview:toView belowSubview:fromView];
    
    UIView *cellToMove;
    BOOL isCollectionView = false;
    BOOL isTableView = false;
    if([toVC isKindOfClass:[UICollectionViewController class]] || [[toVC class] isSubclassOfClass:[UICollectionViewController class]])
    {
        UICollectionViewController *toCVC = (UICollectionViewController*)toVC;
        _collectionView = (UICollectionView*)toCVC.collectionView;
        for (UICollectionViewCell *visibleCell in _collectionView.visibleCells) {
            if (visibleCell.transform.tx < -10 ) {
                _cell = visibleCell;
            }
        }
        cellToMove = _cell;
        isCollectionView = true;
    }
    else if([toVC isKindOfClass:[UITableViewController class]] || [[toVC class] isSubclassOfClass:[UITableViewController class]])
    {
        UITableViewController *toTVC = (UITableViewController*)toVC;
        _tableView = toTVC.tableView;
        for (UITableViewCell *visibleCell in _tableView.visibleCells) {
            if (visibleCell.contentView.transform.tx < -10 ) {
                _tableCell = visibleCell;
            }
        }
        cellToMove = _tableCell.contentView;
        isTableView = true;
    }
    
    
    [fromView bringSubviewToFront:cellToMove];
    
    
    /* ToView Transform */
    cellToMove.transform = CGAffineTransformMakeTranslation(-fromView.frame.size.width, 0);
    
    fromView.transform = CGAffineTransformMakeTranslation(0, 0);
    
    [UIView animateWithDuration:0.4 animations:^{
        
        cellToMove.transform = CGAffineTransformMakeTranslation(0, 0);
        fromView.transform =CGAffineTransformMakeTranslation(fromView.frame.size.width, 0);
    } completion:^(BOOL finished) {
        
        //Be sure to replace all cells in a correct position
        if (![transitionContext transitionWasCancelled]) {
            cellToMove.transform = CGAffineTransformIdentity;
        }
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
}
@end
