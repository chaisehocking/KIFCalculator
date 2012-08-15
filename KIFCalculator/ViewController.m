//
//  ViewController.m
//  KIFCalculator
//
//  Created by Chaise Hocking on 15/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

typedef enum {
	operatorNone,
	operatorPlus,
	operatorMinus,
	operatorMultiply,
	operatorDivide
}calculatorOperator;


@interface ViewController ()
@property(nonatomic, retain)IBOutlet UILabel *answerLabel;
@property(nonatomic, assign)CGFloat currentAnswer;
@property(nonatomic, assign)calculatorOperator currentOperator;
@property(nonatomic, assign)BOOL answerShouldClear;
@end

@implementation ViewController
@synthesize answerLabel=_answerLabel;
@synthesize currentAnswer=_currentAnswer;
@synthesize currentOperator=_currentOperator;
@synthesize answerShouldClear=_answerShouldClear;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)checkForClear{
	if(self.answerShouldClear){
		self.answerLabel.text = nil;
		self.answerShouldClear = NO;
	}
}

-(IBAction)numberButtonPressed:(UIButton *)sender{
	[self checkForClear];
	if([self.answerLabel.text length] > 0){
		self.answerLabel.text = [self.answerLabel.text stringByAppendingString:sender.titleLabel.text];
	}
	else {
		self.answerLabel.text = sender.titleLabel.text;
	}
}

-(CGFloat)evaluateAnswer{
	CGFloat rightSide = [self.answerLabel.text floatValue];
	switch (self.currentOperator) {
		case operatorPlus:
			return self.currentAnswer + rightSide;
		case operatorMinus:
			return self.currentAnswer - rightSide;
		case operatorMultiply:
			return self.currentAnswer * rightSide;
		case operatorDivide:
			return self.currentAnswer / rightSide;
		default:
			return rightSide;
			break;
	}
}

-(void)updateCurrentAnswer{
	self.currentAnswer = [self evaluateAnswer];
	self.answerLabel.text = [NSString stringWithFormat:@"%f", self.currentAnswer];
	self.answerShouldClear = YES;
}

-(IBAction)equalsButtonPressed:(UIButton *)sender{
	[self updateCurrentAnswer];
	self.currentOperator = operatorNone;
}

-(IBAction)plusButtonPressed:(UIButton *)sender{
	[self updateCurrentAnswer];
	self.currentOperator = operatorPlus;
}

-(IBAction)minusButtonPressed:(UIButton *)sender{
	[self updateCurrentAnswer];
	self.currentOperator = operatorMinus;
}

-(IBAction)divideButtonPressed:(UIButton *)sender{
	[self updateCurrentAnswer];
	self.currentOperator = operatorDivide;
}

-(IBAction)multiplyButtonPressed:(UIButton *)sender{
	[self updateCurrentAnswer];
	self.currentOperator = operatorMultiply;
}

@end
