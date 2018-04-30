//
//  MyLayout.m
//  CollectionViewDemo
//
//  Created by 沐阳 on 2018/4/29.
//  Copyright © 2018年 不过N4不改名. All rights reserved.
//

#import "MyLayout.h"
@implementation MyLayout
{
    NSMutableArray * _attriArray;
    CGFloat colHight[2];
}

- (void)prepareLayout{
    [super prepareLayout];
    _attriArray = [[NSMutableArray alloc]init];
    colHight[0] = 0;
    colHight[1] = 0;
    float WIDTH = ITEM_WIDTH;
    
    
    for (int i = 0; i < self.itemCount; i++) {
        NSIndexPath *index = [NSIndexPath indexPathForItem:i inSection:0];
        
        UICollectionViewLayoutAttributes *attris = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:index];
        
        CGSize itemSize = [self.delegate sizeForItemAtIndexPath:index];
        CGFloat hight = itemSize.height;
        
        if (colHight[0] <= colHight[1]) {
            colHight[0] += ITEM_EDGE;
            attris.frame = CGRectMake(ITEM_EDGE, colHight[0], WIDTH, hight);
            colHight[0] += hight;
        }else{
            colHight[1] += ITEM_EDGE;
            attris.frame = CGRectMake(ITEM_EDGE * 2 + WIDTH, colHight[1], WIDTH, hight);
            colHight[1] += hight;
        }
        [_attriArray addObject:attris];
    }
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return _attriArray;
}

- (CGSize)collectionViewContentSize{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, MAX(colHight[0] + ITEM_EDGE, colHight[1] + ITEM_EDGE));
}

@end
