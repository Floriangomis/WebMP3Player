//
//  ViewController.m
//  IOS App#2 - Music Player
//
//  Created by Gomis Florian on 10/31/13.
//  Copyright (c) 2013 Gomis Florian. All rights reserved.
//

#import "HomeController.h"

@interface HomeController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation HomeController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"TableCellID";
    
    TableCell *tablecell = (TableCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    tablecell.title.text = @"Artiste - Titre Son";
    //[tablecell.cellImage setImage:[[UIImage alloc] initWithData: DATAICI]];

    tablecell.delegate = self;
    
    return tablecell;
}


// When we push delete button we remove one cell (We use delegate objet here).
- (void)deleteButtonTappedOnCell:(id)sender {
    NSLog(@"Delete Cell Push");
}

- (void)viewDidLoad
{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [super viewDidLoad];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
