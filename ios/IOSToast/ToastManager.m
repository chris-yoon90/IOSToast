//
//  ToastManager.m
//  GluwaWallet
//
//  Created by Chris Yoon on 2017-05-05.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToastManager.h"
#import <React/RCTLog.h>

@implementation ToastManager

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(makeToast:(NSString *)message)
{
  RCTLogInfo(@"Message is: %@", message);
  UIViewController *presentingViewController = [self getTopMostViewController];
  UIView *v = [presentingViewController view];
  [v makeToast:message];
}

- (UIViewController*) getTopMostViewController {
  UIViewController *presentingViewController = [[[UIApplication sharedApplication] delegate] window].rootViewController;
  while (presentingViewController.presentedViewController != nil) {
    presentingViewController = presentingViewController.presentedViewController;
  }
  return presentingViewController;
}

@end
