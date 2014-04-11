//
//  ImageContent.m
//  AlimikApp
//
//  Created by Murgia Antonio on 25/01/14.
//  Copyright (c) 2014 Alimik. All rights reserved.
//

#import "ImageContent.h"

@interface ImageContent ()

@property (nonatomic, retain) UIImage *image;

@end

@implementation ImageContent

+(ImageContent*) imageContentFromString: (NSString*) imageName
{
  ImageContent *toRet = [ImageContent alloc];
  toRet.image = [UIImage imageNamed:imageName];
  return toRet;
}

- (UIView*) contentView {
  UIImageView *toRet = [[UIImageView alloc]initWithImage:self.image];
  return toRet;
}
@end
