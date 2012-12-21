//
//  TableViewController.m
//  Dec20
//
//  Created by Lisa Jenkins on 12/20/12.
//  Copyright (c) 2012 Lisa Jenkins. All rights reserved.
//

#import "TableViewController.h"
#import "Model.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style model:(Model *)m indexPath:(NSIndexPath *)p
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        model = m;
        indexPath = [p copy];
        self.title = [model name:indexPath];
        self.navigationItem.backBarButtonItem.title = self.title;
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

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
-(void) viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
-(BOOL) shouldAutorotate {
    return YES;
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
    return [model numberOfRows:indexPath];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)p
{
    static NSString *CellIdentifier = @"Groups";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [model text: indexPath row:p.row];
    if ([model numberOfRows:[indexPath indexPathByAddingIndex:p.row]]>0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    NSString *string = [cell.textLabel.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *fileName = [string stringByAppendingString:@".jpg"];
    cell.imageView.image = [UIImage imageNamed:fileName];
    return cell;
    
    // Configure the cell...
    
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *) p
{
    NSIndexPath *newIndexPath = [indexPath indexPathByAddingIndex:p.row];
    if ([model numberOfRows:newIndexPath] > 0) {
        TableViewController *tableViewController = [[TableViewController alloc] initWithStyle:UITableViewStylePlain model: model indexPath:newIndexPath];
        [self.navigationController pushViewController:tableViewController animated:YES];
    } else {
    
        NSString *name = [model name: newIndexPath];
        NSString *string = [name stringByReplacingOccurrencesOfString:@" " withString:@""];
    
        string = [@"http://starwars.com/explore/encyclopedia/groups/" stringByAppendingString:string];

        NSURL *url = [NSURL URLWithString:string];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [request setValue:@"Mozilla/5.0 (iPhone)" forHTTPHeaderField:@"User-Agent"];
        
        NSURLResponse *response;
        NSError *error;
        
        //NSData *data = [NSData dataWithContentsOfURL:url];
        
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        
        if (data == nil) {
            NSLog(@"could not load URL %@", url);
        } else {
            UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectZero];
            webView.scalesPageToFit = YES;
            [webView loadData:data MIMEType:@"text/html" textEncodingName:@"NSUTF8StringEncoding" baseURL:url];
        
        UIViewController *viewController = [[UIViewController alloc] initWithNibName:nil bundle:nil];
        viewController.title = name;
        viewController.view = webView;
        [self.navigationController pushViewController:viewController animated:YES];
    }
    }
}

@end
