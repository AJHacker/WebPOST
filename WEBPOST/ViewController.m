//
//  ViewController.m
//  WEBPOST
//
//  Created by Arihant Jain on 8/7/12.
//  Copyright (c) 2012 DMA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
-(IBAction)TextDoneEditing:(id)sender{
    [sender resignFirstResponder];
}
-(IBAction)PostAction:(id)sender{
    NSString *post = [NSString stringWithFormat:@"text=%@\n", [field text]];
    NSData *postdata = [post dataUsingEncoding: NSASCIIStringEncoding allowLossyConversion:NO];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postdata length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://pixelatedthoughts.com/Pixelatedthoughts/cppbs/DMA/iospost.php"] ];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"MyApp-V1.0" forHTTPHeaderField:@"User-Agent"];
    [request setHTTPBody:postdata];
    NSData *urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *response = [[NSString alloc] initWithData:urlData encoding:NSASCIIStringEncoding];
    [outputText setText:response];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
