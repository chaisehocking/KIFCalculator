
//  Created by Chaise Hocking

#import "FeedbackViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface FeedbackViewController ()
@property(nonatomic, retain)IBOutlet UITextField *nameField;
@property(nonatomic, retain)IBOutlet UITextField *emailField;
@property(nonatomic, retain)IBOutlet UISwitch *requireResponseSwitch;
@property(nonatomic, retain)IBOutlet UITextView *feedbackField;
@property(nonatomic, retain)IBOutlet UIScrollView *scrollView;
@end

@implementation FeedbackViewController
@synthesize nameField=_nameField;
@synthesize emailField=_emailField;
@synthesize requireResponseSwitch=_requireResponseSwitch;
@synthesize feedbackField=_feedbackField;
@synthesize scrollView=_scrollView;

-(void)dealloc{
	[_nameField release];
	[_emailField release];
	[_requireResponseSwitch release];
	[_feedbackField release];
	[_scrollView release];
	[super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.feedbackField.layer.borderWidth = 1.;
	self.feedbackField.layer.cornerRadius = 8.;
	self.feedbackField.layer.borderColor = [UIColor darkGrayColor].CGColor;
	self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width, 
											 CGRectGetMaxY(self.feedbackField.frame) + 75);
	
	self.scrollView.accessibilityLabel = NSLocalizedString(@"Feedback Form", @"");
}

- (void)viewDidUnload
{
    [super viewDidUnload];
	self.nameField = nil;
	self.emailField = nil;
	self.requireResponseSwitch = nil;
	self.feedbackField = nil;
	self.scrollView = nil;
	
}

-(IBAction)submitButtonPressed:(UIButton *)sender{
	[[NSNotificationCenter defaultCenter] postNotificationName:kFeedbackPostedNotification object:self];
	[self.presentingViewController dismissViewControllerAnimated:YES
													  completion:NULL];
}

-(IBAction)cancelButtonPressed:(UIButton *)sender{
	[self.presentingViewController dismissViewControllerAnimated:YES
													  completion:NULL];
}

@end
