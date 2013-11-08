//
//  downloadJsonOperation.m
//  WebMusicPlayer
//
//  Created by Gomis Florian on 11/6/13.
//  Copyright (c) 2013 Gomis Florian. All rights reserved.
//

#import "downloadJsonOperation.h"

@interface downloadJsonOperation()
// Connection
@property (strong, nonatomic) NSURLConnection *connection;
// Datas related attr.
@property (strong, nonatomic) NSMutableData *receivedData;
@property (assign, nonatomic) long long expectedContentLength;
// NSOperation redefinition
@property (assign, nonatomic, getter = isExecuting) BOOL executing;
@property (assign, nonatomic, getter = isFinished) BOOL finished;
@end


#pragma mark

@implementation downloadJsonOperation

@synthesize request = _request;
@synthesize connection = _connection;
@synthesize receivedData = _receivedData;
@synthesize arrayOfTracks = _arrayOfTracks;

#pragma mark - Lifecycle

- (id)initWithRequest:(NSURLRequest *)request{
    if(!(self = [super init]))
        return self;
    
    // Checking for required parameter
    if(!request)
    {
        NSLog(@"%@", @"You must pass a NSURLRequest to create the operation object.");
        return self;
    }
    
    // Attributes init.
    _request = request;
    _receivedData = nil;
    _connection = nil;
    _expectedContentLength = 0;
    _executing = false;
    _finished = false;
    _arrayOfTracks = [[NSMutableArray alloc] init];
    
    return self;
}

- (void)reset
{
    _expectedContentLength = 0;
    _receivedData = nil;
    _request = nil;
    _connection = nil;
}

#pragma mark - NSOperation behaviors

- (void)main
{
    if(self.executing)
        return;
    self.executing = true;
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:self.request
                                                                  delegate:self
                                                          startImmediately:NO];
    [self setConnection:connection];
    [self.connection start];
    
    if(self.connection)
    {
        CFRunLoopRun();
        if(![self isFinished])
        {
            [self.connection cancel];
        }
    }
    else
    {
        [self cancel];
    }
}

- (void)cancel
{
    if(self.connection)
    {
        [self.connection cancel];
        self.executing = false;
        self.finished = true;
    }
    [self reset];
}

- (BOOL)isConcurrent
{
    return true;
}

#pragma mark - NSURLConnection Delegate Methods

// Download started.
// - Will call back the Complete Block if Error detected and Block setted at instanciation.
// - Operation will be cancelled.
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    if(![response respondsToSelector:@selector(statusCode)] || ((NSHTTPURLResponse *)response).statusCode < 400)
    {
        self.expectedContentLength = response.expectedContentLength;
        NSMutableData *datas_container = [[NSMutableData alloc] initWithCapacity:(NSUInteger)self.expectedContentLength];
        [self setReceivedData:datas_container];
    }
    else
    {
        [self cancel];
    }
}

// Downloading.
// Retrieved streaming and appended to instance variable.
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //NSLog(@"Receive %lu Bytes", (unsigned long)[data length]);
    if(self.receivedData)
        [self.receivedData appendData:data];
}

// Download failed.
// - Will call back the complete Block with NSError object, if setted at instanciation.
// - Operation will be reseted and released by parent Operation Queue.
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    // Stopping loop
    CFRunLoopStop(CFRunLoopGetCurrent());
    
    // Reseting
    self.finished = true;
    self.executing = false;
    [self reset];
}

// Download finished.
// - Will call back the Complete Block with UIImage object if setted at instanciation.
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Stopping loop
    CFRunLoopStop(CFRunLoopGetCurrent());
    
    // Si le json n'a pas encore été DL on le dl
    if (![[contentManager sharedManager] getJsonReceived])
    {
    NSMutableData* dataJson = [self receivedData];
    if(NSClassFromString(@"NSJSONSerialization")){
        NSError *error = nil;
        NSMutableArray* jsonArray  = [NSJSONSerialization
                           JSONObjectWithData:dataJson
                           options:0
                           error:&error];
        if(error){
            NSLog(@"Json Malformed : %@", error);
            EXIT_FAILURE;
        }
        for (int i = 0; i < [jsonArray  count]; i++) {
            NSString *urlImage = [jsonArray[i] valueForKey:@"url_img"];
            NSInteger idTrack = [[jsonArray[i] valueForKey:@"id_new"] integerValue];
            [self.arrayOfTracks addObject: [[trackInfo alloc] initWithUrlImg:[NSString stringWithFormat:@"http://www.otpo.fr/uploads/%@",urlImage] AndWith:[jsonArray[i] valueForKey:@"titre_new"] idTrack:idTrack urlMp3:[jsonArray[i] valueForKey:@"url_mp3"]]];
        }
    }
        [[contentManager sharedManager] setJsonReceived:TRUE];
        [[contentManager sharedManager] downloadimageOfTrack:self.arrayOfTracks];
    // Sinon On est deja passé au images
    }
    else{
        // We initialize UImage then we send it back to ContentManager on MainThread
        UIImage *image = [[UIImage alloc] initWithData:self.receivedData];
        [[contentManager sharedManager] getBackPicture:image urlTrack:self.request];
    }

    // Reseting
    self.finished = true;
    self.executing = false;
    [self reset];
}
@end

