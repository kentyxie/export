//
//  ViewController.m
//  PSPDFKit
//
//  Copyright (c) 2012 Peter Steinberger. All rights reserved.
//

#import "ViewController.h"
#import "Cell.h"
#import "CustomFlowLayout.h"

static NSString *cellIdentifier = @"TestCell";

@implementation ViewController


- (void)loadView {
	[super loadView];
	
	self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
	
	CustomFlowLayout *collectionViewFlowLayout = [[CustomFlowLayout alloc] init];
	
    _layout = collectionViewFlowLayout;
	_collectionView = [[PSUICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:collectionViewFlowLayout];
	[_collectionView setDelegate:self];
	[_collectionView setDataSource:self];
	[_collectionView setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
	[_collectionView setBackgroundColor:[UIColor whiteColor]];
    _collectionView.layer.borderWidth = 1;
    _collectionView.layer.borderColor = [[UIColor redColor] CGColor];
	
	[_collectionView registerClass:[Cell class] forCellWithReuseIdentifier:cellIdentifier];
	
	[self.view addSubview:_collectionView];
    
    self.data = [[NSMutableArray alloc] init];
   
}



- (void)viewDidLoad {
    UIPinchGestureRecognizer* pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinchGesture:)];
    [self.collectionView addGestureRecognizer:pinchRecognizer];
    
    
    int numberOfViews            = 4;
    CGFloat animationTimePerView = 0.25;
	for (int i = 0; i < numberOfViews; i++)
    {
        NSIndexPath* path = [NSIndexPath indexPathForRow:i inSection:0];
		[self performSelector: @selector(addView:) withObject: path afterDelay: i*animationTimePerView];
     
        if (i == numberOfViews - 1)
        {
            [self performSelector: @selector(scrollToBottomAnimated:) withObject: [NSNumber numberWithBool: YES] afterDelay: i*animationTimePerView];
            

        }
      
	}

  
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([self.data count] < 4)
    {
        return CGSizeMake(260, 160);
    }
    else
    {
        return CGSizeMake(260, 100);
    }
   
}

- (void)scrollToBottomAnimated:(BOOL)animated
{
    NSIndexPath* path = [NSIndexPath indexPathForRow:3 inSection:0];
   [ _collectionView scrollToItemAtIndexPath:path atScrollPosition:PSTCollectionViewScrollPositionCenteredVertically animated:YES];

    [self performSelector: @selector(deleteItem) withObject: nil afterDelay:0.5];

}

- (void)deleteItem
{
     NSIndexPath* path = [NSIndexPath indexPathForRow:2 inSection:0];
    NSArray* array = [[NSArray alloc] initWithObjects:path, nil];
    [self.data removeLastObject];
    [_collectionView deleteItemsAtIndexPaths:array];
}



- (void)addView:(NSIndexPath*) path
{
    NSLog(@"addView:%d", [path row]);
    
    [self.data addObject:path];
     NSArray* array = [[NSArray alloc] initWithObjects:path, nil];
   // [_collectionView insertItemsAtIndexPaths: array];
    [_collectionView reloadData];
}


#pragma mark -
#pragma mark Rotation stuff

- (BOOL)shouldAutorotate {
    return YES;
}


- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation {
    if ((orientation == UIInterfaceOrientationLandscapeRight) ||
        (orientation == UIInterfaceOrientationLandscapeLeft) ||
        (orientation == UIInterfaceOrientationPortrait))
    {
        return YES;
    }
    
    return NO;
}



///////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - PSTCollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return [self.data count];
}

///////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - PSTCollectionViewDelegate

- (PSUICollectionViewCell *)collectionView:(PSUICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.label.text = [[NSString alloc] initWithFormat:@"%d",[ [self.data objectAtIndex:[indexPath row]] row]];
    return cell;
}


- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
        if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft
            || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
        {
            
            _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            [_collectionView setBounds:self.view.bounds];
            [_layout setSectionInset:UIEdgeInsetsMake(30, 0, 30, 0)];
        }
        else
        {
            _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
             [_layout setSectionInset:UIEdgeInsetsMake(10, 0, 10, 0)];
        }
        
    return;
}


@end
