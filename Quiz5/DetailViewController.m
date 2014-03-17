//
//  DetailViewController.m
//  Quiz5
//
//  Created by Steve Chakif on 3/14/14.
//  Copyright (c) 2014 Steve Chakif. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.nameTextField setText:_task.taskName];
    [self.urgencyLabel setText:[NSString stringWithFormat:@"Urgency: %.2f",_task.urgency]];
    self.urgencySlider.value = _task.urgency;
    self.datePicker.date = _task.dueDate;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    _task.taskName = self.nameTextField.text;
    _task.urgency = self.urgencySlider.value;
    _task.dueDate = self.datePicker.date;
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)sliderChanged:(id)sender {
    UISlider *s = sender;
    [self.urgencyLabel setText:[NSString stringWithFormat:@"Urgency: %.2f",s.value]];
    
}

@end
