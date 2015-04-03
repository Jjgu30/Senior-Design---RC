//
//  ViewController.h
//  sending data test
//
//  Created by Jin on 2/9/15.
//  Copyright (c) 2015 Jin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncSocket.h"

@interface ViewController : UIViewController {
    AsyncSocket *socket;
    float ref;
    NSString *refString;
    NSString *refString1;
    NSData * refData;
    NSData *refServo;
    NSData *refESC;
    NSData *combined;
}

@property (strong, nonatomic) IBOutlet UIButton *connectButton;
@property (strong, nonatomic) IBOutlet UIButton *disconnectButton;
@property (strong, nonatomic) IBOutlet UIButton *pingButton;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) IBOutlet UISlider *servoSlider;
@property (strong, nonatomic) IBOutlet UILabel *servoLabel;
@property (strong, nonatomic) IBOutlet UILabel *escLabel;
@property (strong, nonatomic) IBOutlet UISlider *escSlider;

- (IBAction)connectButtonPressed:(id)sender;
- (IBAction)disconnectButtonPressed:(id)sender;
- (IBAction)pingButtonPressed:(id)sender;
- (IBAction)servoSliding:(id)sender;
- (IBAction)escSliding:(id)sender;



@end

