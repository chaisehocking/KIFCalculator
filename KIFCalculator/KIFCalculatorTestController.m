
//  Created by Chaise Hocking

#import "KIFCalculatorTestController.h"
#import "ViewController.h"
@implementation KIFCalculatorTestController
-(void)initializeScenarios{
	[KIFTestScenario setDefaultStepsToSetUp:[NSArray arrayWithObject:[KIFTestStep stepWithDescription:@"Dismiss any modal controllers"
																					   executionBlock:^KIFTestStepResult(KIFTestStep *step, NSError **error) {
																						   [UIApplication sharedApplication].keyWindow.rootViewController = [[[ViewController alloc] init] autorelease];
																						   return KIFTestStepResultSuccess;
																					   }]]];
	
	[super initializeScenarios];
}
@end
