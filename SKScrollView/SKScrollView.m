//
//  SKScrollView.m
//  
//
//  Created by Square on 14/11/5.
//  Copyright (c) 2014年 RedSino. All rights reserved.
//

#import "SKScrollView.h"
#import <SpriteKit/SpriteKit.h>

@interface SKScrollView ()
@property (nonatomic, strong) NSMutableDictionary *mdicSelector;
@end

@implementation SKScrollView


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
//    UIView *hitView = [super hitTest:point withEvent:event];
    //if (hitView == self) return nil;
    
    SKView *skview = (SKView *)(self.superview);
    
//    NSLog(@"point:%f,%f",point.x,point.y);
    
    CGPoint p_in_skview = [self convertPoint:point toView:skview];
    
    if ([self checkFallThrough:p_in_skview])
    {
        return nil;
    }
    else
    {
        return self;
    }
    
}



- (void)addTarget:(id)target selector:(SEL)selector withObject:(id)object
{
    //check whether selector is already saved, otherwise it will get called twice
    
    _mdicSelector = [[NSMutableDictionary alloc]init];
    
    [_mdicSelector setObject:target forKey:@"target"];
    [_mdicSelector setObject:[NSValue valueWithPointer:selector] forKey:@"selector"];
    
    if (object)
    {
        [_mdicSelector setObject:object forKey:@"object"];
    }
    
}

- (BOOL)checkFallThrough:(CGPoint)pointInSKView
{
    if (!_mdicSelector)
    {
        return false;
    }

    id target = [_mdicSelector objectForKey:@"target"];
    
    SEL selector = [[_mdicSelector objectForKey:@"selector"]pointerValue];
    
    id object = [_mdicSelector objectForKey:@"object"];
    if (!object)
    {
        object = [NSMutableDictionary dictionary];
    }
    [object setValue:[NSValue valueWithCGPoint:pointInSKView] forKey:@"point"];
    
    IMP imp = [target methodForSelector:selector];
    
    if (object)
    {
        bool (*func)(id, SEL, id) = (void*)imp;
        return (func (target, selector, object));
    }
    else
    {
        bool (*func)(id, SEL) = (void *)imp;
        return (func(target, selector));
    }

}

@end
