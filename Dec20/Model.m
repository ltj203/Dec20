//
//  Model.m
//  Dec20
//
//  Created by Lisa Jenkins on 12/20/12.
//  Copyright (c) 2012 Lisa Jenkins. All rights reserved.
//

#import "Model.h"

#define BEGIN [NSArray arrayWithObjects:
#define END , nil]

@implementation Model

-(id) init {
    self = [super init];
    if (self) {
        tree = BEGIN @"Universe",
                BEGIN @"Star Wars Groups",
                  BEGIN @"Clone Troopers - Gungans",
                    BEGIN @"Clone Troopers"
                    END,
                    BEGIN @"Death Watch"
                    END,
                    BEGIN @"Ewoks"
                    END,
                    BEGIN @"Galactic Empire"
                    END,
                    BEGIN @"Galactic Republic"
                    END,
                    BEGIN @"Galactic Senate"
                    END,
                    BEGIN @"Gungan Grand Army"
                    END,
                    BEGIN @"Gungans"
                    END
                  END,
        
                  BEGIN @"Jawas - Mon Calamari",
                    BEGIN @"Jawas"
                    END,
                    BEGIN @"Jedi Order"
                    END,
                    BEGIN @"Junkers"
                    END,
                    BEGIN @"Kage Warriors"
                    END,
                    BEGIN @"Kindalo"
                    END,
                    BEGIN @"Lurmen"
                    END,
                    BEGIN @"Mandalorian Guard"
                    END,
                    BEGIN @"Mon Calamari"
                    END
                  END,
        
                  BEGIN @"Naboo Royal Guards - Quarren",
                    BEGIN @"Naboo Royal Guards"
                    END,
                    BEGIN @"Naboo Royal Handmaidens"
                    END,
                    BEGIN @"Nightsister Zombies"
                    END,
                    BEGIN @"Nightsisters"
                    END,
                    BEGIN @"Onderon Rebels"
                    END,
                    BEGIN @"Patitites"
                    END,
                    BEGIN @"Podracer Pilots"
                    END,
                    BEGIN @"Quarren"
                    END
                  END,
        
                  BEGIN @"Rebel Alliance - Stormtroopers",
                    BEGIN @"Rebel Alliance"
                    END,
                    BEGIN @"Rebel Pilots"
                    END,
                    BEGIN @"Rebel Troopers"
                    END,
                    BEGIN @"Senate Guard"
                    END,
                    BEGIN @"Separatists"
                    END,
                    BEGIN @"Sith"
                    END,
                    BEGIN @"Stormtroopers"
                    END
                  END,
        
                  BEGIN @"Talz - Zygerrians",
                    BEGIN @"Talz"
                    END,
                    BEGIN @"Trade Federation"
                    END,
                    BEGIN @"Tusken Raiders"
                    END,
                    BEGIN @"Twileks"
                    END,
                    BEGIN @"Umbarans"
                    END,
                    BEGIN @"Weequay Pirates"
                    END,
                    BEGIN @"Wookiees"
                    END,
                    BEGIN @"Zygerrians"
                    END
                  END
                END
        END;
    
    }
    return self;
    
}

-(NSArray *) tree: (NSIndexPath *) indexPath{
    NSArray *a = tree;
    
    for (NSUInteger p = 0; p<indexPath.length; ++p){
        NSUInteger i = [indexPath indexAtPosition: p];
        a = [a objectAtIndex: i+1];
    }
    
    return a;
}

-(NSString *) name: (NSIndexPath *) indexPath {
    NSArray *a = [self tree: indexPath];
    return [a objectAtIndex: 0];
}

-(NSUInteger) numberOfRows: (NSIndexPath *) indexPath {
    NSArray *a = [self tree: indexPath];
    return a.count - 1;
}

-(NSString *) text: (NSIndexPath *) indexPath row: (NSUInteger) row {
    indexPath = [indexPath indexPathByAddingIndex: row];
    return [self name: indexPath];
}

@end
