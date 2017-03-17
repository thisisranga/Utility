//
//  SorterMaster.h
//  Utility
//
//  Created by Ranga Reddy Nallavelli on 3/16/17.
//  Copyright © 2017 Ranga. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SorterMaster : NSObject

-(NSArray*)sortUsingBubbleSort:(NSArray*)unsortedArray;
-(NSArray*)sortUsingSelectionSort:(NSArray*)unsortedArray;
-(NSArray*)sortUsingMergeSort:(NSArray*)unsortedArray;

@end
