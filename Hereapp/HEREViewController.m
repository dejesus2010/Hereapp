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
    locationManager = [[CLLocationManager alloc] init];
    [locationManager setDesiredAccuracy:20];
    [locationManager setDistanceFilter:20];
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
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
            
            if(geoCoder == nil){
                NSLog(@"geoCoder == nil");
                geoCoder = [[CLGeocoder alloc] init];
            }
            
            CLLocation * location = [locationManager location];
            NSLog(@"%@", [location description]);
            
            [geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
                
                MFMessageComposeViewController * messageController = [[MFMessageComposeViewController alloc] init];
                [messageController setMessageComposeDelegate:self];
                [messageController setRecipients:[NSArray arrayWithObject:[phoneNumberTextField text]]];
                
                if([placemarks count] > 0){
                    
                    NSLog(@"placemark has %lu placemarks", (unsigned long)[placemarks count]);
                    
                    CLPlacemark * aPlacemark = [placemarks objectAtIndex:0];
                    
                    NSLog(@"name: %@", [aPlacemark name]);
                    
                    [messageController setBody: [aPlacemark name]];
                    
                    [self presentViewController:messageController animated:YES completion:nil];
                    NSLog(@"Senttt text");
                }
                else{
                    NSLog(@"No placemarks");
                }
            }];
            NSLog(@"Async call proof");
        }
        else{
            NSLog(@"You messed up");
        }
    }
    
    
    
}

-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    switch (result) {
        case MessageComposeResultSent:{
            NSLog(@"Sent message");
            break;
        }
        case MessageComposeResultCancelled:{
            NSLog(@"Cancelled");
            break;
        }
        case MessageComposeResultFailed:{
            NSLog(@"Failed");
            break;
        }
        default:{
            NSLog(@"Default");
            break;
        }
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
