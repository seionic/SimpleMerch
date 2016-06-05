//
//  SMNewMerchandiseViewController.h
//  SimpleMerch
//
//  Created by Seiler Hagan on 6/5/16.
//  Copyright © 2016 Seiler Hagan. All rights reserved.
//

@import UIKit;

#import "SMCategoryTypePickerProtocol.h"

@interface SMNewMerchandiseViewController : UIViewController <SMCategoryTypePickerProtocol>
@property (strong, nonatomic) NSString    *currentlySelectedCategoryType;

@property (weak, nonatomic  ) IBOutlet UITextField *categoryAmountTextField;
@property (weak, nonatomic  ) IBOutlet UIButton    *categoryImageButton;
@property (weak, nonatomic  ) IBOutlet UITextField *categoryNameTextField;
@property (weak, nonatomic  ) IBOutlet UIButton    *categoryTypeButton;

@end
