//
//  homeControllerPlayer.h
//  WebMusicPlayer
//
//  Created by Gomis Florian on 11/7/13.
//  Copyright (c) 2013 Gomis Florian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface homeControllerPlayer : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageDetail;
@property (strong, nonatomic) IBOutlet UILabel *titreDetail;
@property (nonatomic) NSString *titreDetailString;
@property (nonatomic) UIImage *imageDetailUimage;

@end
