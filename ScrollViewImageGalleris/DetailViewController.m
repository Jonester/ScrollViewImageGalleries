//
//  DetailViewController.m
//  ScrollViewImageGalleris
//
//  Created by Chris Jones on 2017-01-23.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *detailScrollView;
@property (strong, nonatomic) UIImageView *detailImage;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.detailImage = [[UIImageView alloc]initWithImage:self.currentImage];
    self.detailScrollView.contentSize = self.detailImage.frame.size;
    
    [self.detailImage setTranslatesAutoresizingMaskIntoConstraints:YES];
    [self.detailScrollView addSubview:self.detailImage];
    
    self.detailScrollView.maximumZoomScale = 5.0;
    self.detailScrollView.minimumZoomScale = 0.5;
    
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.detailImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
