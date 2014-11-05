//
//  SKScrollView.h
//  
//
//  Created by Square on 14/11/5.
//  Copyright (c) 2014年 RedSino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKScrollView : UIScrollView
- (void)addTarget:(id)target selector:(SEL)selector withObject:(id)object;

@end
