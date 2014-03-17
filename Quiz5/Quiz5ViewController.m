//
//  Quiz5ViewController.m
//  Quiz5
//
//  Created by Steve Chakif on 3/14/14.
//  Copyright (c) 2014 Steve Chakif. All rights reserved.
//

#import "Quiz5ViewController.h"
#import "DetailViewController.h"
#import "Tasks.h"

@interface Quiz5ViewController ()

@end

@implementation Quiz5ViewController {
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    tasks = [[NSMutableArray alloc] init];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    for (int i=0; i<10; i++) {
        Tasks *task = [[Tasks alloc] init];
        [task setTaskName:[NSString stringWithFormat:@"Task %d",i]];
        [task setUrgency:i];
        [task setDueDate:[NSDate dateWithTimeIntervalSinceNow:60.0*60.0*24.0*i]];
        [tasks addObject:task];
    }
    
}

-(void)viewWillAppear:(BOOL)animated {
    [tasks sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        Tasks *t1 = obj1;
        Tasks *t2 = obj2;
        return [t1.dueDate compare:t2.dueDate];
    }];
    [[self tableView] reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"TaskCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    
    Tasks *t = [tasks objectAtIndex:[indexPath row]];
    [cell.textLabel setText:[t taskName]];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    
    UIColor *taskColor = [UIColor colorWithRed:t.urgency/10.0 green:1.0-(t.urgency/10.0) blue:0.0 alpha:0.5];
    [cell.contentView setBackgroundColor:taskColor];
    [cell.detailTextLabel setBackgroundColor:[UIColor clearColor]];
    [cell.textLabel setBackgroundColor:[UIColor clearColor]];
    
    [cell.detailTextLabel setText:[dateFormatter stringFromDate:t.dueDate]];
    if (t.urgency > 6) {
        [[cell imageView] setImage:[UIImage imageNamed:@"urgent.jpg"]];
    } else {
        [[cell imageView] setImage: nil];
    }
    return cell;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showTaskDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailViewController *destViewController = segue.destinationViewController;
        Tasks *t = [tasks objectAtIndex:[indexPath row]];
        destViewController.task = t;
    }
}


@end
