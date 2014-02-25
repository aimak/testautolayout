//
//  ViewController.m
//  testautolayout
//
//  Created by Kristof Van Landschoot on 24/02/14.
//  Copyright (c) 2014 Belgacom. All rights reserved.
//

#import "ViewController.h"
#import "DialogViewController.h"
#import "UIView+AutoLayout.h"

@interface ViewController ()
@property (nonatomic,strong) UIWindow *overlayWindow;
@end

@implementation ViewController

- (void)viewDidLoad
{
	
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) showOverlay: (id) sender
{
	UIViewController *fullScreenViewController = [[UIViewController alloc]init];
	fullScreenViewController.view.backgroundColor = [UIColor yellowColor];

	_overlayWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
	_overlayWindow.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.7];
	_overlayWindow.rootViewController = fullScreenViewController;
	_overlayWindow.windowLevel = UIWindowLevelAlert;
	[_overlayWindow makeKeyAndVisible];

	UIViewController *dialogViewController = [DialogViewController dialogViewController];
	[fullScreenViewController.view addSubview: dialogViewController.view];
	[fullScreenViewController addChildViewController: dialogViewController];
	[dialogViewController didMoveToParentViewController:fullScreenViewController];
	
	fullScreenViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
	[fullScreenViewController.view addConstraints: [dialogViewController.view autoCenterInSuperview]];
	[fullScreenViewController.view addConstraint: [dialogViewController.view autoPinEdgeToSuperviewEdge:ALEdgeTop
																							  withInset:10
																							   relation:NSLayoutRelationGreaterThanOrEqual]];
	[fullScreenViewController.view addConstraint: [dialogViewController.view autoPinEdgeToSuperviewEdge:ALEdgeLeft
																							  withInset:10
																							   relation:NSLayoutRelationGreaterThanOrEqual]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
