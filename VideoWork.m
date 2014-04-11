//
//  VideoWork.m
//  AlimikApp
//
//  Created by Murgia Antonio on 20/03/14.
//  Copyright (c) 2014 Alimik. All rights reserved.
//

#import "VideoWork.h"

@implementation VideoWork

+(VideoWork*) videoWorkWithTitle:(NSString*)title subtitle:(NSString*)subtitle andContent:(NSString*)content
{
  VideoWork* toRet = [VideoWork alloc];
  toRet.title = (title==nil) ? @"" : title;
  toRet.subtitle = (subtitle==nil) ? @"" : subtitle;
  toRet.ipadContentUrl = [[NSBundle mainBundle]URLForResource:content withExtension:@"mp4"];
  toRet.iphoneContentUrl = toRet.ipadContentUrl;

  //NSString *videoHtml = [NSString stringWithFormat:@"<meta name=\"viewport\" content=\"width=device-width, maximum-scale=0.8, minimum-scale=0.8, initial-scale=1\" /><center><video  width=\"640\" height=\"480\" controls><source src=\"%@.%@\" media=\"all and (max-width:1024px)\"></video></center>",content,@"mp4"];
  
  //NSString *videoIphoneHtml = [NSString stringWithFormat:@"<meta name=\"viewport\" content=\"width=device-width, maximum-scale=0.8, minimum-scale=0.8, initial-scale=1\" /><center><video  width=\"320\" height=\"240\" controls><source src=\"%@.%@\" media=\"all and (max-width:1024px)\"></video></center>",content,@"mp4"];
  return toRet;
}


@end