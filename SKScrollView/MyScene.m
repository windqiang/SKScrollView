//
//  MyScene.m
//  SKScrollView
//
//  Created by Square on 14/11/5.
//  Copyright (c) 2014年 zhaogq. All rights reserved.
//

#import "MyScene.h"
#import "SKScrollView.h"

@interface MyScene ()
@property (nonatomic, strong) SKSpriteNode *root;
@end

@implementation MyScene

- (void)didMoveToView:(SKView *)view
{
    _root = [SKSpriteNode spriteNodeWithImageNamed:@"root.jpeg"];
    [_root setAnchorPoint:CGPointZero];
    [self addChild:_root];
    
    SKSpriteNode *china = [SKSpriteNode spriteNodeWithImageNamed:@"China.png"];
    [china setPosition:CGPointMake(self.size.width/2, self.size.height/2)];
    [china setName:@"China"];
    [_root addChild:china];
    
    SKScrollView *scroller = [[SKScrollView alloc]initWithFrame:self.frame];
    [scroller setContentSize:CGSizeMake(_root.size.width, scroller.frame.size.height)];
    [scroller setDelegate:self];
    [scroller addTarget:self selector:@selector(checkFallThrough:) withObject:nil];
    [self.view addSubview:scroller];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _root.position = CGPointMake(-scrollView.contentOffset.x, _root.position.y);
    
}

- (BOOL)checkFallThrough:(id)object
{
    NSDictionary *dict = (NSDictionary *)object;
    CGPoint point = [[dict valueForKey:@"point"] CGPointValue];
    
    SKNode *node = [self nodeAtPointInView:point InParent:_root];
    if ([node.name isEqualToString: @"China"])
    {
//        NSLog(@"press %@",node.name);
        return YES;
    }
    else
    {
        return NO;
    }
}

- (SKNode *)nodeAtPointInView:(CGPoint)touchPointInView InParent:(SKNode *)parent
{
    CGPoint touchPointInScene = [self convertPointFromView:touchPointInView];
    CGPoint touchPointInParent = [self convertPoint:touchPointInScene toNode:parent];
    
    SKNode *node = [parent nodeAtPoint:touchPointInParent];
    
    return node;
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint pointNode = [touch locationInNode:self];
    NSLog(@"scene is touched!!!");
    
}

@end
