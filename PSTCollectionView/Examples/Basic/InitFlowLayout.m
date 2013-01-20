//
//  InitFlowLayout.m
//  PSCollectionViewExample
//
//  Created by KentyXie on 1/20/13.
//  Copyright (c) 2013 Apple Inc. All rights reserved.
//

#import "InitFlowLayout.h"

@implementation InitFlowLayout
#define ITEM_FIXED_WIDTH 200
#define ITEM_FIXED_HEIGHT 100

-(id)init
{
    self = [super init];
    if (self) {
        self.itemSize = CGSizeMake(ITEM_FIXED_WIDTH, ITEM_FIXED_HEIGHT);
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.sectionInset = UIEdgeInsetsMake(20, 0.0, 20, 0.0);

        self.minimumLineSpacing = 20.0;
    }
    
    return self;
}


- (CGSize)collectionViewContentSize
{
    return CGSizeMake(self.collectionView.bounds.size.width, ITEM_FIXED_HEIGHT * 5);
}


- (PSUICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
    NSLog(@"initialLayoutAttributesForAppearingItemAtIndexPath: %d", [itemIndexPath row]);
    
    PSUICollectionViewLayoutAttributes* attributes = [super initialLayoutAttributesForAppearingItemAtIndexPath:itemIndexPath];
   // attributes.alpha = 0;
    
    CGSize size = [self collectionView].frame.size;
    attributes.center = CGPointMake(size.width / 2.0, 0);
    return attributes;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)oldBounds
{
    return YES;
}


- (PSUICollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
    NSLog(@"finalLayoutAttributesForDisappearingItemAtIndexPath: %d", [itemIndexPath row]);
    PSUICollectionViewLayoutAttributes* attributes = [super finalLayoutAttributesForDisappearingItemAtIndexPath:itemIndexPath];
    //CGSize size = [self collectionView].frame.size;
    //attributes.center = CGPointMake(-attributes.center.x, attributes.center.y);
    
    return attributes;
}


-(void)finalizeCollectionViewUpdates
{
    // sleep(1);
}

- (PSUICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"layoutAttributesForItemAtIndexPath: %d", [indexPath row]);
    
    PSUICollectionViewLayoutAttributes * attributes =
    [super layoutAttributesForItemAtIndexPath:indexPath];
    
    
  //  CGSize size = [self collectionView].frame.size;
   // attributes.center = CGPointMake(size.width / 2.0, -attributes.frame.size.height);
    
    
    return attributes;
}


@end
