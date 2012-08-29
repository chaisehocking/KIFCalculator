
//  Created by Chaise Hocking

#import "ViewController.h"
#import "FeedbackViewController.h"
typedef enum {
	CalculatorOperatorNone,
	CalculatorOperatorPlus,
	CalculatorOperatorMinus,
	CalculatorOperatorMultiply,
	CalculatorOperatorDivide
}CalculatorOperator;


@interface ViewController ()<UIPopoverControllerDelegate, FeedbackViewControllerDelegate>
@property(nonatomic, retain)IBOutlet UILabel *answerLabel;
@property(nonatomic, assign)CGFloat currentAnswer;
@property(nonatomic, assign)CalculatorOperator currentOperator;
@property(nonatomic, assign)BOOL answerShouldClear;

@property(nonatomic, retain)FeedbackViewController *feedbackViewController;
@property(nonatomic, retain)UIPopoverController *feedbackPopoverController;

@end

@implementation ViewController
@synthesize answerLabel=_answerLabel;
@synthesize currentAnswer=_currentAnswer;
@synthesize currentOperator=_currentOperator;
@synthesize answerShouldClear=_answerShouldClear;
@synthesize feedbackViewController=_feedbackViewController;
@synthesize feedbackPopoverController=_feedbackPopoverController;

#pragma mark - Memory Management
-(void)dealloc{
	_feedbackViewController.delegate = nil;
	[_feedbackViewController release];
	
	[_feedbackPopoverController dismissPopoverAnimated:NO];
	_feedbackPopoverController.delegate = nil;
	[_feedbackPopoverController release];
	
	[_answerLabel release];
	[super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.answerLabel.accessibilityLabel = NSLocalizedString(@"Answer", @"");
}

-(void)viewDidUnload{
	[self dismissFeedbackForm:NO];
	[self destroyFeedbackForm];
	self.answerLabel = nil;
}

#pragma mark - Private Methods
-(void)setAnswerLabelText:(NSString *)text{
	self.answerLabel.text = text;
	self.answerLabel.accessibilityValue = text;
}

-(void)checkForClear{
	if(self.answerShouldClear){
		[self setAnswerLabelText:nil];
		self.answerShouldClear = NO;
	}
}

-(CGFloat)evaluateAnswer{
	CGFloat rightSide = [self.answerLabel.text floatValue];
	switch (self.currentOperator) {
		case CalculatorOperatorPlus:
			return self.currentAnswer + rightSide;
		case CalculatorOperatorMinus:
			return self.currentAnswer - rightSide;
		case CalculatorOperatorMultiply:
			return self.currentAnswer * rightSide;
		case CalculatorOperatorDivide:
			return self.currentAnswer / rightSide;
		default:
			return rightSide;
			break;
	}
}

#pragma mark - Button Actions
-(IBAction)numberButtonPressed:(UIButton *)sender{
	[self checkForClear];
	if([self.answerLabel.text length] > 0){
		[self setAnswerLabelText:[self.answerLabel.text stringByAppendingString:sender.titleLabel.text]];
	}
	else {
		[self setAnswerLabelText:sender.titleLabel.text];
	}
}

-(void)updateCurrentAnswer{
	self.currentAnswer = [self evaluateAnswer];
	[self setAnswerLabelText:[NSString stringWithFormat:@"%g", self.currentAnswer]];
	self.answerShouldClear = YES;
}

-(IBAction)equalsButtonPressed:(UIButton *)sender{
	[self updateCurrentAnswer];
	self.currentOperator = CalculatorOperatorNone;
}

-(IBAction)plusButtonPressed:(UIButton *)sender{
	[self updateCurrentAnswer];
	self.currentOperator = CalculatorOperatorPlus;
}

-(IBAction)minusButtonPressed:(UIButton *)sender{
	[self updateCurrentAnswer];
	self.currentOperator = CalculatorOperatorMinus;
}

-(IBAction)divideButtonPressed:(UIButton *)sender{
	[self updateCurrentAnswer];
	self.currentOperator = CalculatorOperatorDivide;
}

-(IBAction)multiplyButtonPressed:(UIButton *)sender{
	[self updateCurrentAnswer];
	self.currentOperator = CalculatorOperatorMultiply;
}

-(IBAction)infoButtonPressed:(UIButton *)sender{
	if ([[UIScreen mainScreen] bounds].size.width > 320.) {
		[self presentFeedbackFormInPopoverFrom:sender];
	}
	else {
		[self presentFeedbackFormFullScreen];
	}	
}

#pragma mark - UIPopoverViewControllerdelegate Methods
- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController {
	[self destroyFeedbackForm];
}

#pragma mark - FeedbackForm Methods
-(void)createFeedbackForm{
	self.feedbackViewController = [[[FeedbackViewController alloc] initWithNibName:nil bundle:nil] autorelease];
	self.feedbackViewController.delegate = self;
}

-(void)presentFeedbackFormInPopoverFrom:(UIButton *)button{
	[self createFeedbackForm];
	self.feedbackPopoverController = [[[UIPopoverController alloc] initWithContentViewController:self.feedbackViewController] autorelease];
	self.feedbackPopoverController.delegate = self;
	[self.feedbackPopoverController presentPopoverFromRect:button.bounds
													inView:button
								  permittedArrowDirections:UIPopoverArrowDirectionUp
												  animated:YES];
}

-(void)presentFeedbackFormFullScreen{
	[self createFeedbackForm];
	[self presentViewController:self.feedbackViewController
					   animated:YES
					 completion:NULL];

}

-(void)dismissFeedbackForm:(BOOL)animated{
	if(self.feedbackPopoverController){
		[self.feedbackPopoverController dismissPopoverAnimated:animated];
	}
	else {
		[self.feedbackViewController dismissViewControllerAnimated:animated
														completion:NULL];
	}
}

-(void)destroyFeedbackForm{
	self.feedbackViewController.delegate = nil;
	self.feedbackViewController = nil;
	
	self.feedbackPopoverController.delegate = nil;
    self.feedbackPopoverController = nil;
}

#pragma mark - FeedbackViewControllerDelegate Methods
-(void)feedbackSent{
	
	[[[[UIAlertView alloc] initWithTitle:@"Thanks for Your Feedback"
								message:nil
							   delegate:nil
					  cancelButtonTitle:@"OK"
					  otherButtonTitles:nil] autorelease] show];
	
	[self dismissFeedbackForm:YES];
	[self destroyFeedbackForm];
}

-(void)feedbackCanceled{
	[self dismissFeedbackForm:YES];
	[self destroyFeedbackForm];
}

@end
