//
//  Content.m
//  AlimikApp
//
//  Created by Murgia Antonio on 25/01/14.
//  Copyright (c) 2014 Alimik. All rights reserved.
//

#import "Content.h"

@implementation Content

- (UIView*) contentView {
  [NSException raise:@"Invoked abstract method" format:@"Invoked abstract method"];
  return nil;
}
@end
