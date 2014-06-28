//
//  HEREViewController.m
//  Hereapp
//
//  Created by Ryan Dejesus on 6/22/14.
//  Copyright (c) 2014 Ryan Dejesus. All rights reserved.
//

#import "HEREViewController.h"

@interface HEREViewController ()
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeLeftRecognizer;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeRightRecognizer;


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
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid input"
                                                  message:@"Enter the number you would like to send your location to"
                                                  delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        [alert show];
    }
    else{
        if([MFMessageComposeViewController canSendText]){
            MFMessageComposeViewController * messageController = [[MFMessageComposeViewController alloc] init];
            [messageController setMessageComposeDelegate:self];
            [messageController setRecipients:[NSArray arrayWithObject:[phoneNumberTextField text]]];
            [messageController setBody:@"I'm Here!\nThis message was sent from my app... You too will be able to send your location!"];
            [self presentViewController:messageController animated:YES completion:nil];
            NSLog(@"Sent text");
        }
        else{
            NSLog(@"You messed up");
        }
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
            NSLog(@"Default");
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    [phoneNumberTextField setText:@""];

}


- (IBAction)imHereButtonPress:(id)sender {
    [phoneNumberTextField resignFirstResponder];
    NSLog(@"resignedFirstResponder");
    [self sendTextMessage];
}

- (IBAction)something:(id)sender {
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)hideKeyBoard{
    [phoneNumberTextField resignFirstResponder];
}

- (IBAction)showSwipLeft:(UISwipeGestureRecognizer *)recognizer {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                    message:@"You just swiped left"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (IBAction)showSwipeRight:(UISwipeGestureRecognizer*)recognizer{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                    message:@"You just swiped right"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (IBAction)mainViewTap:(UITapGestureRecognizer *)recognizer{
    NSLog(@"mainViewTap:");
    if([phoneNumberTextField isFirstResponder]){
        [self hideKeyBoard];
        NSLog(@"Hide keyboard");
    }
}

@end
