//
//  pictureDownloadOperation.h
//  WebMusicPlayer
//
//  Created by Gomis Florian on 11/5/13.
//  Copyright (c) 2013 Gomis Florian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "downloadJsonOperation.h"
#import "trackInfo.h"

@interface contentManager : NSObject <NSURLConnectionDelegate>
@property (nonatomic, getter = getJsonReceived) BOOL jsonReceived;
@property (nonatomic, getter = getimageReceived) BOOL imageReceived;
@property (nonatomic, getter = getData) NSMutableData* dataJson;
@property (nonatomic, getter = getArrayOfTrack) NSMutableArray *arrayOfTracks;

+(id)sharedManager;
-(void)downloadJsonWithUrl;
-(void) downloadimageOfTrack:(NSMutableArray*)arrayOfTracks;
-(NSString*)getStringUrl;
-(void)transformJsonDataToObject:(NSData*)json;
-(void) getBackPicture:(UIImage*)data urlTrack:(NSURLRequest*)urlTrack;

@end
