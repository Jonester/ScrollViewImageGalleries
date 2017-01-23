//
//  ViewController.m
//  ScrollViewImageGalleris
//
//  Created by Chris Jones on 2017-01-23.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) NSArray <UIImage *> *images;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.images = @[[UIImage imageNamed:@"Lighthouse"],
                   [UIImage imageNamed:@"Lighthouse-night"],
                   [UIImage imageNamed:@"Lighthouse-in-Field"]];
    
    [self setUpImageViews];
    
}

-(void)setUpImageViews {
    
    CGRect viewRect = self.view.bounds;
    CGFloat imagePositionX = 0;
    
    for (UIImage *image in self.images) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        CGRect imageFrame = CGRectOffset(viewRect, imagePositionX, 0);
        imageView.frame = imageFrame;
        imagePositionX += CGRectGetWidth(imageFrame);
        [self.scrollView addSubview:imageView];
    }
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(viewRect) * self.images.count, CGRectGetHeight(viewRect));
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
