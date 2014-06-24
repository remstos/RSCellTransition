//
//  CubeNavigationAnimator.h
//  MovieQuiz
//
//  Created by Andrés Brun on 27/10/13.
//  Copyright (c) 2013 Andrés Brun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CEReversibleAnimationController.h"
#import "THSpringyFlowLayout.h"
@interface RSCustomAnimationController : CEReversibleAnimationController
{
    float _lastAnchorY;
}
@property (nonatomic, assign) UICollectionViewCell *cell;
@property (nonatomic, assign) UICollectionView *collectionView;

@property (nonatomic, assign) UITableViewCell *tableCell;
@property (nonatomic, assign) UITableView *tableView;

@end
