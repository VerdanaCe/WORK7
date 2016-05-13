//
//  TableViewController.m
//  WORK6
//
//  Created by Admin on 12.05.16.
//  Copyright © 2016 SanSetSin. All rights reserved.
//

#import "TableViewController.h"
#import "DetailViewController.h"
#import "Contact.h"
#import "Call.h"
#import "CustomCell.h"

@interface TableViewController ()
@property (strong) NSMutableArray *contacts;
@end

@implementation TableViewController

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
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Contact"];
    self.contacts = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    [self.tableView reloadData];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (editingStyle == UITableViewCellEditingStyleDelete){
        [context deleteObject:[self.contacts objectAtIndex:indexPath.row]];
        
        NSError *error = nil;
        if(![context save:&error]){
            NSLog(@"Не удалилось! %@ %@", error, [error localizedDescription]);
            return;
        }
        
        [self.contacts removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.contacts.count;
}

 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell" forIndexPath:indexPath];
      NSManagedObject *contact = self.contacts[indexPath.row];
    [cell setupWithContact:contact];
 return cell;      }

#pragma mark - Navigation
      
      // In a storyboard-based application, you will often want to do a little preparation before navigation
      - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
    {
        if([[segue identifier] isEqualToString:@"addSegue"]){
            NSManagedObject *selectedContact = [self.contacts objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
            DetailViewController *destViewController = segue.destinationViewController;
            destViewController.contact = selectedContact;
            
        }
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
      
      
      @end

/*

 - (IBAction)CallBtn:(id)sender {
 NSString* message = [NSString stringWithFormat:@"You are calling %@ %@ \n %@", self.firstNameLabel.text,self.lastNameLabel.text, self.phoneLabel.text];
 UIAlertController* youCall = [UIAlertController alertControllerWithTitle:@"Calling"
 message:message
 preferredStyle:UIAlertControllerStyleAlert];
 UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
 style:UIAlertActionStyleCancel
 handler:^(UIAlertAction *action)
 { NSLog(@"was canceled") }
 ];
 UIAlertAction* saveAction = [UIAlertAction actionWithTitle:@"End Call"
 style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
 // save data into recents
 Call *newCall = [NSEntityDescription insertNewObjectForEntityForName:@"Call" inManagedObjectContext:_manager.context];
 NSString* _note = [NSString stringWithFormat:@"%@ %@ \n %@", self.firstNameLabel.text,self.lastNameLabel.text, self.phoneLabel.text];
 newCall setValue:[NSDate date] forKey:@"timeStamp"];
 newCall setValue: _note forKey:@"note"];
 };
 [youCall addAction:cancelAction];
 [youCall addAction:saveAction];
 [self presentViewController:youCallingWindow animated:true completion:nil];}
 
*/

