//
//  pictureDownloadOperation.m
//  WebMusicPlayer
//
//  Created by Gomis Florian on 11/5/13.
//  Copyright (c) 2013 Gomis Florian. All rights reserved.
//

#import "contentManager.h"
@interface contentManager()
@property (nonatomic) NSURL* urlJson;
@property (nonatomic) NSOperationQueue *Queue;
@property (nonatomic) downloadJsonOperation *jsonDownloadOperation;
@property (nonatomic) NSMutableArray *jsonArray;
@property (nonatomic) UITableView *newsTableView;
@end

@implementation contentManager
@synthesize urlJson = _urlJson;
@synthesize Queue = _Queue;
@synthesize jsonDownloadOperation = _jsonDownloadOperation;
@synthesize jsonArray = _jsonArray;
@synthesize arrayOfTracks = _arrayOfTracks;
@synthesize jsonReceived = _jsonReceived;
@synthesize imageReceived = _imageReceived;


+ (id)sharedManager{
    static contentManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] initWithUrl];
    });
    return sharedMyManager;
}

- (id)initWithUrl{
    if (self = [super init]) {
        _urlJson = [[NSURL alloc] initWithString:@"http://www.otpo.fr/Liste.json"];
        _jsonArray = [[NSMutableArray alloc] init];
         _arrayOfTracks = [[NSMutableArray alloc] init];
        _Queue = [[NSOperationQueue alloc] init];
        [[self Queue] setName:@"jsonOperation"];
        [[self Queue] setMaxConcurrentOperationCount:20];
        _jsonDownloadOperation = [[downloadJsonOperation alloc] initWithRequest:[[NSURLRequest alloc] initWithURL:[self urlJson]]];
        _newsTableView = [[UITableView alloc] init];
        _jsonReceived = NO;
        _imageReceived = NO;
    }
    return self;
}

-(void) downloadimageOfTrack:(NSMutableArray*)arrayOfTracks{
    self.arrayOfTracks = arrayOfTracks;
    // We check if Json is here juste in case
    if (self.jsonReceived)
    {
        for (int i = 0; i < [self.arrayOfTracks count]; i++) {
            downloadJsonOperation *dl = [[downloadJsonOperation alloc] initWithRequest:[[NSURLRequest alloc] initWithURL:[[self.arrayOfTracks objectAtIndex:i] urlPicture]]];
            [self.Queue addOperation:dl];
        }
    }
}


-(void) getBackPicture:(UIImage*)data urlTrack:(NSURLRequest*)urlTrack{
    for (int i = 0; i < [self.arrayOfTracks count]; i++) {
        if ([[[self.arrayOfTracks objectAtIndex:i] urlPicture]absoluteString]==[[urlTrack URL] absoluteString] ) {
            [[self.arrayOfTracks objectAtIndex:i] setUImage:data];
        }
    }
    self.imageReceived = YES;
}

-(void)downloadJsonWithUrl{
    [self.Queue addOperation:self.jsonDownloadOperation];
}


-(NSString*)getStringUrl{
    return [self.urlJson absoluteString];
}



@end
