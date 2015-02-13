//
//  DetailViewController.m
//  DayX
//
//  Created by Devin Eror on 1/13/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"
#import "EntryController.h"

@interface DetailViewController () <UITextFieldDelegate, UITextViewDelegate>

@property (nonatomic, strong) Entry *entry;

@property (strong, nonatomic) IBOutlet UITextField *textBox;
@property (strong, nonatomic) IBOutlet UITextView *contentBox;
@property (nonatomic, strong) IBOutlet UIButton *clearButton;

@end

@implementation DetailViewController

- (void)updateWithEntry:(Entry *)entry {
    self.entry = entry;
    
    self.textBox.text = entry.title;
    self.contentBox.text = entry.content;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textBox.delegate = self;
    self.contentBox.delegate = self;
    
    self.textBox.text = self.entry.title;
    self.contentBox.text = self.entry.content;
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"save" style:UIBarButtonItemStylePlain target:self action:@selector(save:)];
    self.navigationItem.rightBarButtonItem = saveButton;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)clearButton:(id)sender {
    self.textBox.text = nil;
    self.contentBox.text = nil;
}

- (void)save:(id)sender {
    
    if (!self.entry) {
        [[EntryController sharedInstance] addEntryWithTitle:self.textBox.text andText:self.textBox.text];
    } else {
        self.entry.title = self.textBox.text;
        self.entry.content = self.contentBox.text;
        self.entry.timestamp = [NSDate date];
        
        [[EntryController sharedInstance] synchronize];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
