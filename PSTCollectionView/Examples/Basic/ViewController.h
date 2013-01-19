//
//  ViewController.h
//  PSPDFKit
//
//  Copyright (c) 2012 Peter Steinberger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSTCollectionView.h"

@interface ViewController : UIViewController <PSUICollectionViewDataSource, PSUICollectionViewDelegate>

@property (retain, nonatomic) PSUICollectionView *collectionView;
@property (retain, nonatomic) PSUICollectionViewFlowLayout* layout;
@property (retain, nonatomic) NSMutableArray* data;
@end
