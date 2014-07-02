//
//  Denarri iOS App
//
//  Created by Andrew Ghobrial and Chris Meseha on 03/01/14.
//  Copyright (c) 2014 Denarri. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

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
    NSLog(@"The url dude is: '%@'", _itemURL);
    
//    _myWebView=[[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
//    _myWebView.delegate=self;
//    [self.view addSubview:_myWebView];
    
    self.myWebView.delegate = self;
    
    //////////
    NSURL *url = [NSURL URLWithString:_itemURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //4
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    //5
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         if ([data length] > 0 && error == nil) [self.myWebView loadRequest:request];
         else if (error != nil) NSLog(@"Error: %@", error);
     }];
    
    [self.myWebView setScalesPageToFit:YES];
    //////
    
    
    
    
    
    //[self.myWebView loadRequest:request];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
