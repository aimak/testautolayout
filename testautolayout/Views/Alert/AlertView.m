//
//  AlertView.m
//  testautolayout
//
//  Created by Paul Renson on 03/03/14.
//  Copyright (c) 2014 Belgacom. All rights reserved.
//

#import "AlertView.h"

@interface AlertView()
@property (strong, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation AlertView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSArray *nib = [[NSBundle mainBundle]
                        loadNibNamed:@"AlertView"
                        owner:self
                        options:nil];
        self = [nib objectAtIndex:0];
        
        self.layer.masksToBounds = YES;
		self.layer.cornerRadius = 5.0;
    }
    return self;
}

#pragma mark - show

+ (void) showInView:(UIView *)superview {
    AlertView * alertView = [[AlertView alloc] init];
    [alertView showInSuperview:superview];
}

- (void) showInSuperview:(UIView*) superview {
    
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [superview addSubview:self];
    
    CGRect f = self.frame;
    f.origin = CGPointMake((superview.frame.size.width - self.frame.size.width) / 2, 60);
    self.frame = f;
}

#pragma mark - actions
- (IBAction)dismiss:(id)sender {
    [UIView animateWithDuration:0.3f
                     animations:^(void) {
                         self.alpha = 0.0f;
                     }
                     completion:^(BOOL finished) {
                         [self removeFromSuperview];
                     }
     ];
    
}

@end
