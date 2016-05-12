//
//  DetailViewController.m
//  WORK6
//
//  Created by Admin on 12.05.16.
//  Copyright © 2016 SanSetSin. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize contact;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(NSManagedObjectContext *)managedObjectContext{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]){
        context = [delegate managedObjectContext];
    }
    return context;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if(self.contact){
        [self.firstNameField setText:[self.contact valueForKey:@"firstName"]];
        [self.lastNameField setText:[self.contact valueForKey:@"lastName"]];
        [self.phoneField setText:[self.contact valueForKey:@"phone"]];
        [self.emailField setText:[self.contact valueForKey:@"email"]];
        
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveBtn:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if(self.contact){
        [self.contact setValue:self.firstNameField.text forKey:@"firstName"];
        [self.contact setValue:self.lastNameField.text forKey:@"lastName"];
        [self.contact setValue:self.phoneField.text forKey:@"phone"];
        [self.contact setValue:self.emailField.text forKey:@"email"];
    }
    else {
        NSManagedObject *newContact = [NSEntityDescription insertNewObjectForEntityForName:@"Contact"
                                                                    inManagedObjectContext:context];
        [newContact setValue:self.firstNameField.text forKey:@"firstName"];
        [newContact setValue:self.lastNameField.text forKey:@"lastName"];
        [newContact setValue:self.phoneField.text forKey:@"phone"];
        [newContact setValue:self.emailField.text forKey:@"email"];
    }
    NSError *error = nil;
    if(![context save:&error]){
        NSLog(@"Can't save! %@ %@", error, [error localizedDescription]);
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ура!" message:@"Успешно добавлено!" delegate:self cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alert show];
    }
//- (IBAction)delBtn:(id)sender {
  //   NSLog(@"Unresolved error");
}
@end
