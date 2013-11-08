//
//  homeControllerPlayer.h
//  WebMusicPlayer
//
//  Created by Gomis Florian on 11/7/13.
//  Copyright (c) 2013 Gomis Florian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface homeControllerPlayer : UIViewController 
@property (strong, nonatomic) IBOutlet UIImageView *imageDetail;
@property (strong, nonatomic) IBOutlet UILabel *titreDetail;
@property (nonatomic) NSString *titreDetailString;
@property (nonatomic) NSString *urlSong;
@property (nonatomic) UIImage *imageDetailUimage;

// Concern Player in view
@property (strong, nonatomic) AVPlayer *audioPlayer;
@property (strong, nonatomic) IBOutlet UIButton *togglePlayPause;
@property (strong, nonatomic) IBOutlet UISlider *sliderOutlet;
@property (strong, nonatomic) IBOutlet UILabel *durationOutlet;
@property (nonatomic) AVPlayerItem * currentItem;

@end
