//
//  ViewController.m
//  sending data test
//
//  Created by Prasanth on 2/9/15.
//  Copyright (c) 2015 Prasanth. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize servoSlider;
@synthesize servoLabel;

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
    self.servoLabel.text = [NSString stringWithFormat:@"@%.0f#", self.servoSlider.value];
    
    if (self.servoSlider.value > 100) {
        sleep(0.005);
        [self sendMotorReference];
    }
    else if(self.servoSlider.value < 10) {
        sleep(0.005);
        self.servoLabel.text = [NSString stringWithFormat:@"@00%.0f#", self.servoSlider.value];
        [self sendMotorReference];
    }
    else
        self.servoLabel.text = [NSString stringWithFormat:@"@0%.0f#", self.servoSlider.value];
    sleep(0.005);
    [self sendMotorReference];
}

-(void)sendMotorReference {
    refString = self.servoLabel.text;
    NSLog(@"%@", refString);
    
    refData = [refString dataUsingEncoding: NSUTF8StringEncoding];
    [socket writeData:refData withTimeout:-1 tag:1];
    
}

@end
