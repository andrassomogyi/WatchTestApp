//
//  ModalInterfaceController.m
//  WatchTestApp
//
//  Created by Somogyi András on 06/01/16.
//  Copyright © 2016 Somogyi András. All rights reserved.
//

#import "ModalInterfaceController.h"

@interface ModalInterfaceController ()

@end

@implementation ModalInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    if ([context isKindOfClass:[NSString class]]) {
        
        if ([context isEqualToString:@"Alice"]) {
            [self.modalLabel setText:@"She is ten feet tall."];
        }
        
        if ([context isEqualToString:@"White Knight"]) {
            [self.modalLabel setText:@"He is talking backwards."];
        }
        
        if ([context isEqualToString:@"Red Queen"]) {
            [self.modalLabel setText:@"Her head is off."];
        }
    }
}


- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



