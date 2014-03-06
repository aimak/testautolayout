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
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *tableHeaderWrapperView;
@property (strong, nonatomic) IBOutlet UILabel *paulLabel;

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
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.descriptionLabel.text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in posuere felis. Maecenas non varius libero, vel accumsan arcu. Maecenas commodo tempor lacus, a pellentesque lorem accumsan sed. Nunc rutrum et nulla vitae varius. Phasellus ullamcorper felis vel adipiscing lacinia. In nisi sem, porta sed lobortis dapibus, malesuada ut nulla.";
    
    self.paulLabel.text = @"I'm Paul and this text should be at least two lines long. That being said, it could be more.";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    [self updateTableViewHeaderViewHeight];
}

/**
 tableView's tableViewHeaderView contains wrapper view, which height is evaluated
 with Auto Layout. Here I use evaluated height and update tableView's tableViewHeaderView's frame.
 
 New height for tableViewHeaderView doesn't applies without magic, that's why I call -resetTableViewHeaderView.
 And again, this doesn't work due to some internals of UITableView, so -resetTableViewHeaderView call is scheduled
 in the main run loop just after it's the last iteration finishes.
 */
- (void)updateTableViewHeaderViewHeight
{
    // get height of the wrapper and apply it to a header
    CGRect Frame = self.tableView.tableHeaderView.frame;
    Frame.size.height = self.tableHeaderWrapperView.frame.size.height;
    self.tableView.tableHeaderView.frame = Frame;
    
    // this magic applies the above changes
    // note, that if you won't schedule this call to the next run loop iteration
    // you'll get and error
    [self performSelector:@selector(resetTableViewHeaderView) withObject:self afterDelay:0];
}

// yeah, gues there's something special in the setter
- (void)resetTableViewHeaderView
{
    // whew, this could be animated!
    
    self.tableView.tableHeaderView = self.tableView.tableHeaderView;
    
    
}

#pragma mark - actions

- (IBAction)quit:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * c = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    return c;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

@end
