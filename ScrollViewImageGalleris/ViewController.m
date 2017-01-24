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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.images = @[[UIImage imageNamed:@"Lighthouse"],
                   [UIImage imageNamed:@"Lighthouse-night"],
                   [UIImage imageNamed:@"Lighthouse-in-Field"]];
    
    [self setUpImageViews];
    
}

- (void)setUpImageViews {
    
    CGFloat imagePositionX = 0;
    
    for (UIImage *image in self.images) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        CGRect imageFrame = CGRectOffset(self.view.bounds, imagePositionX, 0);
        imageView.frame = imageFrame;
        imagePositionX += CGRectGetWidth(imageFrame);
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
    }
}



@end
