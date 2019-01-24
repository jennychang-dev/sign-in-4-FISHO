//
//  ViewController.m
//  Insta-FIsh
//
//  Created by Jenny Chang on 23/01/2019.
//  Copyright © 2019 Jenny Chang. All rights reserved.
//

#import "ViewController.h"
#import "MyCollectionViewCell.h"
#import "MyHeaderView.h"
#import "Fish.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;

@property (strong, nonatomic) UICollectionViewFlowLayout *simpleLayout;
@property MyHeaderView *headerView;
@property MyCollectionViewCell *cell;
@property Fish *fishItem;

@property NSMutableArray *fishArray;
@property NSMutableArray *removeCellArray;
@property NSString *allowEdit;
@property(nonatomic, readonly) NSArray<NSIndexPath *> *indexPathsForVisibleItems;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.fishArray = [@[
                       [[Fish alloc] initWithImage:[UIImage imageNamed:@"fish1"]],
                       [[Fish alloc] initWithImage:[UIImage imageNamed:@"fish2"]],
                       [[Fish alloc] initWithImage:[UIImage imageNamed:@"fish3"]],
                       [[Fish alloc] initWithImage:[UIImage imageNamed:@"fish4"]],
                       [[Fish alloc] initWithImage:[UIImage imageNamed:@"fish5"]],
                       [[Fish alloc] initWithImage:[UIImage imageNamed:@"fish6"]],
                       [[Fish alloc] initWithImage:[UIImage imageNamed:@"fish7"]],
                       [[Fish alloc] initWithImage:[UIImage imageNamed:@"fish8"]],
                       [[Fish alloc] initWithImage:[UIImage imageNamed:@"fish9"]],
                       [[Fish alloc] initWithImage:[UIImage imageNamed:@"fish10"]],
                       [[Fish alloc] initWithImage:[UIImage imageNamed:@"fish11"]],
                       [[Fish alloc] initWithImage:[UIImage imageNamed:@"fish12"]],
                       [[Fish alloc] initWithImage:[UIImage imageNamed:@"fish13"]],
                       [[Fish alloc] initWithImage:[UIImage imageNamed:@"fish14"]],
                       [[Fish alloc] initWithImage:[UIImage imageNamed:@"fish15"]],
                       [[Fish alloc] initWithImage:[UIImage imageNamed:@"fish16"]],
                       [[Fish alloc] initWithImage:[UIImage imageNamed:@"fish17"]],
                       [[Fish alloc] initWithImage:[UIImage imageNamed:@"fish18"]],
                       [[Fish alloc] initWithImage:[UIImage imageNamed:@"fish19"]],
                       [[Fish alloc] initWithImage:[UIImage imageNamed:@"fish20"]]
                       
                       ] mutableCopy];
    
    // initialise new array
    self.removeCellArray = [[NSMutableArray alloc] init];
    
    self.myCollectionView.dataSource = self;
    self.myCollectionView.delegate = self;

    // Create and set up all the properties of the layout object
    [self setUpSimpleLayout];
//    [self setUpComplexLayout];

    // Assign the layout to the collection
    self.myCollectionView.collectionViewLayout = self.simpleLayout;
    
}


-(void)setUpSimpleLayout {
    self.simpleLayout = [[UICollectionViewFlowLayout alloc] init];
    self.simpleLayout.itemSize = CGSizeMake(111, 111);
    self.simpleLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    self.simpleLayout.minimumInteritemSpacing = 15;
    self.simpleLayout.minimumLineSpacing = 15;
    
    self.simpleLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.simpleLayout.headerReferenceSize = CGSizeMake(self.myCollectionView.frame.size.width, 200);
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;  // We have 5 sections
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return self.fishArray.count;
}

// when cells loads, we call the images
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
                                   cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    NSString *cellId = @"myCell";

    // Ask collection view to give us a cell that we can use to populate our data
    self.cell = [self.myCollectionView dequeueReusableCellWithReuseIdentifier:cellId
                                forIndexPath:indexPath];
    
    Fish *eachFish = self.fishArray[indexPath.row];
    
    self.cell.fishImage.image = eachFish.image;
    

    return self.cell;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        MyHeaderView *headerView = [self.myCollectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                           withReuseIdentifier:@"MyHeaderView"
                                                                                  forIndexPath:indexPath];
        headerView.profileName.text = @"👤 Jenny Chang";
        headerView.profilePic.image = [UIImage imageNamed:@"jc"];
        headerView.profilePic.layer.borderWidth = 10;
        headerView.profilePic.layer.borderColor = [[UIColor whiteColor] CGColor];
        headerView.profileCity.text = @"📍 Vancouver";
        headerView.profileBio.text = @"Hey check out my pics of fish below 🐡";
        headerView.tintColor = [UIColor whiteColor];
        
        return headerView;
    }
    else {
        return nil;
    }
}

// if edit button is tapped, allow selection of cells

- (IBAction)editButtonTapped:(id)sender {
    self.allowEdit = @"YES";
}

// only allow selected cells if edit button is tapped
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.allowEdit isEqualToString:@"YES"]) {
        

        
        [self addSelectedItemsToMyArray:indexPath];
        // refer to the cell I selected via this method below
        
        [collectionView cellForItemAtIndexPath:indexPath].layer.borderWidth = 8;
        [collectionView cellForItemAtIndexPath:indexPath].layer.borderColor = [UIColor redColor].CGColor;

    }
    return YES;
    
}


// add selected items to my array which I initialise in viewDidLoad
-(void)addSelectedItemsToMyArray:(NSIndexPath *)indexPath
{
    NSLog(@"added item to index path %@",indexPath);
    
    // remember ya need to remove fish item not what you were trying to remove: fish index
    
    self.fishItem = self.fishArray[indexPath.row];
    [self.removeCellArray addObject:self.fishItem];
    
    for (NSMutableArray *array in self.removeCellArray)
        {
            NSLog(@"print items in array %@",array);
        }
}

- (IBAction)deleteButtonTapped:(UIBarButtonItem *)sender {
    // for each cell in this collectin of cells

    [self.fishArray removeObjectsInArray:self.removeCellArray];
    // indexpathsforvisibleitems returns nsindexpath

//    
//    for (MyCollectionViewCell *cell in self.myCollectionView.indexPathsForVisibleItems) {
//        cell.layer.borderWidth = 0;
//    }
    [self.myCollectionView reloadData];
}


@end
