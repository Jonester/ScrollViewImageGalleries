//
//  ViewController.m
//  ScrollViewImageGalleris
//
//  Created by Chris Jones on 2017-01-23.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.delegate = self;
    
    self.images = @[[UIImage imageNamed:@"Lighthouse"],
                   [UIImage imageNamed:@"Lighthouse-night"],
                   [UIImage imageNamed:@"Lighthouse-in-Field"]];
    
    [self setUpImageViews];
    self.pageControl.numberOfPages = self.images.count;
    self.pageControl.currentPage = 0;
    [self.pageControl addTarget:self action:@selector(goNextPage:) forControlEvents:UIControlEventValueChanged];
    
}

- (void)setUpImageViews {
    
    CGFloat imagePositionX = 0;
    
    for (UIImage *image in self.images) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        CGRect imageFrame = CGRectOffset(self.view.bounds, imagePositionX, 0);
        imageView.frame = imageFrame;
        imagePositionX += CGRectGetWidth(imageFrame);
        imageView.clipsToBounds = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.scrollView addSubview:imageView];
     
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageTapped:)];
        [imageView addGestureRecognizer:tapGesture];
        imageView.userInteractionEnabled = YES;
        
    }
    
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.bounds) * self.images.count, CGRectGetHeight(self.view.bounds));
    
}

- (void)imageTapped:(UITapGestureRecognizer *)sender {
    UIImageView *imageView = (UIImageView *)sender.view;
    [self performSegueWithIdentifier:@"DetailViewController" sender:imageView.image];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"DetailViewController"]) {
        UIImage *seguedImage = (UIImage *)sender;
        DetailViewController *dvController = segue.destinationViewController;
        dvController.currentImage = seguedImage;
        //could call a method on segue.destinationController and pass the image that way
    }
}

-(void)goNextPage:(id)sender {
    CGFloat x = self.pageControl.currentPage * self.view.frame.size.width;
    [self.scrollView setContentOffset:CGPointMake(x,0) animated:YES];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    float xOffset = self.scrollView.contentOffset.x;
    
    if (xOffset == 0) {
        self.pageControl.currentPage = 0;
    } else if ((xOffset >= self.view.frame.size.width) && (xOffset < self.view.frame.size.width * 2)) {
        self.pageControl.currentPage = 1;
    } else if ((xOffset >= self.view.frame.size.width * 2) && (xOffset < self.view.frame.size.width * 3)) {
        self.pageControl.currentPage = 2;
    }
    
}


@end
