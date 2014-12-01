//
//  ViewController.m
//  HMSegmentedControlExample
//
//  Created by Hesham Abd-Elmegid on 23/12/12.
//  Copyright (c) 2012 Hesham Abd-Elmegid. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) HMSegmentedControl *segmentedControl4;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat yDelta;
    
    if ([[[UIDevice currentDevice] systemVersion] compare:@"7.0" options:NSNumericSearch] != NSOrderedAscending) {
        yDelta = 20.0f;
    } else {
        yDelta = 0.0f;
    }
    
    // Minimum code required to use the segmented control with the default styling.
 
    
    
    // Tying up the segmented control to a scroll view
    self.segmentedControl4 = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(10, 240 + yDelta, 300, 35)];
    self.segmentedControl4.sectionTitles = @[@"Public messages", @"Private messages"];
    self.segmentedControl4.type = HMSegmentedControlTypeText;
    self.segmentedControl4.selectedSegmentIndex = 1;
    self.segmentedControl4.backgroundColor = [UIColor whiteColor];
    self.segmentedControl4.textColor = [UIColor colorWithRed:0.1 green:0.47 blue:0.73 alpha:1];
    self.segmentedControl4.selectedTextColor = [UIColor whiteColor];
    self.segmentedControl4.selectionIndicatorColor = [UIColor colorWithRed:0.1 green:0.47 blue:0.73 alpha:1];
    self.segmentedControl4.selectionStyle = HMSegmentedControlSelectionStyleBox;
    self.segmentedControl4.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationNone;
    self.segmentedControl4.tag = 3;
    self.segmentedControl4.selectionIndicatorBoxOpacity = 1;
    self.segmentedControl4.layer.cornerRadius = 5;
    self.segmentedControl4.layer.masksToBounds = YES;
    self.segmentedControl4.userDraggable = YES;
    self.segmentedControl4.font = [UIFont systemFontOfSize:14];
    self.segmentedControl4.layer.borderWidth = 1;
    self.segmentedControl4.layer.borderColor = [UIColor colorWithRed:0.1 green:0.47 blue:0.73 alpha:1].CGColor;
    __weak typeof(self) weakSelf = self;
    [self.segmentedControl4 setIndexChangeBlock:^(NSInteger index) {
//        [weakSelf.scrollView scrollRectToVisible:CGRectMake(320 * index, 0, 320, 200) animated:YES];
         [weakSelf.segmentedControl4 setSectionBagdes:@[[UIImage imageNamed:@"ic_new"],[NSNull null]]];
    }];
    
    [self.segmentedControl4 setSectionBagdes:@[[NSNull null],[UIImage imageNamed:@"ic_new"]]];
    
    [self.view addSubview:self.segmentedControl4];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 290 + yDelta, 320, 210)];
    self.scrollView.backgroundColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(960, 200);
    self.scrollView.delegate = self;
    [self.scrollView scrollRectToVisible:CGRectMake(320, 0, 320, 200) animated:NO];
    [self.view addSubview:self.scrollView];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 210)];
    [self setApperanceForLabel:label1];
    label1.text = @"Worldwide";
    [self.scrollView addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(320, 0, 320, 210)];
    [self setApperanceForLabel:label2];
    label2.text = @"Local";
    [self.scrollView addSubview:label2];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(640, 0, 320, 210)];
    [self setApperanceForLabel:label3];
    label3.text = @"Headlines";
    [self.scrollView addSubview:label3];
}

- (void)setApperanceForLabel:(UILabel *)label {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    label.backgroundColor = color;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:21.0f];
    label.textAlignment = NSTextAlignmentCenter;
}

- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
	NSLog(@"Selected index %ld (via UIControlEventValueChanged)", (long)segmentedControl.selectedSegmentIndex);
}

- (void)uisegmentedControlChangedValue:(UISegmentedControl *)segmentedControl {
	NSLog(@"Selected index %ld", (long)segmentedControl.selectedSegmentIndex);
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger page = scrollView.contentOffset.x / pageWidth;
    
    [self.segmentedControl4 setSelectedSegmentIndex:page animated:YES];
}

@end
