
//  Created by Chaise Hocking

#import "KIFTestScenario.h"
#import "KIFTestStep.h"

@implementation KIFTestScenario (CalculatorOperations)

+(id)scenarioToTestThePlusButton{
	KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Ensure that number are summed when using the plus button"];
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
	KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Ensure that number are subtracted when using the minus button"];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"3" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"6" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"-" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"4" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"0" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"=" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToWaitForViewWithAccessibilityLabel:@"Answer"
																	 value:@"-4"
																	traits:UIAccessibilityTraitStaticText]];
	return scenario;
}


+(id)scenarioToTestTheEquationsCanBePiggyBacked{
	KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Ensure that an equation can be performed with mulitple operations"];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"3" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"+" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"6" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"×" traits:UIAccessibilityTraitButton]];
		
	[scenario addStep:[KIFTestStep stepToWaitForViewWithAccessibilityLabel:@"Answer"
																	 value:@"9"
																	traits:UIAccessibilityTraitStaticText]];

	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"7" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"2" traits:UIAccessibilityTraitButton]];
	[scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"=" traits:UIAccessibilityTraitButton]];

	[scenario addStep:[KIFTestStep stepToWaitForViewWithAccessibilityLabel:@"Answer"
																	 value:@"647"
																	traits:UIAccessibilityTraitStaticText]];
	return scenario;
}

@end
