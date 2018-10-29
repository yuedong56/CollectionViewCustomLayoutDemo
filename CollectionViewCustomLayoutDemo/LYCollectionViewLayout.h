//
//  LYCollectionViewLayout.h
//  CollectionViewCustomLayoutDemo
//
//  Created by yuedongkui on 2018/10/29.
//  Copyright © 2018年 LY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LYCollectionViewLayout : UICollectionViewFlowLayout

@property (nonatomic, weak) id <UICollectionViewDelegateFlowLayout> delegate;

@property (nonatomic, strong) NSMutableArray *itemAttributes;

@end

NS_ASSUME_NONNULL_END
