//
//  ViewController.m
//  WatchTestApp
//
//  Created by Somogyi András on 05/01/16.
//  Copyright © 2016 Somogyi András. All rights reserved.
//

#import "ViewController.h"
#import <WatchConnectivity/WatchConnectivity.h>

@interface ViewController () <WCSessionDelegate>
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@end

@implementation ViewController

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([WCSession isSupported]) {
        WCSession *session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
        if ([session isReachable]) {
            //
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - WCSession delegate methods
-(void)session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *,id> *)message replyHandler:(void (^)(NSDictionary<NSString *,id> * _Nonnull))replyHandler {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.messageLabel.hidden = NO;
        self.messageLabel.text = message[@"Message"];
    });
    NSLog(@"%@",message);
}

@end
