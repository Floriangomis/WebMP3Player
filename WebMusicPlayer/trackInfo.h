//
//  trackInfo.h
//  Tableview Tutorial 3
//
//  Created by Gomis Florian on 10/22/13.
//  Copyright (c) 2013 Gomis Florian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface trackInfo : NSObject
-(id) initWithUrlImg:(NSString*)urlImg AndWith:(NSString*)titleSong idTrack:(NSInteger)idsong;
@property (nonatomic) NSString *titreMp3;
@property (nonatomic) NSURL *urlMp3;
@property (nonatomic) UIImage *uImage;
@property (nonatomic) NSMutableData *dataPicture;
@property (nonatomic) NSMutableData *dataMp3;
@property (nonatomic) NSURL *urlPicture;
@property (nonatomic) NSInteger *idTrack;
@end
