//
//  MyLayout.h
//  CollectionViewDemo
//
//  Created by 沐阳 on 2018/4/29.
//  Copyright © 2018年 不过N4不改名. All rights reserved.
//

#import <UIKit/UIKit.h>
#define ITEM_EDGE 5.0
#define ITEM_WIDTH (([UIScreen mainScreen].bounds.size.width - ITEM_EDGE*3)/2)
@protocol MyLayoutDelegate
@required
- (CGSize)sizeForItemAtIndexPath:(NSIndexPath*)indexPath;
@end
@interface MyLayout : UICollectionViewFlowLayout
@property (nonatomic, assign) int itemCount;
@property (nonatomic, weak) id<MyLayoutDelegate> delegate;
@end
