
//  Created by Chaise Hocking

#import <UIKit/UIKit.h>

@protocol FeedbackViewControllerDelegate <NSObject>

-(void)feedbackSent;
-(void)feedbackCanceled;

@end

@interface FeedbackViewController : UIViewController
@property(nonatomic, assign)id<FeedbackViewControllerDelegate> delegate;
@end
