//
//  HEREViewController.m
//  Hereapp
//
//  Created by Ryan Dejesus on 6/22/14.
//  Copyright (c) 2014 Ryan Dejesus. All rights reserved.
//

#import "HEREViewController.h"

@interface HEREViewController ()

@end

@implementation HEREViewController

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

- (void)sendTextMessage{
    NSString * phoneNumber = [phoneNumberTextField text];
    if( [phoneNumber  isEqual: @""] ){
        NSLog(@"Error");
    }
    else{
        NSLog(@"No error");
    }
    
    if([MFMessageComposeViewController canSendText]){
        MFMessageComposeViewController * messageController = [[MFMessageComposeViewController alloc] init];
        [messageController setMessageComposeDelegate:self];
        [messageController setRecipients:[NSArray arrayWithObject:@"7277431594"]];
        [messageController setBody:@"I'm Here!\n This message was sent from my app... Did it work?"];
        NSLog(@"Sent text");
    }
    else{
        NSLog(@"You fucked up");
    }
    
}

-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    switch (result) {
        case MessageComposeResultSent:
            NSLog(@"Sent");
            break;
        case MessageComposeResultCancelled:
            NSLog(@"Cancelled");
            break;
        case MessageComposeResultFailed:
            NSLog(@"Failed");
            break;
            
        default:
            break;
    }
}


- (IBAction)imHereButtonPress:(id)sender {
    [phoneNumberTextField resignFirstResponder];
    [self sendTextMessage];
}


@end
