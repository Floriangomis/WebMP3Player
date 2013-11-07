//
//  TableCell.m
//  Tableview Tutorial 3
//
//  Created by Gomis Florian on 10/17/13.
//  Copyright (c) 2013 Gomis Florian. All rights reserved.
//

#import "TableCell.h"

@interface TableCell ()
@end

@implementation TableCell
@synthesize imageView = _imageView;
@synthesize title = _title;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

}

- (IBAction)deleteTapped:(id)sender {
    [self.delegate deleteButtonTappedOnCell:self];
}

- (IBAction)playSong:(id)sender {
    [self.delegate playSong:self];
}


- (IBAction)stopSong:(id)sender {
    [self.delegate stopSong:self];
}

@end
