//
//  SMNewMerchandiseViewController.m
//  SimpleMerch
//
//  Created by Seiler Hagan on 6/5/16.
//  Copyright © 2016 Seiler Hagan. All rights reserved.
//

#import "SMNewMerchandiseViewController.h"

#import "NSString+Additions.h"
#import "SMAmount.h"
#import "SMCategory.h"
#import <MagicalRecord/MagicalRecord.h>

#define BLUE_TINT_COLOR [UIColor colorWithRed:0.0 green:122.0/255.0  blue:1.0 alpha:1.0]

static NSString *const kSmaExtraSmallAcronym = @"XS";
static NSString *const kSmaSmallAcronym = @"S";
static NSString *const kSmaMediumAcronym = @"M";
static NSString *const kSmaLargeAcronym = @"L";
static NSString *const kSmaExtraLargeAcronym = @"XL";
static NSString *const kSmaExtraExraLargeAcronym = @"XXL";
static NSString *const kSmaExtraExtraExtraLargeAcronym = @"XXXL";
static NSString *const kSmaAmountString = @"Amount";

typedef enum NewMerchTextFieldTags {
    SMNAME,
    SMAMOUNT
} NewMerchTextFieldTags;

@interface SMNewMerchandiseViewController () <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIToolbar *pickerViewToolbar;
@property (weak, nonatomic) IBOutlet UIPickerView *categoryPickerView;
@property (weak, nonatomic) IBOutlet UIButton *imageButton;
@property (weak, nonatomic) IBOutlet UIButton *chooseCategoryButton;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (weak, nonatomic) IBOutlet UIButton *extraExtraExtraLargeButton;
@property (weak, nonatomic) IBOutlet UIButton *extraSmallButton;
@property (weak, nonatomic) IBOutlet UIButton *smallButton;
@property (weak, nonatomic) IBOutlet UIButton *mediumButton;
@property (weak, nonatomic) IBOutlet UIButton *largeButton;
@property (weak, nonatomic) IBOutlet UIButton *extraLargeButton;
@property (weak, nonatomic) IBOutlet UIButton *extraExtraLargeButton;
@property (nonatomic) NSMutableArray *amountSizesArray;
@property (nonatomic) NSArray *categoryTitles;
@property (nonatomic) NSString *currentCategoryTitle;
@property (nonatomic) NSString *currentName;
@property (assign, nonatomic) NSInteger currentAmount;
@property (nonatomic) UIImage *currentImage;
@end

@implementation SMNewMerchandiseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.categoryPickerView.delegate = self;
    self.categoryPickerView.dataSource = self;
    self.nameTextField.delegate = self;
    self.nameTextField.tag = SMNAME;
    self.amountTextField.delegate = self;
    self.amountTextField.tag = SMAMOUNT;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)categoryTitles {
    if (!_categoryTitles) {
        _categoryTitles = @[@"Clothing", @"CD", @"Vinyl", @"Other"];
    }
    return _categoryTitles;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

#pragma mark - Cancelling/Saving Merchandise
- (IBAction)cancelNewMerch:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveNewMerch:(id)sender {
//    TODO: Verify and Save information
    [self selectedView:nil];

    if ([self validateInformation]) {
        [self saveMerch];
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Missing Information" message:@"Need highlighted information to be filled out to save." preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction: [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (BOOL)validateInformation {
    BOOL hasTitle = ![NSString isEmptyString:self.currentCategoryTitle];
    if (!hasTitle) {
        self.chooseCategoryButton.backgroundColor = [UIColor redColor];
    }
    BOOL hasName = ![NSString isEmptyString:self.currentName];
    if (!hasName) {
        self.nameTextField.backgroundColor = [UIColor redColor];
    }
    BOOL hasAmount = self.currentAmount > 0;
    if (!hasAmount) {
        self.amountTextField.backgroundColor = [UIColor redColor];
    }
    return hasTitle && hasName && hasAmount;
}

- (void)saveMerch {
    [MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
        SMCategory *newCategory = [SMCategory MR_createEntityInContext:localContext];
        newCategory.categoryType = self.currentCategoryTitle;
        newCategory.categoryName = self.currentName;
        if (self.currentImage) {
            newCategory.categoryImageData = UIImagePNGRepresentation(self.currentImage);
        }

        NSLog(@"Saved Merch: %@", newCategory.description);
        for (NSString *amountName in self.amountSizesArray) {
            SMAmount *amount = [SMAmount MR_createEntityInContext:localContext];
            amount.amountTitle = amountName;
            amount.amountValue = @(self.currentAmount);
            [newCategory.amountsSet addObject:amount];
            NSLog(@"Saved Amount: %@", amount.description);
        }
    }];
}

#pragma mark - Selecting Image

- (IBAction)selectMerchandiseImage:(id)sender {
}

#pragma mark - Dismissing Picker View
- (NSMutableArray *)amountSizesArray {
    if (!_amountSizesArray) {
        _amountSizesArray = [NSMutableArray new];
    }
    return _amountSizesArray;
}

- (IBAction)dismissPickerView:(id)sender {
    if ([NSString isEmptyString:self.currentCategoryTitle]) {
        NSInteger row = [self.categoryPickerView selectedRowInComponent:0];
        self.currentCategoryTitle = self.categoryTitles[row];
        [self.chooseCategoryButton setTitle:self.currentCategoryTitle forState:UIControlStateNormal];
    }
    self.categoryPickerView.hidden = YES;
    self.pickerViewToolbar.hidden = YES;

    self.amountSizesArray = nil;
    if ([self.currentCategoryTitle isEqualToString:@"Clothing"]) {
        self.extraSmallButton.hidden = NO;
        self.smallButton.hidden = NO;
        self.smallButton.backgroundColor = BLUE_TINT_COLOR;
        self.mediumButton.hidden = NO;
        self.mediumButton.backgroundColor = BLUE_TINT_COLOR;
        self.largeButton.hidden = NO;
        self.largeButton.backgroundColor = BLUE_TINT_COLOR;
        self.extraLargeButton.hidden = NO;
        self.extraExtraLargeButton.hidden = NO;
        self.extraExtraExtraLargeButton.hidden = NO;
        [self.amountSizesArray addObjectsFromArray:@[kSmaSmallAcronym, kSmaMediumAcronym, kSmaLargeAcronym]];
    } else {
        [self.amountSizesArray addObject:kSmaAmountString];
    }
}

#pragma mark - Button Actions
- (IBAction)extraSmall:(id)sender {
    [self setAndAddSize:self.extraSmallButton withSize:kSmaExtraSmallAcronym];
}

- (IBAction)small:(id)sender {
    [self setAndAddSize:self.smallButton withSize:kSmaSmallAcronym];
}

- (IBAction)medium:(id)sender {
    [self setAndAddSize:self.mediumButton withSize:kSmaMediumAcronym];
}

- (IBAction)large:(id)sender {
    [self setAndAddSize:self.largeButton withSize:kSmaLargeAcronym];
}

- (IBAction)extraLarge:(id)sender {
    [self setAndAddSize:self.extraLargeButton withSize:kSmaExtraLargeAcronym];
}

- (IBAction)extraExtraLarge:(id)sender {
    [self setAndAddSize:self.extraExtraLargeButton withSize:kSmaExtraExraLargeAcronym];
}

- (IBAction)extraExtraExtraLarge:(id)sender {
    [self setAndAddSize:self.extraExtraExtraLargeButton withSize:kSmaExtraExtraExtraLargeAcronym];
}


- (void)setAndAddSize:(UIButton *)button withSize:(NSString *)size {
    if (![button.backgroundColor isEqual: BLUE_TINT_COLOR]) {
        button.backgroundColor = BLUE_TINT_COLOR;
        [self.amountSizesArray addObject:size];
    } else {
        button.backgroundColor = [UIColor whiteColor];
        [self.amountSizesArray removeObject:size];
    }
}
#pragma mark - PickerView Actions
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.categoryTitles.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.categoryTitles[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (row > self.categoryTitles.count) {
        return;
    }
    self.currentCategoryTitle = self.categoryTitles[row];
    [self.chooseCategoryButton setTitle:self.currentCategoryTitle forState:UIControlStateNormal];
}

- (IBAction)showPickerView:(id)sender {
    self.categoryPickerView.hidden = NO;
    self.pickerViewToolbar.hidden = NO;

    self.chooseCategoryButton.backgroundColor = [UIColor whiteColor];
}

#pragma mark - Textfield Delegates
- (IBAction)selectedView:(id)sender {
    [self.view endEditing:YES];
    if (!self.categoryPickerView.hidden) {
        [self dismissPickerView:nil];
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.nameTextField.backgroundColor = [UIColor whiteColor];
    self.amountTextField.backgroundColor = [UIColor whiteColor];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    textField.text = @"";
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    switch (textField.tag) {
        case SMNAME:
            self.currentName = textField.text;
            break;

        case SMAMOUNT:
            self.currentAmount = textField.text.integerValue;
            break;

        default:
            break;
    }
    [textField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    if (textField.tag == SMNAME) {
        [self.amountTextField becomeFirstResponder];
    }

    return YES;
}

@end
