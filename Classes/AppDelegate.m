#import "AppDelegate.h"

@implementation AppDelegate
@synthesize window, controller;

- (void) applicationDidFinishLaunching: (UIApplication*) application
{
    [window addSubview:controller.view];
    [window makeKeyAndVisible];
}


@end
