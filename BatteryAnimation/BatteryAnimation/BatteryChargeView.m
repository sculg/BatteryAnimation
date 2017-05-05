//
//  BatteryChargeView.m
//  BatteryAnimation
//
//  Created by clou on 16/4/22.
//  Copyright © 2016年 sculg. All rights reserved.
//

#define kDeviceWidth [UIScreen mainScreen].bounds.size.width
#define KDeviceHeight [UIScreen mainScreen].bounds.size.height

#import "BatteryChargeView.h"
@implementation BatteryChargeView{
    
    UIColor  *_batteryChargeColor;
    float    currentLength,green;
    BOOL     increase;
    NSString *name;
}


-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        increase = NO;
        currentLength = 40;
        [self setBackgroundColor:[UIColor clearColor]];
        
        _timer =[NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(animationOfCharge) userInfo:nil repeats:YES];
    }
    return self;
}
    //动画关键部分
-(void)animationOfCharge{
    
    if (currentLength < kDeviceWidth-148) {
        currentLength =currentLength+1 +currentLength/240;
        green = currentLength/240+0.5;
    }
    else{
        currentLength = 40;
    }
    _batteryChargeColor = [UIColor colorWithRed:0.0/255 green:green blue:0.0/255 alpha:1.0];
    //用于调用drawRect：方法，NSTimer每调用一次，执行该方法重绘一次，频率50的时候，就形成了在动的感觉
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect{
    
    CGContextRef content  = UIGraphicsGetCurrentContext();
    
    //电池的柱体部分
    CGMutablePathRef path1 = CGPathCreateMutable();
    CGContextSetLineWidth(content, 4);
    CGContextSetFillColorWithColor(content, [[UIColor colorWithRed:84.0/255 green:92.0/255 blue:120.0/255 alpha:1.0] CGColor]);
    CGContextMoveToPoint(content,kDeviceWidth*0.5, 80);
    CGContextAddArcToPoint(content,kDeviceWidth-90,80,kDeviceWidth-90,100,5);
    CGContextAddArcToPoint(content,kDeviceWidth-90,160,kDeviceWidth*0.5,145,5);
    CGContextAddArcToPoint(content,80,160,60,120,5);
    CGContextAddArcToPoint(content,78,78,kDeviceWidth*0.5,80,5);
    CGContextAddArcToPoint(content,kDeviceWidth-90,80,kDeviceWidth-90,100,5);
    [[UIColor colorWithRed:222.0/255 green:222.0/255 blue:222.0/255 alpha:1.0] setStroke];
    CGContextAddPath(content, path1);
    CGContextFillPath(content);
    CGContextDrawPath(content, kCGPathStroke);
    CGPathRelease(path1);
    
    //电池的突出部分
    CGMutablePathRef path2 = CGPathCreateMutable();
    CGContextSetLineWidth(content, 4);
    CGContextSetFillColorWithColor(content, [[UIColor colorWithRed:84.0/255 green:92.0/255 blue:120.0/255 alpha:1.0] CGColor]);
    CGContextMoveToPoint(content,kDeviceWidth-87, 120);
    CGContextAddLineToPoint(content, kDeviceWidth-87, 95);
    CGContextAddArcToPoint(content,kDeviceWidth-70,95,kDeviceWidth-70,110,15);
    CGContextAddLineToPoint(content,kDeviceWidth-70, 130);
    CGContextAddArcToPoint(content,kDeviceWidth-70,145,kDeviceWidth-87,145,15);
    CGContextAddLineToPoint(content,kDeviceWidth-87, 145);
    [[UIColor colorWithRed:68.0/255 green:74.0/255 blue:101.0/255 alpha:1.0] setStroke];
    CGContextAddPath(content, path2);
    CGContextFillPath(content);
    CGContextDrawPath(content, kCGPathStroke);
    CGPathRelease(path2);
    
    //绿色的电量动画部分
    CGMutablePathRef path = CGPathCreateMutable();
    CGContextSetLineWidth(content, 1);
    CGContextSetFillColorWithColor(content, [_batteryChargeColor CGColor]);
    //电量动画的Max_x部分随时间的变化而变化，最小值为40
    float x = 40+currentLength;
    CGPathMoveToPoint(path,NULL, 84, 84);
    CGPathAddLineToPoint(path, nil, x, 84);
    CGPathAddLineToPoint(path, nil, x, 156);
    CGPathAddLineToPoint(path, nil, 84, 156);
    CGPathAddLineToPoint(path, nil, 84, 84);
    
    CGContextAddPath(content, path);
    CGContextFillPath(content);
    CGContextDrawPath(content, kCGPathStroke);
    CGPathRelease(path);
    
}

@end
