//
//  trackInfo.m
//  Tableview Tutorial 3
//
//  Created by Gomis Florian on 10/22/13.
//  Copyright (c) 2013 Gomis Florian. All rights reserved.
//

#import "trackInfo.h"
@interface trackInfo ()
@property (strong, nonatomic) NSURL *urlPicture;
@end

@implementation trackInfo
@synthesize urlMp3 = _urlMp3;
@synthesize urlPicture = _urlPicture;
@synthesize titreMp3 = _titreMp3;
@synthesize dataMp3 = _dataMp3;
@synthesize dataPicture = _dataPicture;

-(id) initWithUrlImg:(NSString*)urlImg AndWith:(NSString*)titleSong{
    self = [super init];
    if (self)
    {
        _dataPicture = [[NSMutableData alloc] initWithCapacity:0];
        _dataMp3 = [[NSMutableData alloc] initWithCapacity:0];
        _urlPicture = [[NSURL alloc] initWithString:urlImg] ;
        _urlMp3 = [[NSURL alloc] initWithString:@"http://data.iplayer.fm/file/aph0wfo/2232444/147610076/Nicki_Minaj_feat._2_Chainz_-_Beez_In_The_Trap_Dirty_-_Beez_In_The_Trap_(iPlayer.fm).mp3"];
        _titreMp3 = titleSong;
    }
    return self;
}

-(void) downloadDataOfTack{
    NSURLRequest *theRequest = [NSURLRequest  requestWithURL:self.urlPicture
                                                 cachePolicy:NSURLRequestUseProtocolCachePolicy
                                             timeoutInterval:60.0];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    if (!connection){
        NSLog(@"Connexion to start download of one picture Failed !");
    }
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    //Eachtime we receive Data, we add bytes to our NSMutableArray. For this we check the url use in the connection and the url save in the NSMutableArray.
    // When they match, we just need to add the bytes to the pre existant Bytes.
    [self.dataPicture appendData:data];
}

// When one Picture is finish we use this methods in order to send a signal to our View
// So we can get the array with Data of picture.
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"imageDownloaded"
     object:self];
    // And then close connection
    connection = nil;
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"Connexion failed! %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLErrorKey]);
}

@end
