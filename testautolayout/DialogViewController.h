//
//  OverlayViewController.h
//  testautolayout
//
//  Created by Kristof Van Landschoot on 25/02/14.
//  Copyright (c) 2014 Belgacom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DialogViewController : UIViewController

+ (DialogViewController *) dialogViewController;

@property (nonatomic,weak) IBOutlet UILabel *label;

@end
