//
//  HtmlWork.h
//  AlimikApp
//
//  Created by Murgia Antonio on 20/03/14.
//  Copyright (c) 2014 Alimik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Work.h"

@interface HtmlWork : Work
+(HtmlWork*) htmlWorkWithTitle:(NSString*)title subtitle:(NSString*)subtitle andContent:(NSString*)content;
@end
