#import "CopyLabel.h"

@implementation CopyLabel

#pragma mark Initialization

- (void) attachTapHandler
{
    [self setUserInteractionEnabled:YES];
    UIGestureRecognizer *touchy = [[UILongPressGestureRecognizer alloc]
        initWithTarget:self action:@selector(handleTap:)];
    [self addGestureRecognizer:touchy];
}

- (id) initWithFrame: (CGRect) frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self attachTapHandler];

    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self attachTapHandler];
    }
    return self;
}

- (void)setTarget:(id)target forCopyAction:(SEL)action{
    copyTarget = target;
    copyAction = action;
}
#pragma mark Clipboard

- (void) copy: (id) sender
{
    if (copyTarget) {
        if ([copyTarget respondsToSelector:copyAction]) {
            [copyTarget performSelector:copyAction withObject:self];
        }
    } else {
        [[UIPasteboard generalPasteboard] setString:self.text];
    }

}

- (BOOL) canPerformAction: (SEL) action withSender: (id) sender
{
    return (action == @selector(copy:));
}

- (void) handleTap: (UIGestureRecognizer*) recognizer
{
    [self becomeFirstResponder];
    UIMenuController *menu = [UIMenuController sharedMenuController];
    if ([menu isMenuVisible]) {
    } else {
        [menu setTargetRect:self.frame inView:self.superview];
        [menu setMenuVisible:YES animated:YES];
    }

}

- (BOOL) canBecomeFirstResponder
{
    return YES;
}

@end
