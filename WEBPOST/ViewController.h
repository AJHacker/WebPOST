//
//  ViewController.h
//  WEBPOST
//
//  Created by Arihant Jain on 8/7/12.
//  Copyright (c) 2012 DMA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UITextView *outputText;
     IBOutlet UITextField *field;
     IBOutlet UIButton *b;
    }
-(IBAction)PostAction:(id) sender;
-(IBAction)TextDoneEditing:(id) sender;


@end
