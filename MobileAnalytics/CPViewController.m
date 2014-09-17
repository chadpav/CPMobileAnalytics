//
//  CPViewController.m
//  MobileAnalytics
//
//  Created by Chad Pavliska on 9/2/14.
//  Copyright (c) 2014 Chad Pavliska. All rights reserved.
//

#import "CPViewController.h"
#import <Analytics.h>

@interface CPViewController ()

@property(strong, nonatomic) IBOutlet UITextField *emailTextField;
@property(strong, nonatomic) IBOutlet UITextField *nameTextField;

@end

@implementation CPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)IdentifyUser:(id)sender
{
    NSLog(@"Identify User");

    if (self.emailTextField.text)
    {
        [[SEGAnalytics sharedAnalytics] identify:self.emailTextField.text
                                          traits:@{
                                                  @"name"  : self.nameTextField.text,
                                                  @"email" : self.emailTextField.text
                                          }];

        [self.emailTextField resignFirstResponder];
    }
}

- (IBAction)trackEventOne:(id)sender
{
    NSLog(@"opened music player");
    [[SEGAnalytics sharedAnalytics] track:@"opened music player"];
}

- (IBAction)trackEventTwo:(id)sender
{
    NSLog(@"played a song");

    [[SEGAnalytics sharedAnalytics] track:@"played song"
                               properties:@{
                                       @"artist" : @"Michael Bolton",
                                       @"track"  : @"When a man loves a woman"
                               }
    ];
}

- (IBAction)premiumIAP:(id)sender
{
    NSLog(@"Premium IAP");

    [[SEGAnalytics sharedAnalytics] track:@"In App Purchase" properties:@{
            @"revenue" : @2.99,
            @"plan"    : @"premium"
    }];
}

- (IBAction)resetAnalytics:(id)sender
{
    NSLog(@"reset analytics");

    self.emailTextField.text = @"";
    self.nameTextField.text = @"";
    [[SEGAnalytics sharedAnalytics] reset];
}

@end
