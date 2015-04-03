//
//  ViewController.m
//  sending data test
//
//  Created by Jin on 2/9/15.
//  Copyright (c) 2015 Jin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize servoSlider;
@synthesize servoLabel;
@synthesize statusLabel;
@synthesize escLabel;
@synthesize escSlider;

NSString *host = @"169.254.1.1";
UInt16 port = 8080;

- (void)viewDidLoad {
    [super viewDidLoad];
    socket = [[AsyncSocket alloc] initWithDelegate:self];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port {
    NSLog(@"CONNECTED!");
}

- (void)onSocketDidDisconnect:(AsyncSocket *)sock {
    NSLog(@"DISCONNECTED!");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)connectButtonPressed:(id)sender {
    NSLog(@"Connecting...");
    [socket connectToHost:(NSString *)host onPort:(UInt16)port error:(NSError **)-1];

}

- (IBAction)disconnectButtonPressed:(id)sender {
    [socket disconnect];
}

- (IBAction)pingButtonPressed:(id)sender {
    [self sendMotorReference];
}

- (IBAction)servoSliding:(UISlider *)sender {
    
    [self sendMotorReference];
    
    if (self.servoSlider.value > 100) {self.servoLabel.text = [NSString stringWithFormat:@"%.0f", self.servoSlider.value];
    }
    else if(self.servoSlider.value < 10) {
        self.servoLabel.text = [NSString stringWithFormat:@"00%.0f", self.servoSlider.value];
    
    }
    else
        self.servoLabel.text = [NSString stringWithFormat:@"0%.0f", self.servoSlider.value];
}

- (IBAction)escSliding:(UISlider *)sender {
    [self sendMotorReference];
    
    if (self.escSlider.value > 100) {self.escLabel.text = [NSString stringWithFormat:@"%.0f", self.escSlider.value];
    }
    else if (self.escSlider.value < 10) {
        self.escLabel.text = [NSString stringWithFormat:@"00%.0f", self.escSlider.value];
    }
    else
        self.escLabel.text = [NSString stringWithFormat:@"0%.0f", self.escSlider.value];
    
}


-(void)sendMotorReference {
    
self.statusLabel.text = [NSString stringWithFormat:@"@%@%@#", self.servoLabel.text, self.escLabel.text];
    
// refString = self.servoLabel.text;
//    NSLog(@"@%@#", refString);
    
//refString1 = self.escLabel.text;
  //  NSLog(@"*%@#", refString1);
    
    refData = [refString dataUsingEncoding: NSUTF8StringEncoding];
    [socket writeData:refData withTimeout:-1 tag:1];
    sleep(0.05);
    
}

@end
