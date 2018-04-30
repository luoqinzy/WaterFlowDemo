//
//  ViewController.m
//  CollectionViewDemo
//
//  Created by 沐阳 on 2018/4/29.
//  Copyright © 2018年 不过N4不改名. All rights reserved.
//

#import "ViewController.h"
#import "MyLayout.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    MyLayout *layout = [[MyLayout alloc]init];
    layout.delegate = self;
    layout.itemCount = 50;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    UICollectionView *collection = [[UICollectionView alloc]initWithFrame: self.view.bounds collectionViewLayout:layout];
    collection.delegate = self;
    collection.dataSource = self;
    collection.backgroundColor = [UIColor colorWithRed:118/255.0 green:254/255.0 blue:221/255.0 alpha:0.2];
    [collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
    [self.view addSubview:collection];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"第%ld Item 被选中", indexPath.row);
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 50;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:(arc4random()%255)/255.0 green:(arc4random()%255)/255.0 blue:(arc4random()%255)/255.0 alpha:1];
    return cell;
}

- (CGSize)sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    float WIDTH = ITEM_WIDTH;
    return CGSizeMake(WIDTH, arc4random()%50+50);
}

@end
