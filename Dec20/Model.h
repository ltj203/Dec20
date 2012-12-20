//
//  Model.h
//  Dec20
//
//  Created by Lisa Jenkins on 12/20/12.
//  Copyright (c) 2012 Lisa Jenkins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject {
    NSArray *tree;
}

-(NSString *) name: (NSIndexPath *) indexPath;
-(NSUInteger) numberOfRows: (NSIndexPath *) indexPath;
-(NSString *) text: (NSIndexPath *) indexPath row: (NSUInteger) row;

@end
