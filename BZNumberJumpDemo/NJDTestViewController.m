//
//  NJDTestViewController.m
//  BZNumberJumpDemo
//
//  Created by Bruce on 14-7-1.
//  Copyright (c) 2014年 com.Bruce.Number. All rights reserved.
//

#import "NJDTestViewController.h"
#import "CATextLayer+NumberJump.h"
#import "UICountingLabel.h"
#import "DisplayerView.h"
#import "HTPressableButton.h"
#import "UIColor+HTColor.h"
#import "SpeakerView.h"

@interface NJDTestViewController ()

@property (nonatomic, strong) UICountingLabel *countLabel;
@property (nonatomic, strong) DisplayerView *displayerView;
@property (nonatomic, strong) HTPressableButton *roundedRectButton;
@property (nonatomic, strong) SpeakerView *speakView;

@end

@implementation NJDTestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initUI {
    //[self initTextLayer];
    //[self initButton];
    //[self initCountLable];
    [self initDisplayView];
    [self initRoundRectButton];
    //[self initSpeakView];
}

- (void)initSpeakView
{
    _speakView = [[SpeakerView alloc] initWithFrame:CGRectMake(10, 300, 50, 80)];

    [self.view addSubview:_speakView];
}

- (void)initDisplayView
{
    _displayerView = [[DisplayerView alloc] initWithFrame:CGRectMake(10, 80, 25*8 + 20 + 20, 55)];
    
    _displayerView.backgroundColor = [UIColor cloudsColor];
    _displayerView.layer.cornerRadius = 8;
    _displayerView.layer.masksToBounds = YES;
    //给图层添加一个有色边框
    _displayerView.layer.borderWidth = 3;
    
    _displayerView.layer.borderColor = [[UIColor colorWithRed:0.52 green:0.09 blue:0.07 alpha:1] CGColor];
    
    [self.view addSubview:_displayerView];
    
}

- (void)initCountLable
{
    _countLabel = [[UICountingLabel alloc] initWithFrame:CGRectMake(10, 80, 25, 35)];
    
    _countLabel.backgroundColor = [UIColor grayColor];
    _countLabel.method = UILabelCountingMethodEaseOut;
    _countLabel.format = @"%d";
    _countLabel.font = [UIFont boldSystemFontOfSize:35];
    _countLabel.textAlignment = NSTextAlignmentCenter;
    _countLabel.textColor = [UIColor colorWithRed:0.20 green:0.70 blue:1.0 alpha:1.0];
    _countLabel.glowColor = _countLabel.textColor;
    _countLabel.glowOffset = CGSizeMake(0.0, 0.0);
    _countLabel.glowAmount = 10;
    
    [self.view addSubview:_countLabel];
}

- (void)initTextLayer {
    textLayer = [[CATextLayer alloc] init];
    textLayer.string = @"0";
    textLayer.frame = CGRectMake(10, 80, 300, 100);
    textLayer.backgroundColor = [UIColor blackColor].CGColor;
    [self.view.layer addSublayer:textLayer];
}

- (void)initButton {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, 200, 100, 50)];
    [button setBackgroundColor:[UIColor greenColor]];
    [button addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button setTitle:@"Click" forState:UIControlStateNormal];
}

- (void)initRoundRectButton
{
//    _roundedRectButton = [HTPressableButton buttonWithType:UIButtonTypeCustom];
//    _roundedRectButton.frame = CGRectMake(10, 200, 80, 80);
//    _roundedRectButton.buttonColor = [UIColor clearColor];
//    _roundedRectButton.shadowColor = [UIColor grapeFruitDarkColor];
//    _roundedRectButton.style = HTPressableButtonStyleRounded;
//    
//    [_roundedRectButton setTitle:@"Rounded" forState:UIControlStateNormal];
//    [_roundedRectButton addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:_roundedRectButton];
//    
//    _speakView = [[SpeakerView alloc] initWithFrame:CGRectMake(0, 0, 50, 80)];
//    
//    //_speakView.center = _roundedRectButton.center;
//    
//    [_roundedRectButton addSubview:_speakView];
    
    UIButton *displayerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    displayerBtn.frame = CGRectMake(10, 200, 100, 100);
    displayerBtn.backgroundColor = [UIColor clearColor];
    displayerBtn.layer.cornerRadius = 8;
    displayerBtn.layer.masksToBounds = YES;
    //给图层添加一个有色边框
    displayerBtn.layer.borderWidth = 3;
    
    displayerBtn.layer.borderColor = [[UIColor colorWithRed:0 green:0.2 blue:0.07 alpha:1] CGColor];
    
    _speakView = [[SpeakerView alloc] initWithFrame:CGRectMake(0, 0, 50, 80)];
    _speakView.userInteractionEnabled = NO;
    
    CGPoint point = CGPointMake(50, 50);
    
    _speakView.center = point;
    
    [displayerBtn addTarget:self action:@selector(recordButtonTouchDown) forControlEvents:UIControlEventTouchDown];
    [displayerBtn addTarget:self action:@selector(recordButtonTouchUpInside) forControlEvents:UIControlEventTouchUpInside|UIControlEventTouchUpOutside];
    
    [displayerBtn addSubview:_speakView];
    
    [self.view addSubview:displayerBtn];

}

- (void)recordButtonTouchDown
{
    NSLog(@"recordButtonTouchDown");
}

- (void)recordButtonTouchUpInside
{
    NSLog(@"recordButtonTouchUpInside");
}



- (void)onClick {
//    [textLayer jumpNumber];
//    [textLayer jumpNumberWithDuration:5 fromNumber:0 toNumber:1000];
//    [_countLabel countFrom:0 to:1 withDuration:1.0];
    
    NSString *finalNumStr = @"12345678";
    
    [_displayerView updateNumStringWith:finalNumStr];
    
    
}

@end
