//
//  ImageContent.h
//  AlimikApp
//
//  Created by Murgia Antonio on 25/01/14.
//  Copyright (c) 2014 Alimik. All rights reserved.
//

#import "Content.h"

@interface ImageContent : Content

+(ImageContent*) imageContentFromString: (NSString*) imageName;
@end
