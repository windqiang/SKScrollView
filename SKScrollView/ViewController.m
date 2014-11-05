//
//  ViewController.m
//  SKScrollView
//
//  Created by Square on 14/11/5.
//  Copyright (c) 2014年 zhaogq. All rights reserved.
//

#import "ViewController.h"
#import <SpriteKit/SpriteKit.h>
#import "MyScene.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    SKView *gameView = [[SKView alloc]initWithFrame:self.view.frame];
    [gameView setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:gameView];
    gameView.showsDrawCount = YES;
    gameView.showsNodeCount = YES;
    gameView.showsFPS = YES;
    
    MyScene *scene = [[MyScene alloc]initWithSize:CGSizeMake(320, 480)];
    [gameView presentScene:scene];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
