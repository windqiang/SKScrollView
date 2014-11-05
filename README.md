SKScrollView
============

UIScrollview added in SKView, which is upon the scene, and can trigger touch events or buttons as you wish

There is no scrollview in spritekit, we have to use UIScrollView, which can be only added in SKView.
We can simply move nodes in - (void)scrollViewDidScroll:(UIScrollView *)scrollView, but we cannot handle touch any more, because the scrollview intercept it.

Fortunately, I find 
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event

This function can decide whether scrollview should handle the touch, or fall through it to SKView.
We need to write selector to tell the SKScrollView when we are scrolling, and when we are justing pressing button.

I am new to ios, so there must be a lot of problem in this project. Please don't laugh at me, I just hope these code can help others.
