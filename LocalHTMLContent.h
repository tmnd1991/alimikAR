//
//  LocalHTMLContent.h
//  AlimikApp
//
//  Created by Murgia Antonio on 25/01/14.
//  Copyright (c) 2014 Alimik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Content.h"

@interface LocalHTMLContent : Content

+(LocalHTMLContent*) localHtmlContentFromString: (NSString*) htmlFileName;
@end
