//
//  DetailViewController.h
//  WORK6
//
//  Created by Admin on 12.05.16.
//  Copyright © 2016 SanSetSin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"
#import "Call.h"
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
- (IBAction)saveBtn:(id)sender;

//- (IBAction)delBtn:(id)sender;
@property (strong) NSManagedObject *contact;
@end
