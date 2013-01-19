//
//  CustomFlowLayout.m
//  PSCollectionViewExample
//
//  Created by kentyxie on 13-1-19.
//  Copyright (c) 2013年 Apple Inc. All rights reserved.
//

#import "CustomFlowLayout.h"

@implementation CustomFlowLayout


- (PSUICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PSUICollectionViewLayoutAttributes * attributes = [super layoutAttributesForItemAtIndexPath:indexPath ];
    
    if ([indexPath row] == 4)
    {
      attributes.hidden = YES;
    }

    return attributes;
}
@end
