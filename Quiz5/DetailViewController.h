//
//  DetailViewController.h
//  Quiz5
//
//  Created by Steve Chakif on 3/14/14.
//  Copyright (c) 2014 Steve Chakif. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tasks.h"

@interface DetailViewController : UIViewController <UITextFieldDelegate>


@property (nonatomic, retain) Tasks *task;
- (IBAction)save:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UILabel *urgencyLabel;
@property (weak, nonatomic) IBOutlet UISlider *urgencySlider;
- (IBAction)sliderChanged:(id)sender;


@end
