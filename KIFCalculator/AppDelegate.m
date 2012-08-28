
//  Created by Chaise Hocking

#import "AppDelegate.h"
#import "ViewController.h"

#if RUN_KIF_TESTS
#import "KIFCalculatorTestController.h"
#endif

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (void)dealloc
{
	[_window release];
	[_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
	self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] autorelease];
	self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
	
#if RUN_KIF_TESTS
    [[KIFCalculatorTestController sharedInstance] startTestingWithCompletionBlock:^{
        exit([[KIFTestController sharedInstance] failureCount]);
    }];
#endif
	
    return YES;
}

@end
