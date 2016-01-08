//
//  Page3InterfaceController.m
//  WatchTestApp
//
//  Created by Somogyi András on 06/01/16.
//  Copyright © 2016 Somogyi András. All rights reserved.
//

#import "Page3InterfaceController.h"
#import <WatchConnectivity/WatchConnectivity.h>

@interface Page3InterfaceController () <WCSessionDelegate>

@property(assign,nonatomic) NSInteger tapped;

@end

@implementation Page3InterfaceController

#pragma mark - Lifecycle
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    self.tapped = 0;
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

#pragma mark - Actions
- (IBAction)sendMessageAction {
    self.tapped++;
    
    if ([WCSession isSupported]) {
        WCSession *session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
        if ([session isReachable]) {
            NSDictionary *messsageDictionary = @{@"Message" : [NSString stringWithFormat:@"This messasge was sent from your Watch %lu",(long)self.tapped]};
            [session sendMessage:messsageDictionary
                    replyHandler:^(NSDictionary<NSString *,id> * _Nonnull replyMessage) {
                        NSString *result = [replyMessage[@"resultCount"] stringValue];
                        NSLog(@"%@",result);
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [self.resultLabel setText:result];
                        });
                    } errorHandler:^(NSError * _Nonnull error) {
                    }];
        }
    }
}

@end



