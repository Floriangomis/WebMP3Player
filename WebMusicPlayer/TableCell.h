//
//  TableCell.h
//  Tableview Tutorial 3
//
//  Created by Gomis Florian on 10/17/13.
//  Copyright (c) 2013 Gomis Florian. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TableCellDelegate
@optional
- (void) deleteButtonTappedOnCell:(id)sender;
- (void) playSong:(id)sender;
- (void) stopSong:(id)sender;

@end

@interface TableCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *cellImage;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) id delegate;
@end
