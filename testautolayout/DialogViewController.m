//
//  OverlayViewController.m
//  testautolayout
//
//  Created by Kristof Van Landschoot on 25/02/14.
//  Copyright (c) 2014 Belgacom. All rights reserved.
//

#import "DialogViewController.h"
#import "UIView+AutoLayout.h"

@interface DialogViewController ()

@end

@implementation DialogViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

+ (DialogViewController *) dialogViewController
{
	return [[self alloc]initWithNibName:nil bundle:nil];
}

- (void)viewDidLoad
{
	self.label.text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eget turpis turpis, vitae varius elit. Suspendisse potenti. Maecenas auctor venenatis odio quis ullamcorper. Aliquam erat volutpat. Praesent nulla ipsum, tempor eu tempus vitae, lobortis consectetur mi. Lorem ipsum dolor sit amet.";
	self.view.backgroundColor = [UIColor redColor];
	self.view.translatesAutoresizingMaskIntoConstraints = NO;
//	[self.view addConstraint: [self.view autoSetDimension:ALDimensionWidth toSize:150]];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
