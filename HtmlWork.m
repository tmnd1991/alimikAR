//
//  HtmlWork.m
//  AlimikApp
//
//  Created by Murgia Antonio on 20/03/14.
//  Copyright (c) 2014 Alimik. All rights reserved.
//

#import "HtmlWork.h"

@implementation HtmlWork

+(HtmlWork*) htmlWorkWithTitle:(NSString*)title subtitle:(NSString*)subtitle andContent:(NSString*)content
{
  HtmlWork* toRet = [HtmlWork alloc];
  toRet.title = (title==nil) ? @"" : title;
  toRet.subtitle = (subtitle==nil) ? @"" : subtitle;
  toRet.ipadContentUrl = [[NSBundle mainBundle] URLForResource:[content stringByAppendingString:@"-ipad"] withExtension:@"html"];
  toRet.iphoneContentUrl =[[NSBundle mainBundle] URLForResource:[content stringByAppendingString:@"-iphone"] withExtension:@"html"];
  return toRet;
}
@end
