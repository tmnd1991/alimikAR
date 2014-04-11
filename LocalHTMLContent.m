//
//  LocalHTMLContent.m
//  AlimikApp
//
//  Created by Murgia Antonio on 25/01/14.
//  Copyright (c) 2014 Alimik. All rights reserved.
//

#import "LocalHTMLContent.h"
@interface LocalHTMLContent ()

@property (nonatomic, retain) NSString *htmlFileName;

@end

@implementation LocalHTMLContent

+(LocalHTMLContent*) localHtmlContentFromString: (NSString*) htmlFileName
{
  LocalHTMLContent *toRet = [LocalHTMLContent alloc];
  toRet.htmlFileName = htmlFileName;
  return toRet;
}

- (UIView*) contentView {
  UIWebView *toRet = [[UIWebView alloc]init];
  //
  // Carica il file HTML
  //
  return toRet;
}

@end
