//
//  DetailViewController.h
//  RSCellTransitionDemo
//
//  Created by Remi Santos on 24/06/2014.
//  Copyright (c) 2014 Remi Santos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

