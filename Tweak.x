#import <UIKit/UIKit.h>
@interface _UIStatusBarStringView : UIView
@property (copy) NSString *text;
//@property NSInteger numberOfLines;
@property (copy) UIFont *font;
//@property NSInteger textAlignment;
@end

  %hook _UIStatusBarStringView


- (void)setText:(NSString *)text {
	if([text containsString:@":"]) {
		NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
		NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
		dateFormatter1.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
		dateFormatter2.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
		dateFormatter1.dateFormat = @"h:mm";
		dateFormatter2.dateFormat = @"a d EE";
		NSDate *now = [NSDate date];
		NSString *date1 = [dateFormatter1 stringFromDate:now];
		NSString *date2 = [dateFormatter2 stringFromDate:now];
		//shortDate = [shortDate substringToIndex:[shortDate length]-3];
		NSString *newString = [NSString stringWithFormat:@"%@ %@", date1, date2];
//		self.numberOfLines = 1;
//		self.textAlignment = 1;
		[self setFont: [UIFont fontWithName:@"Helvetica-Bold" size:15]];
		%orig(newString);
	}
  /*else if([text containsString:@"%%"]) {
    [self setFont: [UIFont boldSystemFontOfSize:15]];
  }*/
	else {
		%orig(text);
	}
}

%end

/*@interface _UIStatusBarTimeItem
@property (copy) _UIStatusBarStringView *shortTimeView;
@property (copy) _UIStatusBarStringView *pillTimeView;
@end

%hook _UIStatusBarTimeItem

- (id)applyUpdate:(id)arg1 toDisplayItem:(id)arg2 {
	id returnThis = %orig;
	[self.shortTimeView setFont: [self.shortTimeView.font fontWithSize:15]];
	[self.pillTimeView setFont: [self.pillTimeView.font fontWithSize:15]];
	return returnThis;
}

%end*/

/*@interface _UIStatusBarBackgroundActivityView : UIView
@property (copy) CALayer *pulseLayer;
@end

%hook _UIStatusBarBackgroundActivityView

- (void)setCenter:(CGPoint)point {
	point.y = 11;
	self.frame = CGRectMake(0, 0, self.frame.size.width, 31);
	self.pulseLayer.frame = CGRectMake(0, 0, self.frame.size.width, 31);
	%orig(point);
}

%end*/
