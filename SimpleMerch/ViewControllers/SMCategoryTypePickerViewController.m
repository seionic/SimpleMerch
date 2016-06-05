//
//  SMCategoryTypePickerViewController.m
//  SimpleMerch
//
//  Created by Seiler Hagan on 6/5/16.
//  Copyright © 2016 Seiler Hagan. All rights reserved.
//

#import "SMCategoryTypePickerViewController.h"

#import "SMGlobalConstants.h"

@interface SMCategoryTypePickerViewController () <UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *categoryTypePicker;
@property (strong, nonatomic) NSArray *categoryTypeArray;
@end

@implementation SMCategoryTypePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.categoryTypeArray = [[NSUserDefaults standardUserDefaults] objectForKey:kSmaCategoryTypesKey];
    self.categoryTypePicker.delegate = self;
    self.categoryTypePicker.dataSource = self;
    [self.delegate setCurrentlySelectedCategoryType:[self.categoryTypeArray firstObject]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UIPickerView Delegate Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.categoryTypeArray.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.categoryTypeArray[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    [self.delegate setCurrentlySelectedCategoryType:self.categoryTypeArray[row]];
}

- (IBAction)doneAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
