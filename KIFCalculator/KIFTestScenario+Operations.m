
//  Created by Chaise Hocking

#import "KIFTestScenario.h"
#import "KIFTestStep.h"

@implementation KIFTestScenario (Operations)

+(id)scenarioToTestThePlusOperation{
	KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Ensure that when numbers are plussed the sum is shown"];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"5" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"+" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"6" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"=" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToWaitForViewWithAccessibilityLabel:@"Answer"
																	 value:@"11"
																	traits:UIAccessibilityTraitStaticText]];
	return scenario;
}

+(id)scenarioToTestTheMinusOperation{
	KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Ensure that when numbers are subtracted the difference is shown"];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"6" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"-" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"4" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"=" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToWaitForViewWithAccessibilityLabel:@"Answer"
																	 value:@"2"
																	traits:UIAccessibilityTraitStaticText]];
	return scenario;
}

+(id)scenarioToTestTheMultiplyOperation{
	KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Ensure that when numbers are multiplied together the product is shown"];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"3"
																traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"×"
																traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"4"
																traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"="
																traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToWaitForViewWithAccessibilityLabel:@"Answer"
																	 value:@"12"
																	traits:UIAccessibilityTraitStaticText]];
	return scenario;
}

+(id)scenarioToTestTheDivideOperation{
	KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Ensure that when numbers are divided the quotient is shown"];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"9" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"÷" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"3" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"=" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToWaitForViewWithAccessibilityLabel:@"Answer"
																	 value:@"3"
																	traits:UIAccessibilityTraitStaticText]];
	return scenario;
}

@end
