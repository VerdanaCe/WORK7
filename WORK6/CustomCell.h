//
//  CustomCell.h
//  WORK6
//
//  Created by Admin on 12.05.16.
//  Copyright © 2016 SanSetSin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"
#import "Call.h"

@interface CustomCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;

- (IBAction)CallBtn:(id)sender;
- (IBAction)delBtn:(id)sender;
- (IBAction)editBtn:(id)sender;
- (void)setupWithContact:(NSManagedObject *)contact;

@end
