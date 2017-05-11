//
//  DisplayerView.m
//  BZNumberJumpDemo
//
//  Created by zuoyongyong on 2017/4/25.
//  Copyright © 2017年 com.Bruce.Number. All rights reserved.
//

#import "DisplayerView.h"
#import "UICountingLabel.h"

#define  CountLabelWidth  25
#define  CountLabelHeight 35

@interface DisplayerView()

@property (nonatomic, strong) NSMutableArray *arrayCountLabel;

@end

@implementation DisplayerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        //CGRect newFrame = CGRectMake(frame.origin.x, frame.origin.y, 8*CountLabelWidth, CountLabelHeight);
        [self setupSubViewWithFrame:frame];
    }
    
    return self;
}


- (void)setupSubViewWithFrame:(CGRect)superFrame
{
    CGFloat width = CountLabelWidth, height = CountLabelHeight;
    
    for (int i = 0; i < 8; i++) {
        
        CGFloat x = i*width + 20;
        CGFloat y = 10;
        
        CGRect rectFrame = CGRectMake(x, y, width, height);
        
        UICountingLabel *countingLabel = [[UICountingLabel alloc] initWithFrame:rectFrame];
        
        //countingLabel.text = @"8";
        countingLabel.method = UILabelCountingMethodEaseInOut;
        countingLabel.format = @"%d";
        countingLabel.text = @"8";
        countingLabel.font = [UIFont boldSystemFontOfSize:35];
        countingLabel.textAlignment = NSTextAlignmentCenter;
        countingLabel.textColor = [UIColor blackColor];
        countingLabel.glowColor = countingLabel.textColor;
        countingLabel.glowOffset = CGSizeMake(5.0, 5.0);
        countingLabel.glowAmount = 1;

        
        [self addSubview:countingLabel];
        

        
        [self.arrayCountLabel addObject:countingLabel];
        
    }
    
}


- (NSMutableArray *)arrayCountLabel
{
    if(_arrayCountLabel == nil)
    {
        _arrayCountLabel = [NSMutableArray array];
    }
    
    return _arrayCountLabel;
}


#pragma mark custom function

- (void)updateNumStringWith:(NSString *)finalNumStr
{
    for(int i=0;i < finalNumStr.length;i++){
        NSInteger number = [finalNumStr characterAtIndex:i] - '0';
        UICountingLabel *countLabel= self.arrayCountLabel[i];
        
        [countLabel countFrom:0 to:number withDuration:2.0];
    }

}

@end
