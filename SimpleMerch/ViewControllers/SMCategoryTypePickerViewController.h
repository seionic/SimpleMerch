//
//  SMCategoryTypePickerViewController.h
//  SimpleMerch
//
//  Created by Seiler Hagan on 6/5/16.
//  Copyright © 2016 Seiler Hagan. All rights reserved.
//

@import UIKit;

#import "SMCategoryTypePickerProtocol.h"

@interface SMCategoryTypePickerViewController : UIViewController

@property (nonatomic, weak) id<SMCategoryTypePickerProtocol> delegate;

@end
