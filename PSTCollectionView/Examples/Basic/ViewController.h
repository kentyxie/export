//
//  ViewController.h
//  PSPDFKit
//
//  Copyright (c) 2012 Peter Steinberger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSTCollectionView.h"

@class CustomFlowLayout;

@interface ViewController : UIViewController <PSUICollectionViewDataSource, PSUICollectionViewDelegate>

@property (retain, nonatomic) PSUICollectionView *collectionView;
@property (retain, nonatomic) PSUICollectionViewFlowLayout* layout;
@property (retain, nonatomic) NSMutableArray* data;
@property (assign, nonatomic) CGSize size;


@property (nonatomic, retain) UIPanGestureRecognizer   *_panGesture;
@property (nonatomic, assign) CGFloat _initialTouchPositionX;
@property (nonatomic, assign) CGFloat _initialHorizontalCenter;
@end
