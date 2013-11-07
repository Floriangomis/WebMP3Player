//
//  FirstViewController.h
//  WebMusicPlayer
//
//  Created by Gomis Florian on 11/3/13.
//  Copyright (c) 2013 Gomis Florian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableCell.h"
#import "contentManager.h"

@interface HomeController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) id delegate;
@end
