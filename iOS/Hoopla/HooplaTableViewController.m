//
//  HooplaTableViewController.m
//  Hoopla
//
//  Created by Chris Bruce on 12/3/11.
//  Copyright (c) 2011 Diversion, Inc. All rights reserved.
//

#import "HooplaTableViewController.h"

#import <QuartzCore/QuartzCore.h>


@implementation HooplaTableViewController
@synthesize results = _results;
@synthesize sections = _sections;
@synthesize favTapGestureRecognizer = _favTapGestureRecognizer;
@synthesize tappedIndexPath;
@synthesize controlIndexPath;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.results = [NSMutableArray array];
        self.sections = [NSMutableArray array];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo-header"]];
    self.tableView.rowHeight = 45;
    
    self.navigationController.navigationBar.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.navigationController.navigationBar.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
    self.navigationController.navigationBar.layer.shadowRadius = 3.0f;
    self.navigationController.navigationBar.layer.shadowOpacity = 1.0f;
    self.navigationController.navigationBar.layer.masksToBounds = NO;
    
    //LoadingView *loading = [[LoadingView alloc] init];
    //[self.view addSubview:loading];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 15, 0);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Recommendations" 
                                                     ofType:@"json"];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    [self fetchedData:data];
}

- (void)viewDidUnload
{
    [self setFavTapGestureRecognizer:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Assume self.view is the table view
    if ([segue.identifier isEqualToString:@"RecommendationDetailSegue"]) {
        NSIndexPath *path = [self indexPathForModels:[self.tableView indexPathForSelectedRow]];
        Recommendation *recommendation = [[_results objectAtIndex:path.section] objectAtIndex:path.row];
        [segue.destinationViewController setRecommendation:recommendation];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [_sections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rowCount = [[_results objectAtIndex:section] count];
    if (self.controlIndexPath && self.controlIndexPath.section == section) {
        rowCount++;
    }
    return rowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath isEqual:self.controlIndexPath]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RecommendationControlCell"];
        return cell;
    } else {
        RecommendationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RecommendationCell"];
        
        
        NSIndexPath *modelIndexPath = [self indexPathForModels:indexPath];
        NSArray *recsInSection = [_results objectAtIndex:[modelIndexPath section]];
        
        Recommendation *recommendation = [recsInSection objectAtIndex:[modelIndexPath row]];
        cell.recommendation = recommendation;
        cell.delegate = self;
        
        return cell;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, tableView.sectionHeaderHeight)];
    sectionView.opaque = NO;
    sectionView.backgroundColor = UI_COLOR_SECTION_BG;
    
    sectionView.layer.shadowColor = [[UIColor blackColor] CGColor];
    sectionView.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
    sectionView.layer.shadowRadius = 4.0f;
    sectionView.layer.shadowOpacity = 1.0f;
    sectionView.layer.masksToBounds = NO;
    
    UILabel *sectionLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, sectionView.frame.size.width - 10, sectionView.frame.size.height)];
    sectionLabel.font = [UIFont boldSystemFontOfSize:16];
    sectionLabel.textColor = [UIColor blackColor];
    sectionLabel.backgroundColor = [UIColor clearColor];
    sectionLabel.text = [_sections objectAtIndex:section];
    [sectionView addSubview:sectionLabel];
    
    return sectionView;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (void)fetchedData:(NSData *)responseData {
    //parse out the json data
    
    self.tappedIndexPath = nil;
    self.controlIndexPath = nil;
    NSError *error;
    NSDictionary *json = [NSJSONSerialization 
                          JSONObjectWithData:responseData
                          options:kNilOptions 
                          error:&error];
    NSArray *rawArray = [json valueForKeyPath:@"data.recommendations"];
    
    NSLog(@"Response: %@ - %i", rawArray, [rawArray count]);
    
    NSArray *recommendations = [Recommendation recommendationsFromArray:rawArray];
    
    NSLog(@"%@", recommendations);
    
    self.sections = [NSMutableArray array];
    self.results = [NSMutableArray array];
    
    NSString *currentCategory = nil;
    for (Recommendation *rec in recommendations) {
        if (![rec.category isEqualToString:currentCategory]) {
            [_sections addObject:rec.category];
            [_results addObject:[NSMutableArray array]];
            currentCategory = rec.category;
        }
        [[_results objectAtIndex:[_results count] - 1] addObject:rec];
    }
    NSLog(@"Results: %@", _results);
    [self.tableView reloadData];
}

- (void)favoriteToggled:(BOOL)isSelected forRecommendation:(Recommendation *)recommendation  {
    NSLog(@"Favorite Tapped");
}

- (void)infoSelected:(Recommendation *)recommendation {
    NSIndexPath *indexPath = [self indexPathForRecommendation:recommendation];
    
    NSIndexPath *indexPathToDelete = self.controlIndexPath;
    if ([indexPath isEqual:self.tappedIndexPath]) {
        self.tappedIndexPath = nil;
        self.controlIndexPath = nil;
    } else {
        self.tappedIndexPath = indexPath;
        self.controlIndexPath = [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:indexPath.section];
    }
    
    [self.tableView beginUpdates];
    if (indexPathToDelete) {
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPathToDelete] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
    if (controlIndexPath) {
        [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:controlIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
    [self.tableView endUpdates];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath isEqual:self.controlIndexPath]) {
        return self.tappedIndexPath;
    }
    return indexPath;
}

- (NSIndexPath *)indexPathForRecommendation:(Recommendation *)recommendation {
    NSString *section;
    Recommendation *resultRec;
    NSInteger sectionIdx;
    NSInteger rowIdx;
    
    for (uint i = 0; i < [_sections count]; i++) {
        section = [_sections objectAtIndex:i];
        if ([recommendation.category isEqualToString:section]) {
            sectionIdx = i;
            break;
        }
    }
    
    for (uint i = 0; i < [_results count]; i++) {
        resultRec = [[_results objectAtIndex:sectionIdx] objectAtIndex:i];
        if ([recommendation.identifier isEqualToString:resultRec.identifier]) {
            rowIdx = i;
            break;
        }
    }
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:rowIdx inSection:sectionIdx];
    return indexPath;
}

- (NSIndexPath *)indexPathForModels:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    NSInteger section = indexPath.section;
    if (self.controlIndexPath) {
        if (indexPath.section == self.controlIndexPath.section) {
            if (indexPath.row >= self.controlIndexPath.row ) {
                row--;
            }
        }
    }
    return [NSIndexPath indexPathForRow:row inSection:section];
}

@end
