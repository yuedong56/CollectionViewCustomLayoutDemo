//
//  CustomCollectionViewCell.m
//  CollectionViewCustomLayoutDemo
//
//  Created by yuedongkui on 2018/10/29.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYCollectionViewCell.h"

@implementation LYCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor greenColor];
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, frame.size.width-10, frame.size.width-10)];
        self.label.textColor = [UIColor whiteColor];
        self.label.font = kTitleFont;
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:self.label];
    }
    return self;
}

@end
