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

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])){
        _imageDetail = [[UIImageView alloc] init];
        _titreDetailString = @"Default Title Detail";
        _titreDetail = [[UILabel alloc] init];
        _imageDetailUimage = [[UIImage alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.imageDetail setImage:self.imageDetailUimage];
    self.titreDetail.text = self.titreDetailString;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
