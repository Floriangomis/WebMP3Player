//
//  FirstViewController.m
//  WebMusicPlayer
//
//  Created by Gomis Florian on 11/3/13.
//  Copyright (c) 2013 Gomis Florian. All rights reserved.
//

#import "HomeController.h"

@interface HomeController ()
@property (nonatomic) IBOutlet UITableView *tableView;

@end

@implementation HomeController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])){
    }
    return self;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"TableCellID";
    TableCell *tablecell = (TableCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if ([[contentManager sharedManager] getimageReceived]) {
        tablecell.title.text = [[[[contentManager sharedManager] getArrayOfTrack] objectAtIndex:indexPath.row] titreMp3];
        [tablecell.cellImage setImage:[[[[contentManager sharedManager] getArrayOfTrack] objectAtIndex:indexPath.row] uImage]];
    }
    else{
        tablecell.title.text = @"Default Title";
        [tablecell.cellImage setImage:[UIImage imageNamed:@"defaultPicture.jpg"]];
    }
    tablecell.delegate = self;
    return tablecell;
}


- (void)viewDidLoad{
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detailNew"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        homeControllerPlayer *destViewController = segue.destinationViewController;
        destViewController.titreDetailString = [[[[contentManager sharedManager] getArrayOfTrack] objectAtIndex:indexPath.row] titreMp3];
        destViewController.imageDetailUimage = [[[[contentManager sharedManager] getArrayOfTrack] objectAtIndex:indexPath.row] uImage];
    }
}


@end
