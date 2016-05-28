//
//  MainTableViewController.m
//  FunGCD
//
//  Created by JiaLi on 16/5/28.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import "MainTableViewController.h"
#import "ViewController.h"

const NSString* THREADTYPE0 = @"Main Thread && async";
const NSString* THREADTYPE1 = @"Main Thread && sync";
const NSString* THREADTYPE2 = @"Create Thread && async";
const NSString* THREADTYPE3 = @"Create Thread && sync";
const NSString* THREADTYPE4 = @"globle Thread && async";
const NSString* THREADTYPE5 = @"globle Thread && sync";

@interface MainTableViewController ()

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationController.navigationBar.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = THREADTYPE0;
            break;
        case 1:
            cell.textLabel.text = THREADTYPE1;
            break;
        case 2:
            cell.textLabel.text = THREADTYPE2;
            break;
        case 3:
            cell.textLabel.text = THREADTYPE3;
            break;
        case 4:
            cell.textLabel.text = THREADTYPE4;
            break;
        case 5:
            cell.textLabel.text = THREADTYPE5;
            
            break;
          
        default:
            break;
    }
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    ViewController *detailViewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    detailViewController.type = indexPath.row;
    // Pass the selected object to the new view controller.
    switch (indexPath.row) {
        case 0:
            detailViewController.nvtitle = THREADTYPE0;
            break;
        case 1:
            detailViewController.nvtitle = THREADTYPE1;
            break;
        case 2:
            detailViewController.nvtitle = THREADTYPE2;
            break;
        case 3:
            detailViewController.nvtitle = THREADTYPE3;
            break;
        case 4:
            detailViewController.nvtitle = THREADTYPE4;
            break;
        case 5:
            detailViewController.nvtitle = THREADTYPE5;
            
            break;
            
        default:
            break;
    }

    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
