//
//  DetailViewController.m
//  DayX
//
//  Created by Devin Eror on 1/13/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <UITextFieldDelegate, UITextViewDelegate>
@property (strong, nonatomic) IBOutlet UITextField *textBox;
@property (strong, nonatomic) IBOutlet UITextView *contentBox;
@property (nonatomic, strong) IBOutlet UIButton *clearButton;

@end

@implementation DetailViewController

- (void)updateWithDictionary:(NSDictionary *)dictionary {
    self.textBox.text = dictionary[TitleKey];
    self.contentBox.text = dictionary[TextKey];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textBox.delegate = self;
    self.contentBox.delegate = self;
    
    self.textBox.placeholder = @"Subject...";
    
    NSDictionary *entry = [[NSUserDefaults standardUserDefaults] objectForKey:EntryKey];
    [self updateWithDictionary:entry];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView {
    [self save:textView];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self save:textField];
}

- (IBAction)clearButton:(id)sender {
    self.textBox.text = nil;
    self.contentBox.text = nil;
}

- (void)save:(id)sender {
    
    NSDictionary *entry = @{TitleKey: self.textBox.text, TextKey: self.contentBox.text};
    [[NSUserDefaults standardUserDefaults] setObject:entry forKey:EntryKey];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
