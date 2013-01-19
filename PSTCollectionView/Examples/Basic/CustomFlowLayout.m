//
//  CustomFlowLayout.m
//  PSCollectionViewExample
//
//  Created by kentyxie on 13-1-19.
//  Copyright (c) 2013年 Apple Inc. All rights reserved.
//

#import "CustomFlowLayout.h"




#define ITEM_SIZE 60.0

@implementation CustomFlowLayout

#define ACTIVE_DISTANCE 200
#define ZOOM_FACTOR 0.3

-(id)init
{
    self = [super init];
    if (self) {
        self.itemSize = CGSizeMake(260, 100);
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.sectionInset = UIEdgeInsetsMake(20, 0.0, 20, 0.0);
        self.minimumLineSpacing = 20.0;
    }
    return self;
}

- (PSUICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
    NSLog(@"initialLayoutAttributesForAppearingItemAtIndexPath: %d", [itemIndexPath row]);

    PSUICollectionViewLayoutAttributes* attributes = [super initialLayoutAttributesForAppearingItemAtIndexPath:itemIndexPath];
    //attributes.alpha = 1;
    
    //CGSize size = [self collectionView].frame.size;
    //attributes.center = CGPointMake(size.width / 2.0, -attributes.frame.size.height);
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
    
    
    //CGSize size = [self collectionView].frame.size;
    //attributes.center = CGPointMake(size.width / 2.0, -attributes.frame.size.height);
    
    
    return attributes;
}

/*
-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray* array = [super layoutAttributesForElementsInRect:rect];
    CGRect visibleRect;
    visibleRect.origin = self.collectionView.contentOffset;
    visibleRect.size = self.collectionView.bounds.size;
    
    for (UICollectionViewLayoutAttributes* attributes in array) {
        if (CGRectIntersectsRect(attributes.frame, rect)) {
            CGFloat distance = CGRectGetMidX(visibleRect) - attributes.center.x;
            CGFloat normalizedDistance = distance / ACTIVE_DISTANCE;
            if (ABS(distance) < ACTIVE_DISTANCE) {
                CGFloat zoom = 1 + ZOOM_FACTOR*(1 - ABS(normalizedDistance));
                attributes.transform3D = CATransform3DMakeScale(zoom, zoom, 1.0);
                attributes.zIndex = 1;
            }
        }
    }
    return array;
}
*/

/*
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGFloat offsetAdjustment = MAXFLOAT;
    CGFloat horizontalCenter = proposedContentOffset.x + (CGRectGetWidth(self.collectionView.bounds) / 2.0);
    
    CGRect targetRect = CGRectMake(proposedContentOffset.x, 0.0, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    NSArray* array = [super layoutAttributesForElementsInRect:targetRect];
    
    for (UICollectionViewLayoutAttributes* layoutAttributes in array) {
        CGFloat itemHorizontalCenter = layoutAttributes.center.x;
        if (ABS(itemHorizontalCenter - horizontalCenter) < ABS(offsetAdjustment)) {
            offsetAdjustment = itemHorizontalCenter - horizontalCenter;
        }
    }
    return CGPointMake(proposedContentOffset.x + offsetAdjustment, proposedContentOffset.y);
}
*/
@end

