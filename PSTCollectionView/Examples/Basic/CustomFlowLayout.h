//
//  CustomFlowLayout.h
//  PSCollectionViewExample
//
//  Created by kentyxie on 13-1-19.
//  Copyright (c) 2013年 Apple Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSTCollectionViewFlowLayout.h"

@interface CustomFlowLayout : PSUICollectionViewFlowLayout

- (void)itemResizeAfterDelay:(NSTimeInterval)delay;
- (void)setCurrentDeleteIndexPath:(NSIndexPath*)path;
@end
