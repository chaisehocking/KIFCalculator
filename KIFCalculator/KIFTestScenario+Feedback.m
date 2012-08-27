
//  Created by Chaise Hocking

#import "KIFTestScenario.h"
#import "KIFTestStep.h"

@implementation KIFTestScenario (Feedback)
+(id)scenarioToTestTheFeedbackFormDisplays{
	KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Test that a feedback form is displayed"];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"Feedback" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToWaitForViewWithAccessibilityLabel:@"Feedback Form"]];
	return scenario;
}

+(id)scenarioToTestThatSubmitingTheFeedbackFormPostsTheFeedback{
	KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Test that the feedback form is posted when the submit button is pressed"];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"Feedback" traits:UIAccessibilityTraitButton]];
	
	[scenario addStep:[KIFTestStep stepToEnterText:@"Joe Blogs"
					intoViewWithAccessibilityLabel:@"Name"
											traits:UIAccessibilityTraitNone
									expectedResult:@"Joe Blogss"]];
	
	[scenario addStep:[KIFTestStep stepToEnterText:@"Joe.Blogs@gmail.com"
					intoViewWithAccessibilityLabel:@"Email"
											traits:UIAccessibilityTraitNone
									expectedResult:@"Joe.Blogs@gmail.com"]];
	
	[scenario addStep:[KIFTestStep stepToSwipeViewWithAccessibilityLabel:@"Feedback Form" inDirection:KIFSwipeDirectionUp]];
	[scenario addStep:[KIFTestStep stepToSetOn:YES forSwitchWithAccessibilityLabel:@"Require Response"]];
	
	NSString *message = @"Hi,\nI just wanted to tell you that Swipe Conference 2012 ROCKS!";
	[scenario addStep:[KIFTestStep stepToEnterText:message
					intoViewWithAccessibilityLabel:@"Feedback Message"
											traits:UIAccessibilityTraitNone expectedResult:message]];
	
	[scenario addStep:[KIFTestStep stepToWaitForNotificationName:@"kFeedbackPostedNotification"
														  object:nil
											  whileExecutingStep:
					   [KIFTestStep stepToTapViewWithAccessibilityLabel:@"Submit" traits:UIAccessibilityTraitButton]]];
	
	[scenario addStep:[KIFTestStep stepToWaitForAbsenceOfViewWithAccessibilityLabel:@"Feedback Form"]];
	return scenario;
}

+(id)scenarioToTestThatCancellingTheFeedbackFormDismissesIt{
	KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Test that the feedback form is dismissed when the cancel button is pressed"];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"Feedback" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"Cancel" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToWaitForAbsenceOfViewWithAccessibilityLabel:@"Feedback Form"]];
	return scenario;
}
@end
