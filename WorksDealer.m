//
//  WorksDealer.m
//  masterDetailApp
//
//  Created by Murgia Antonio on 13/02/14.
//  Copyright (c) 2014 Alimik. All rights reserved.
//

#import "WorksDealer.h"
#import "Work.h"
#import "HtmlWork.h"
#import "VideoWork.h"

@implementation WorksDealer
static NSMutableArray* works = nil;

+ (NSArray*) getWorks
{
  if (works==nil)
  {
    works = [NSMutableArray array];
    Work *work = [VideoWork videoWorkWithTitle:@"3D Animation" subtitle:@"Animation Presentation" andContent:@"animazione"];
    [works addObject:work];

    work = [VideoWork videoWorkWithTitle:@"3D for the Industries" subtitle:@"Industries Presentation" andContent:@"industriali"];
    [works addObject:work];

    work = [HtmlWork htmlWorkWithTitle:@"3D for Architecture" subtitle:@"Architecture Presentation" andContent:@"architettura"];
    [works addObject:work];

    work = [HtmlWork htmlWorkWithTitle:@"AR Apps" subtitle:@"Mobile Apps Presentation" andContent:@"apps"];
    [works addObject:work];
  }
  return works;
}

@end
