//
//  homeControllerPlayer.m
//  WebMusicPlayer
//
//  Created by Gomis Florian on 11/7/13.
//  Copyright (c) 2013 Gomis Florian. All rights reserved.
//

#import "homeControllerPlayer.h"

@interface homeControllerPlayer ()
@end

@implementation homeControllerPlayer
@synthesize imageDetail = _imageDetail;
@synthesize titreDetail = _titreDetail;
@synthesize titreDetailString = _titreDetailString;
@synthesize imageDetailUimage = _imageDetailUimage;
@synthesize audioPlayer = _audioPlayer;
@synthesize urlSong = _urlSong;
@synthesize sliderOutlet = _sliderOutlet;
@synthesize durationOutlet = _durationOutlet;
@synthesize currentItem = _currentItem;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])){
        _imageDetail = [[UIImageView alloc] init];
        _titreDetailString = @"DefaultTitleDetail";
        _titreDetail = [[UILabel alloc] init];
        _imageDetailUimage = [[UIImage alloc] init];
        _audioPlayer = [[AVPlayer alloc] init];
        _sliderOutlet = [[UISlider alloc] init];
        _durationOutlet = [[UILabel alloc] init];
        _currentItem = [[AVPlayerItem alloc] init];
        _urlSong = @"DefaultUrl";
        _audioPlayer = [[AVPlayer alloc]init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.imageDetail setImage:self.imageDetailUimage];
    self.titreDetail.text = self.titreDetailString;
    
    [self configurePlayer];
    
    // son qu'on va jouer
    self.currentItem = [AVPlayerItem playerItemWithURL:[[NSURL alloc] initWithString:self.urlSong]];
    [self.audioPlayer replaceCurrentItemWithPlayerItem:self.currentItem];
    [self.sliderOutlet setMaximumValue:self.audioPlayer.currentItem.duration.value/self.audioPlayer.currentItem.duration.timescale];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)togglePlayPause:(id)sender {
    if(self.togglePlayPause.selected) {
        [self.audioPlayer pause];
        [self.togglePlayPause setSelected:NO];
    } else {
        [self.audioPlayer play];
        [self.togglePlayPause setSelected:YES];
    }
}
- (IBAction)slidderDragged:(id)sender {
    [self.audioPlayer seekToTime:CMTimeMakeWithSeconds((int)(self.sliderOutlet.value) , 1)];
}

-(void) configurePlayer {
    __block homeControllerPlayer * weakSelf = self;
    [self.audioPlayer addPeriodicTimeObserverForInterval:CMTimeMakeWithSeconds(1, 1)
                                                   queue:NULL
                                              usingBlock:^(CMTime time) {
                                                  if(!time.value) {
                                                      return;
                                                  }
                                                  
                                                  int currentTime = (int)((weakSelf.audioPlayer.currentTime.value)/weakSelf.audioPlayer.currentTime.timescale);
                                                  int currentMins = (int)(currentTime/60);
                                                  int currentSec  = (int)(currentTime%60);
                                                  
                                                  NSString * durationLabel =
                                                  [NSString stringWithFormat:@"%02d:%02d",currentMins,currentSec];
                                                  weakSelf.durationOutlet.text = durationLabel;
                                                  weakSelf.sliderOutlet.value = currentTime;
                                              }];
    
}



@end
