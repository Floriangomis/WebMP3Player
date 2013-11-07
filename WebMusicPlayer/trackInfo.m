//
//  trackInfo.m
//  Tableview Tutorial 3
//
//  Created by Gomis Florian on 10/22/13.
//  Copyright (c) 2013 Gomis Florian. All rights reserved.
//

#import "trackInfo.h"
@interface trackInfo ()
@end

@implementation trackInfo
@synthesize urlMp3 = _urlMp3;
@synthesize urlPicture = _urlPicture;
@synthesize titreMp3 = _titreMp3;
@synthesize dataMp3 = _dataMp3;
@synthesize dataPicture = _dataPicture;
@synthesize idTrack = _idTrack;
@synthesize uImage = _uImage;

-(id) initWithUrlImg:(NSString*)urlImg AndWith:(NSString*)titleSong idTrack:(NSInteger)idSong{
    self = [super init];
    if (self)
    {
        _dataPicture = [[NSMutableData alloc] initWithCapacity:0];
        _dataMp3 = [[NSMutableData alloc] initWithCapacity:0];
        _urlPicture = [[NSURL alloc] initWithString:urlImg];
        _idTrack = idSong;
        _urlMp3 = [[NSURL alloc] initWithString:@"http://data.iplayer.fm/file/aph0wfo/2232444/147610076/Nicki_Minaj_feat._2_Chainz_-_Beez_In_The_Trap_Dirty_-_Beez_In_The_Trap_(iPlayer.fm).mp3"];
        _titreMp3 = titleSong;
        _uImage = [[UIImage alloc] init];
    }
    return self;
}


@end
