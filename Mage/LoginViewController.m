//
//  LoginViewController.m
//  MAGE
//
//  Created by William Newman on 11/4/15.
//  Copyright © 2015 National Geospatial Intelligence Agency. All rights reserved.
//

#import "LoginViewController.h"
#import "MageServer.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UILabel *versionLabel;
@property (weak, nonatomic) IBOutlet UIButton *serverURL;
@end

@implementation LoginViewController

- (void)viewWillAppear:(BOOL)animated {
    
    NSString *versionString = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSString *buildString = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    [self.versionLabel setText:[NSString stringWithFormat:@"v%@ b%@", versionString, buildString]];
    
    NSURL *url = [MageServer baseURL];
    if ([url absoluteString].length == 0) {
         [self performSegueWithIdentifier:@"setSeverURLSegue" sender:self];
    } else {
        [self.serverURL setTitle:[url absoluteString] forState:UIControlStateNormal];
    }
}
@end
