//
//  ViewController.h
//  sending data test
//
//  Created by Prasanth on 2/9/15.
//  Copyright (c) 2015 Prasanth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncSocket.h"

@interface ViewController : UIViewController {
    AsyncSocket *socket;
    float ref;
    NSString *refString;
    NSData * refData;
    NSData *refServo;
}

@property (strong, nonatomic) IBOutlet UIButton *connectButton;
@property (strong, nonatomic) IBOutlet UIButton *disconnectButton;
@property (strong, nonatomic) IBOutlet UIButton *pingButton;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) IBOutlet UISlider *servoSlider;
@property (strong, nonatomic) IBOutlet UILabel *servoLabel;

- (IBAction)connectButtonPressed:(id)sender;
- (IBAction)disconnectButtonPressed:(id)sender;
- (IBAction)pingButtonPressed:(id)sender;
- (IBAction)servoSliding:(id)sender;



@end

