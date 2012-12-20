//
//  TableViewController.h
//  Dec20
//
//  Created by Lisa Jenkins on 12/20/12.
//  Copyright (c) 2012 Lisa Jenkins. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Model;

@interface TableViewController : UITableViewController {
    Model *model;
    NSIndexPath *indexPath;
}

-(id) initWithStyle:(UITableViewStyle)style model: (Model *) m indexPath: (NSIndexPath *) p;

@end
