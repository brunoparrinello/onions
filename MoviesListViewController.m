//
//  MoviesListViewController.m
//  onions
//
//  Created by Bruno Parrinello on 1/7/14.
//  Copyright (c) 2014 Bruno Parrinello. All rights reserved.
//

#import "MoviesListViewController.h"
#import "MovieCell.h"

@interface MoviesListViewController ()

@property (nonatomic, strong) NSArray *movies;
@end

@implementation MoviesListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            self.movies = [object valueForKeyPath:@"movies"];
            NSLog(@"%@", object);
            
            //reload data because data comes before table view load.
            [self.tableView reloadData];
        }];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.movies count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MovieCell";
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSDictionary *movie = [self.movies objectAtIndex:indexPath.row];
    NSDictionary *posters = [movie objectForKey:@"posters"];
    
    //NSMutableArray *actors = [NSMutableArray array];
    NSArray *cast = [movie objectForKey:@"abridged_cast"];
    NSMutableString *movieCastString = [[NSMutableString alloc] init];
    [movieCastString appendString:@"Cast: "];
    for (int i=0; i<3; i++) {
        [movieCastString appendString:[[cast objectAtIndex:i] objectForKey:@"name"]];
        [movieCastString appendString:@", "];
        //actors[i] = [[cast objectAtIndex:i] objectForKey:@"name"];
    }
    movieCastString = (NSMutableString *) [movieCastString substringToIndex:[movieCastString length] -2];
    
    
    //cell.posterImageView = [posters objectForKey:@"thumbnail"];
    cell.movieTitleLabel.text = [movie objectForKey:@"title"];
    cell.movieSummaryLabel.text = [movie objectForKey:@"synopsis"];
    cell.movieCastLabel.text = movieCastString;
    
    NSLog(@"%@", movieCastString);
    
    return cell;
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
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
