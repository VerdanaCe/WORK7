//
//  CustomCell.m
//  WORK6
//
//  Created by Admin on 12.05.16.
//  Copyright © 2016 SanSetSin. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (void)setupWithContact:(NSManagedObject *)contact {
    
   // self.idLabel.text = [contact.row];
    self.lastNameLabel.text = [contact valueForKey:@"lastName"];
    self.firstNameLabel.text = [contact valueForKey:@"firstName"];
    self.phoneLabel.text = [contact valueForKey:@"phone"];
    self.emailLabel.text = [contact valueForKey:@"email"];}
- (IBAction)delBtn:(id)sender {
     NSLog(@"Unresolved error");
}

- (IBAction)editBtn:(id)sender {
     NSLog(@"Unresolved error");
}
@end
