//
//  ModalInterfaceControllerAccessedBySegue.m
//  WatchTestApp
//
//  Created by Somogyi András on 07/01/16.
//  Copyright © 2016 Somogyi András. All rights reserved.
//

#import "ModalInterfaceControllerAccessedBySegue.h"

@interface ModalInterfaceControllerAccessedBySegue ()

@end

@implementation ModalInterfaceControllerAccessedBySegue

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    [self.contextLabel setText:context];
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



