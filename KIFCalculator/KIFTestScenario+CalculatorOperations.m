
//  Created by Chaise Hocking

#import "KIFTestScenario.h"
#import "KIFTestStep.h"

@implementation KIFTestScenario (CalculatorOperations)

+(id)scenarioToTestThePlusButton{
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

+(id)scenarioToTestTheMinusButton{
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

+(id)scenarioToTestTheMultiplyButton{
	KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Ensure that when numbers are multiplied the product is shown"];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"3" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"×" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"4" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"=" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToWaitForViewWithAccessibilityLabel:@"Answer"
																	 value:@"12"
																	traits:UIAccessibilityTraitStaticText]];
	return scenario;
}

+(id)scenarioToTestTheDivideButton{
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
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"*" traits:UIAccessibilityTraitButton]];
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
