//
//  ViewController.m
//  ProfileEditor
//
//  Created by Conny Yang on 12/02/2017.
//  Copyright © 2017 Conny Yang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSString * firstName = [defaults objectForKey:@"firstName"];
    NSString * lastName = [defaults objectForKey:@"lastName"];
    NSString * address = [defaults objectForKey:@"address"];
    NSData * imgData = [defaults objectForKey:@"imgData"];
    UIImage * image = [UIImage imageWithData:imgData];
    
    self.firstNameText.text = firstName;
    self.lastNameText.text = lastName;
    self.addressText.text = address;
    self.profileImage.image = image;
    
    NSLog(@"View did Load");
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)chooseImageDidTap:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:true completion:nil];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *img = [info objectForKey:UIImagePickerControllerEditedImage];
    if(!img) img = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    self.profileImage.image = img;
    
    [self dismissViewControllerAnimated:true completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)saveProfile:(id)sender {
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    
    NSData * imgData = UIImagePNGRepresentation(self.profileImage.image);
    
    [defaults setObject:self.firstNameText.text forKey:@"firstName"];
    [defaults setObject:self.lastNameText.text forKey:@"lastName"];
    [defaults setObject:self.addressText.text forKey:@"address"];
    [defaults setObject:imgData forKey:@"imgData"];
    
    [defaults synchronize];
    
    // Add Alert Action after saving
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"Congratulations!" message:@"Your Profile Information is been saved!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:true completion:nil];
    }];
    [alertController addAction:action];
    [self presentViewController:alertController animated:true completion:nil];
}
@end
