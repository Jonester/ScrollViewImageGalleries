//
//  DetailViewController.m
//  ScrollViewImageGalleris
//
//  Created by Chris Jones on 2017-01-23.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "DetailViewController.h"
#import "ViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *detailScrollView;
@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) UIImageView *detailImage;
@property (strong, nonatomic) UIImage *currentImage;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.detailImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Lighthouse"]];
    [self.detailScrollView addSubview:self.detailImage];
    self.detailScrollView.contentSize = self.detailImage.frame.size;
    
    self.detailScrollView.maximumZoomScale = 5.0;
    self.detailScrollView.minimumZoomScale = 0.5;
    
//    self.detailScrollView.delegate = self;
    
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.detailImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
