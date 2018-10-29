//
//  ViewController.m
//  CollectionViewCustomLayoutDemo
//
//  Created by yuedongkui on 2018/10/29.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "ViewController.h"
#import "LYCollectionViewCell.h"
#import "LYCollectionViewLayout.h"
#import "LYModel.h"

#define kCellReuseIdentifier @"kCellReuseIdentifier"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectView;
@property (nonatomic, strong) NSMutableArray *models;

@end




@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.models = [NSMutableArray array];
    for (int i=0; i<50; i++) {
        LYModel *model = [[LYModel alloc] init];
        model.title = [NSString stringWithFormat:@"%d", i*i*i*i];
        model.titleSize = [model.title sizeWithAttributes:@{NSFontAttributeName : kTitleFont}];
        [self.models addObject:model];
    }
    
    LYCollectionViewLayout *layout = [[LYCollectionViewLayout alloc] init];
    layout.delegate = self;
//    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    layout.minimumInteritemSpacing = 5;
    layout.minimumLineSpacing = 4;
    
    _collectView = [[UICollectionView alloc] initWithFrame:CGRectMake(10, 100, 300, 300)
                                      collectionViewLayout:layout];
    _collectView.backgroundColor = [UIColor orangeColor];
    [_collectView registerClass:[LYCollectionViewCell class] forCellWithReuseIdentifier:kCellReuseIdentifier];
    _collectView.delegate = self;
    _collectView.dataSource = self;
    _collectView.showsHorizontalScrollIndicator = YES;
    
    [self.view addSubview:_collectView];
}


#pragma mark - UICollectionViewDelegate & UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.models.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LYCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellReuseIdentifier forIndexPath:indexPath];
    
    LYModel *model = self.models[indexPath.row];
    cell.label.text = model.title;
    [cell.label sizeToFit];
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LYModel *model = self.models[indexPath.row];
    return CGSizeMake(10+model.titleSize.width, 10+model.titleSize.height);
}


@end
