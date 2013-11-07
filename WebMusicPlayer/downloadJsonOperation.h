//
//  downloadJsonOperation.h
//  WebMusicPlayer
//
//  Created by Gomis Florian on 11/6/13.
//  Copyright (c) 2013 Gomis Florian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface downloadJsonOperation : NSOperation <NSURLConnectionDelegate>
@property (strong, nonatomic, readonly) NSURLRequest *request;
@property (nonatomic, getter = getArrayOfTrack) NSMutableArray *arrayOfTracks;

- (id)initWithRequest:(NSURLRequest *)request;
@end


