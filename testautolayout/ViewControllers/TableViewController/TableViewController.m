//
//  TableViewController.m
//  testautolayout
//
//  Created by Paul Renson on 06/03/14.
//  Copyright (c) 2014 Belgacom. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation TableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.descriptionLabel.text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in posuere felis. Maecenas non varius libero, vel accumsan arcu. Maecenas commodo tempor lacus, a pellentesque lorem accumsan sed. Nunc rutrum et nulla vitae varius. Phasellus ullamcorper felis vel adipiscing lacinia. In nisi sem, porta sed lobortis dapibus, malesuada ut nulla.";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - actions

- (IBAction)quit:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
