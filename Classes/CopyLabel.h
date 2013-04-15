@interface CopyLabel : UILabel {
    SEL copyAction;
    id copyTarget;
}
- (void)setTarget:(id)target forCopyAction:(SEL)action;
@end