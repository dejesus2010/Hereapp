//
//  HEREViewController.h
//  Hereapp
//
//  Created by Ryan Dejesus on 6/22/14.
//  Copyright (c) 2014 Ryan Dejesus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <CoreLocation/CoreLocation.h>

@interface HEREViewController : UIViewController <MFMessageComposeViewControllerDelegate,UITextFieldDelegate, MFMessageComposeViewControllerDelegate, CLLocationManagerDelegate>{
    
    IBOutlet UITextField *phoneNumberTextField;
    CLLocationManager * locationManager;
    CLGeocoder * geoCoder;
}
- (IBAction)imHereButtonPress:(id)sender;


@end
