//
//  SorterMaster.m
//  Utility
//
//  Created by Ranga Reddy Nallavelli on 3/16/17.
//  Copyright © 2017 Ranga. All rights reserved.
//

#import "SorterMaster.h"

@implementation SorterMaster
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
-(NSArray*)sortUsingBubbleSort:(NSMutableArray*)unsortedArray {
    for (int j=0;j<unsortedArray.count-1;j++) {
        BOOL notSwapped = true;
        
        for (int i=0; i<unsortedArray.count-1; i++) {
            if ([unsortedArray[i] intValue] > [unsortedArray [i+1] intValue]) {
                notSwapped = false;
                [unsortedArray exchangeObjectAtIndex:i withObjectAtIndex:i+1];
            }
            
        }
        if (notSwapped) {
            break;
        }
    }
    NSArray *sortedArray =[unsortedArray copy];
    return sortedArray;
}
-(NSArray*)sortUsingSelectionSort:(NSMutableArray*)unsortedArray {
    for (int i=0; i<(unsortedArray.count-1); i++) {
        int currentMinmum = i;
        for (int j = i+1; j<(unsortedArray.count); j++) {
            if ([unsortedArray[j] intValue] < [unsortedArray[currentMinmum] intValue]) {
                currentMinmum = j;
            }
        }
        [unsortedArray exchangeObjectAtIndex:i withObjectAtIndex:currentMinmum];
    }
    NSArray *sortedArray =[unsortedArray copy];
    return sortedArray;
}
-(NSArray *)merge:(NSArray *)leftArr andRight:(NSArray *)rightArr
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    int right = 0;
    int left = 0;
    while (left < [leftArr count] && right < [rightArr count])
    {
        if ([[leftArr objectAtIndex:left] intValue] < [[rightArr objectAtIndex:right] intValue])
        {
            [result addObject:[leftArr objectAtIndex:left++]];
        }
        else
        {
            [result addObject:[rightArr objectAtIndex:right++]];
        }
    }
    NSRange leftRange = NSMakeRange(left, ([leftArr count] - left));
    NSRange rightRange = NSMakeRange(right, ([rightArr count] - right));
    NSArray *newRight = [rightArr subarrayWithRange:rightRange];
    NSArray *newLeft = [leftArr subarrayWithRange:leftRange];
    newLeft = [result arrayByAddingObjectsFromArray:newLeft];
    return [newLeft arrayByAddingObjectsFromArray:newRight];
}

-(NSArray*)sortUsingMergeSort:(NSMutableArray*)unsortedArray {
  
        if ([unsortedArray count] < 2)
        {
            return unsortedArray;
        }
        long middle = ([unsortedArray count]/2);
        NSRange left = NSMakeRange(0, middle);
        NSRange right = NSMakeRange(middle, ([unsortedArray count] - middle));
        NSArray *rightArr = [unsortedArray subarrayWithRange:right];
        NSArray *leftArr = [unsortedArray subarrayWithRange:left];

        NSArray *resultArray =[self merge:[self sortUsingMergeSort:leftArr] andRight:[self sortUsingMergeSort:rightArr]];
        return resultArray;
}
@end
