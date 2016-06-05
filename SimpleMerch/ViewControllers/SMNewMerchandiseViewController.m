//
//  SMNewMerchandiseViewController.m
//  SimpleMerch
//
//  Created by Seiler Hagan on 6/5/16.
//  Copyright © 2016 Seiler Hagan. All rights reserved.
//

#import "SMNewMerchandiseViewController.h"

#import "SMCategoryTypePickerViewController.h"

@interface SMNewMerchandiseViewController ()

@end

@implementation SMNewMerchandiseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"presentCategoryTypePickerSeque"]) {
        UINavigationController *segueNavigationController = segue.destinationViewController;
        SMCategoryTypePickerViewController *pickerViewController = (SMCategoryTypePickerViewController *) segueNavigationController.topViewController;
        pickerViewController.delegate = self;
    }
}

- (void)setCurrentlySelectedCategoryType:(NSString *)currentlySelectedCategoryType {
    NSLog(@"Set Currently Selected Type: %@", currentlySelectedCategoryType);
    _currentlySelectedCategoryType = currentlySelectedCategoryType;
    [self.categoryTypeButton setTitle:currentlySelectedCategoryType forState:UIControlStateNormal];
}

#pragma mark - Cancelling/Saving Merchandise
- (IBAction)cancelNewMerch:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveNewMerch:(id)sender {
//    TODO: Verify and Save information
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)selectMerchandiseImage:(id)sender {
}

@end
