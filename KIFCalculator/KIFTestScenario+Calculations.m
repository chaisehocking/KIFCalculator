
//  Created by Chaise Hocking

#import "KIFTestScenario.h"
#import "KIFTestStep.h"

@implementation KIFTestScenario (Calculations)

+(id)scenarioToTestTheEquationsCanBePiggyBacked{
	KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Ensure that an equation can be performed with more than one operations"];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"3" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"+" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"6" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"×" traits:UIAccessibilityTraitButton]];
	
	[scenario addStep:[KIFTestStep stepToWaitForViewWithAccessibilityLabel:@"Answer"
																	 value:@"9"
																	traits:UIAccessibilityTraitStaticText]];
	
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"7" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"=" traits:UIAccessibilityTraitButton]];
	
	[scenario addStep:[KIFTestStep stepToWaitForViewWithAccessibilityLabel:@"Answer"
																	 value:@"63"
																	traits:UIAccessibilityTraitStaticText]];
	return scenario;
}

+(id)scenarioToTestNegativeNumber{
	KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Ensure that negtive numbers are shown"];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"4" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"-" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"9" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"=" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToWaitForViewWithAccessibilityLabel:@"Answer"
																	 value:@"-5"
																	traits:UIAccessibilityTraitStaticText]];
	return scenario;
}

+(id)scenarioToTestDecimalsAreShown{
	KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Ensure that decimal numbers are shown"];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"7" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"÷" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"5" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"=" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToWaitForViewWithAccessibilityLabel:@"Answer"
																	 value:@"1.4"
																	traits:UIAccessibilityTraitStaticText]];
	return scenario;
}

+(id)scenarioToTestMultipleDigits{
	KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Ensure that numbers with multiple digits can be entered and calculated"];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"1" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"2" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"×" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"3" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"4" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"5" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"=" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToWaitForViewWithAccessibilityLabel:@"Answer"
																	 value:@"4140"
																	traits:UIAccessibilityTraitStaticText]];
	return scenario;
}

@end
