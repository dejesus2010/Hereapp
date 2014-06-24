//
//  HEREViewController.h
//  Hereapp
//
//  Created by Ryan Dejesus on 6/22/14.
//  Copyright (c) 2014 Ryan Dejesus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface HEREViewController : UIViewController <MFMessageComposeViewControllerDelegate,UITextFieldDelegate>{
    
    IBOutlet UITextField *phoneNumberTextField;
}
- (IBAction)imHereButtonPress:(id)sender;

@end
